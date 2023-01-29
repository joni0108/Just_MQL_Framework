//+---------------------------------------------------------------------+
//|                                                          Socket.mqh |
//|                             Copyright 2022-2025, Just Up Coding LLC |
//|                                                http://www.justup.us |
//+---------------------------------------------------------------------+
//--- Original code at https://www.mql5.com/en/blogs/post/706665
//+---------------------------------------------------------------------+
//| ClientSocket & ServerSocket                                         |
//| Usage: Open client and server sockets in MQL4 & MQL5                |
//|                                                                     |
//+---------------------------------------------------------------------+
#property copyright "Copyright 2022-2025, Just Up Coding LLC"
#property link      "http://www.justup.us"

#define SOCKET_HANDLE32       uint
#define SOCKET_HANDLE64       ulong
#define AF_INET               2
#define SOCK_STREAM           1
#define IPPROTO_TCP           6
#define INVALID_SOCKET32      0xFFFFFFFF
#define INVALID_SOCKET64      0xFFFFFFFFFFFFFFFF
#define SOCKET_ERROR          -1
#define INADDR_NONE           0xFFFFFFFF
#define FIONBIO               0x8004667E
#define WSAWOULDBLOCK         10035

struct sockaddr {
   short family;
   ushort port;
   uint address;
   ulong ignore;
};

struct linger {
   ushort onoff;
   ushort linger_seconds;
};

// -------------------------------------------------------------
// DLL imports
// -------------------------------------------------------------

#import "ws2_32.dll"
   // Imports for 32-bit environment
   SOCKET_HANDLE32 socket(int, int, int); // Artificially differs from 64-bit version based on 3rd parameter
   int connect(SOCKET_HANDLE32, sockaddr&, int);
   int closesocket(SOCKET_HANDLE32);
   int send(SOCKET_HANDLE32, uchar&[],int,int);
   int recv(SOCKET_HANDLE32, uchar&[], int, int);
   int ioctlsocket(SOCKET_HANDLE32, uint, uint&);
   int bind(SOCKET_HANDLE32, sockaddr&, int);
   int listen(SOCKET_HANDLE32, int);
   SOCKET_HANDLE32 accept(SOCKET_HANDLE32, int, int);
   int WSAAsyncSelect(SOCKET_HANDLE32, int, uint, int);
   int shutdown(SOCKET_HANDLE32, int);
   
   // Imports for 64-bit environment
   SOCKET_HANDLE64 socket(int, int, uint); // Artificially differs from 32-bit version based on 3rd parameter
   int connect(SOCKET_HANDLE64, sockaddr&, int);
   int closesocket(SOCKET_HANDLE64);
   int send(SOCKET_HANDLE64, uchar&[], int, int);
   int recv(SOCKET_HANDLE64, uchar&[], int, int);
   int ioctlsocket(SOCKET_HANDLE64, uint, uint&);
   int bind(SOCKET_HANDLE64, sockaddr&, int);
   int listen(SOCKET_HANDLE64, int);
   SOCKET_HANDLE64 accept(SOCKET_HANDLE64, int, int);
   int WSAAsyncSelect(SOCKET_HANDLE64, long, uint, int);
   int shutdown(SOCKET_HANDLE64, int);

   // gethostbyname() has to vary between 32/64-bit, because
   // it returns a memory pointer whose size will be either
   // 4 bytes or 8 bytes. In order to keep the compiler
   // happy, we therefore need versions which take 
   // artificially-different parameters on 32/64-bit
   uint gethostbyname(uchar&[]); // For 32-bit
   ulong gethostbyname(char&[]); // For 64-bit

   // Neutral; no difference between 32-bit and 64-bit
   uint inet_addr(uchar&[]);
   int WSAGetLastError();
   uint htonl(uint);
   ushort htons(ushort);
#import

// For navigating the Winsock hostent structure, with indescribably horrible
// variation between 32-bit and 64-bit
#import "kernel32.dll"
   void RtlMoveMemory(uint&, uint, int);
   void RtlMoveMemory(ushort&, uint, int);
   void RtlMoveMemory(ulong&, ulong, int);
   void RtlMoveMemory(ushort&, ulong, int);
#import

// -------------------------------------------------------------
// Forward definitions of classes
// -------------------------------------------------------------

class ClientSocket;
class ServerSocket;


// -------------------------------------------------------------
// Client socket class
// -------------------------------------------------------------

class ClientSocket
{
   private:
      // Need different socket handles for 32-bit and 64-bit environments
      SOCKET_HANDLE32 mSocket32;
      SOCKET_HANDLE64 mSocket64;
      
      // Other state variables
      bool mConnected;
      int mLastWSAError;
      string mPendingReceiveData; // Backlog of incoming data, if using a message-terminator in Receive()
      
      // Event handling
      bool mDoneEventHandling;
      void SetupSocketEventHandling();
      
   public:
      // Constructors for connecting to a server, either locally or remotely
      ClientSocket(ushort localport);
      ClientSocket(string HostnameOrIPAddress, ushort port);

      // Constructors used by ServerSocket() when accepting a client connection
      ClientSocket(ServerSocket* ForInternalUseOnly, SOCKET_HANDLE32 ForInternalUseOnly_clientsocket32);
      ClientSocket(ServerSocket* ForInternalUseOnly, SOCKET_HANDLE64 ForInternalUseOnly_clientsocket64);

      // Destructor
      ~ClientSocket();
      
      // Simple send and receive methods
      bool Send(string strMsg);
      bool Send(uchar & callerBuffer[], int startAt = 0, int szToSend = -1);
      string Receive(string MessageSeparator = "");
      int Receive(uchar & callerBuffer[]);
      
      // State information
      bool IsSocketConnected() {return mConnected;}
      int GetLastSocketError() {return mLastWSAError;}
      ulong GetSocketHandle() {return (mSocket32 ? mSocket32 : mSocket64);}
      
      // Buffer sizes, overwriteable once the class has been created
      int ReceiveBufferSize;
      int SendBufferSize;
};


// -------------------------------------------------------------
// Constructor for a simple connection to 127.0.0.1
// -------------------------------------------------------------

ClientSocket::ClientSocket(ushort localport)
{
   // Default buffer sizes
   ReceiveBufferSize = 10000;
   SendBufferSize = 999999999;
   
   // Need to create either a 32-bit or 64-bit socket handle
   mConnected = false;
   mLastWSAError = 0;
   if (TerminalInfoInteger(TERMINAL_X64)) {
      uint proto = IPPROTO_TCP;
      mSocket64 = socket(AF_INET, SOCK_STREAM, proto);
      if (mSocket64 == INVALID_SOCKET64) {
         mLastWSAError = WSAGetLastError();
         #ifdef SOCKET_LIBRARY_LOGGING
            Print("socket() failed, 64-bit, error: ", mLastWSAError);
         #endif
         return;
      }
   } else {
      int proto = IPPROTO_TCP;
      mSocket32 = socket(AF_INET, SOCK_STREAM, proto);
      if (mSocket32 == INVALID_SOCKET32) {
         mLastWSAError = WSAGetLastError();
         #ifdef SOCKET_LIBRARY_LOGGING
            Print("socket() failed, 32-bit, error: ", mLastWSAError);
         #endif
         return;
      }
   }
   
   // Fixed definition for connecting to 127.0.0.1, with variable port
   sockaddr server;
   server.family = AF_INET;
   server.port = htons(localport);
   server.address = 0x100007f; // 127.0.0.1
   
   // connect() call has to differ between 32-bit and 64-bit
   int res;
   if (TerminalInfoInteger(TERMINAL_X64)) {
      res = connect(mSocket64, server, sizeof(sockaddr));
   } else {
      res = connect(mSocket32, server, sizeof(sockaddr));
   }
   if (res == SOCKET_ERROR) {
      // Ooops
      mLastWSAError = WSAGetLastError();
      #ifdef SOCKET_LIBRARY_LOGGING
         Print("connect() to localhost failed, error: ", mLastWSAError);
      #endif
      return;
   } else {
      mConnected = true;   
      
      // Set up event handling. Can fail if called in OnInit() when
      // MT4/5 is still loading, because no window handle is available
      #ifdef SOCKET_LIBRARY_USE_EVENTS
         SetupSocketEventHandling();
      #endif
   }
}

// -------------------------------------------------------------
// Constructor for connection to a hostname or IP address
// -------------------------------------------------------------

ClientSocket::ClientSocket(string HostnameOrIPAddress, ushort port)
{
   // Default buffer sizes
   ReceiveBufferSize = 10000;
   SendBufferSize = 999999999;

   // Need to create either a 32-bit or 64-bit socket handle
   mConnected = false;
   mLastWSAError = 0;
   if (TerminalInfoInteger(TERMINAL_X64)) {
      uint proto = IPPROTO_TCP;
      mSocket64 = socket(AF_INET, SOCK_STREAM, proto);
      if (mSocket64 == INVALID_SOCKET64) {
         mLastWSAError = WSAGetLastError();
         #ifdef SOCKET_LIBRARY_LOGGING
            Print("socket() failed, 64-bit, error: ", mLastWSAError);
         #endif
         return;
      }
   } else {
      int proto = IPPROTO_TCP;
      mSocket32 = socket(AF_INET, SOCK_STREAM, proto);
      if (mSocket32 == INVALID_SOCKET32) {
         mLastWSAError = WSAGetLastError();
         #ifdef SOCKET_LIBRARY_LOGGING
            Print("socket() failed, 32-bit, error: ", mLastWSAError);
         #endif
         return;
      }
   }

   // Is the host parameter an IP address?
   uchar arrName[];
   StringToCharArray(HostnameOrIPAddress, arrName);
   ArrayResize(arrName, ArraySize(arrName) + 1);
   uint addr = inet_addr(arrName);
   
   if (addr == INADDR_NONE) {
      // Not an IP address. Need to look up the name
      // .......................................................................................
      // Unbelievably horrible handling of the hostent structure depending on whether
      // we're in 32-bit or 64-bit, with different-length memory pointers. 
      // Ultimately, we're having to deal here with extracting a uint** from
      // the memory block provided by Winsock - and with additional 
      // complications such as needing different versions of gethostbyname(),
      // because the return value is a pointer, which is 4 bytes in x86 and
      // 8 bytes in x64. So, we must artifically pass different types of buffer
      // to gethostbyname() depending on the environment, so that the compiler
      // doesn't treat them as imports which differ only by their return type.
      if (TerminalInfoInteger(TERMINAL_X64)) {
         char arrName64[];
         ArrayResize(arrName64, ArraySize(arrName));
         for (int i = 0; i < ArraySize(arrName); i++) arrName64[i] = (char)arrName[i];
         ulong nres = gethostbyname(arrName64);
         if (nres == 0) {
            // Name lookup failed
            mLastWSAError = WSAGetLastError();
            #ifdef SOCKET_LIBRARY_LOGGING
               Print("Name-resolution in gethostbyname() failed, 64-bit, error: ", mLastWSAError);
            #endif
            return;
         } else {
            // Need to navigate the hostent structure. Very, very ugly...
            ushort addrlen;
            RtlMoveMemory(addrlen, nres + 18, 2);
            if (addrlen == 0) {
               // No addresses associated with name
               #ifdef SOCKET_LIBRARY_LOGGING
                  Print("Name-resolution in gethostbyname() returned no addresses, 64-bit, error: ", mLastWSAError);
               #endif
               return;
            } else {
               ulong ptr1, ptr2, ptr3;
               RtlMoveMemory(ptr1, nres + 24, 8);
               RtlMoveMemory(ptr2, ptr1, 8);
               RtlMoveMemory(ptr3, ptr2, 4);
               addr = (uint)ptr3;
            }
         }
      } else {
         uint nres = gethostbyname(arrName);
         if (nres == 0) {
            // Name lookup failed
            mLastWSAError = WSAGetLastError();
            #ifdef SOCKET_LIBRARY_LOGGING
               Print("Name-resolution in gethostbyname() failed, 32-bit, error: ", mLastWSAError);
            #endif
            return;
         } else {
            // Need to navigate the hostent structure. Very, very ugly...
            ushort addrlen;
            RtlMoveMemory(addrlen, nres + 10, 2);
            if (addrlen == 0) {
               // No addresses associated with name
               #ifdef SOCKET_LIBRARY_LOGGING
                  Print("Name-resolution in gethostbyname() returned no addresses, 32-bit, error: ", mLastWSAError);
               #endif
               return;
            } else {
               int ptr1, ptr2;
               RtlMoveMemory(ptr1, nres + 12, 4);
               RtlMoveMemory(ptr2, ptr1, 4);
               RtlMoveMemory(addr, ptr2, 4);
            }
         }
      }
   
   } else {
      // The HostnameOrIPAddress parameter is an IP address,
      // which we have stored in addr
   }

   // Fill in the address and port into a sockaddr_in structure
   sockaddr server;
   server.family = AF_INET;
   server.port = htons(port);
   server.address = addr; // Already in network-byte-order

   // connect() call has to differ between 32-bit and 64-bit
   int res;
   if (TerminalInfoInteger(TERMINAL_X64)) {
      res = connect(mSocket64, server, sizeof(sockaddr));
   } else {
      res = connect(mSocket32, server, sizeof(sockaddr));
   }
   if (res == SOCKET_ERROR) {
      // Ooops
      mLastWSAError = WSAGetLastError();
      #ifdef SOCKET_LIBRARY_LOGGING
         Print("connect() to server failed, error: ", mLastWSAError);
      #endif
   } else {
      mConnected = true;   

      // Set up event handling. Can fail if called in OnInit() when
      // MT4/5 is still loading, because no window handle is available
      #ifdef SOCKET_LIBRARY_USE_EVENTS
         SetupSocketEventHandling();
      #endif
   }
}

// -------------------------------------------------------------
// Constructors for internal use only, when accepting connections
// on a server socket
// -------------------------------------------------------------

ClientSocket::ClientSocket(ServerSocket* ForInternalUseOnly, SOCKET_HANDLE32 ForInternalUseOnly_clientsocket32)
{
   // Constructor ror "internal" use only, when accepting an incoming connection
   // on a server socket
   mConnected = true;
   ReceiveBufferSize = 10000;
   SendBufferSize = 999999999;

   mSocket32 = ForInternalUseOnly_clientsocket32;
}

ClientSocket::ClientSocket(ServerSocket* ForInternalUseOnly, SOCKET_HANDLE64 ForInternalUseOnly_clientsocket64)
{
   // Constructor ror "internal" use only, when accepting an incoming connection
   // on a server socket
   mConnected = true;
   ReceiveBufferSize = 10000;
   SendBufferSize = 999999999;

   mSocket64 = ForInternalUseOnly_clientsocket64;
}


// -------------------------------------------------------------
// Destructor. Close the socket if created
// -------------------------------------------------------------

ClientSocket::~ClientSocket()
{
   if (TerminalInfoInteger(TERMINAL_X64)) {
      if (mSocket64 != 0) {
         shutdown(mSocket64, 2);
         closesocket(mSocket64);
      }
   } else {
      if (mSocket32 != 0) {
         shutdown(mSocket32, 2);
         closesocket(mSocket32);
      }
   }   
}

// -------------------------------------------------------------
// Simple send function which takes a string parameter
// -------------------------------------------------------------

bool ClientSocket::Send(string strMsg)
{
   if (!mConnected) return false;

   // Make sure that event handling is set up, if requested
   #ifdef SOCKET_LIBRARY_USE_EVENTS
      SetupSocketEventHandling();
   #endif 

   int szToSend = StringLen(strMsg);
   if (szToSend == 0) return true; // Ignore empty strings
      
   bool bRetval = true;
   uchar arr[];
   StringToCharArray(strMsg, arr);
   
   while (szToSend > 0) {
      int res, szAmountToSend = (szToSend > SendBufferSize ? SendBufferSize : szToSend);
      if (TerminalInfoInteger(TERMINAL_X64)) {
         res = send(mSocket64, arr, szToSend, 0);
      } else {
         res = send(mSocket32, arr, szToSend, 0);
      }
      
      if (res == SOCKET_ERROR || res == 0) {
         mLastWSAError = WSAGetLastError();
         if (mLastWSAError == WSAWOULDBLOCK) {
            // Blocking operation. Retry.
         } else {
            #ifdef SOCKET_LIBRARY_LOGGING
               Print("send() failed, error: ", mLastWSAError);
            #endif

            // Assume death of socket for any other type of error
            szToSend = -1;
            bRetval = false;
            mConnected = false;
         }
      } else {
         szToSend -= res;
         if (szToSend > 0) {
            // If further data remains to be sent, shuffle the array downwards
            // by copying it onto itself. Note that the MQL4/5 documentation
            // says that the result of this is "undefined", but it seems
            // to work reliably in real life (because it almost certainly
            // just translates inside MT4/5 into a simple call to RtlMoveMemory,
            // which does allow overlapping source & destination).
            ArrayCopy(arr, arr, 0, res, szToSend);
         }
      }
   }

   return bRetval;
}


// -------------------------------------------------------------
// Simple send function which takes an array of uchar[], 
// instead of a string. Can optionally be given a start-index
// within the array (rather then default zero) and a number 
// of bytes to send.
// -------------------------------------------------------------

bool ClientSocket::Send(uchar & callerBuffer[], int startAt = 0, int szToSend = -1)
{
   if (!mConnected) return false;

   // Make sure that event handling is set up, if requested
   #ifdef SOCKET_LIBRARY_USE_EVENTS
      SetupSocketEventHandling();
   #endif 

   // Process the start-at and send-size parameters
   int arraySize = ArraySize(callerBuffer);
   if (!arraySize) return true; // Ignore empty arrays 
   if (startAt >= arraySize) return true; // Not a valid start point; nothing to send
   if (szToSend <= 0) szToSend = arraySize;
   if (startAt + szToSend > arraySize) szToSend = arraySize - startAt;
   
   // Take a copy of the array 
   uchar arr[];
   ArrayResize(arr, szToSend);
   ArrayCopy(arr, callerBuffer, 0, startAt, szToSend);   
      
   bool bRetval = true;
   
   while (szToSend > 0) {
      int res, szAmountToSend = (szToSend > SendBufferSize ? SendBufferSize : szToSend);
      if (TerminalInfoInteger(TERMINAL_X64)) {
         res = send(mSocket64, arr, szToSend, 0);
      } else {
         res = send(mSocket32, arr, szToSend, 0);
      }
      
      if (res == SOCKET_ERROR || res == 0) {
         mLastWSAError = WSAGetLastError();
         if (mLastWSAError == WSAWOULDBLOCK) {
            // Blocking operation. Retry.
         } else {
            #ifdef SOCKET_LIBRARY_LOGGING
               Print("send() failed, error: ", mLastWSAError);
            #endif

            // Assume death of socket for any other type of error
            szToSend = -1;
            bRetval = false;
            mConnected = false;
         }
      } else {
         szToSend -= res;
         if (szToSend > 0) {
            // If further data remains to be sent, shuffle the array downwards
            // by copying it onto itself. Note that the MQL4/5 documentation
            // says that the result of this is "undefined", but it seems
            // to work reliably in real life (because it almost certainly
            // just translates inside MT4/5 into a simple call to RtlMoveMemory,
            // which does allow overlapping source & destination).
            ArrayCopy(arr, arr, 0, res, szToSend);
         }
      }
   }

   return bRetval;
}


// -------------------------------------------------------------
// Simple receive function. Without a message separator,
// it simply returns all the data sitting on the socket.
// With a separator, it stores up incoming data until
// it sees the separator, and then returns the text minus
// the separator.
// Returns a blank string once no (more) data is waiting
// for collection.
// -------------------------------------------------------------

string ClientSocket::Receive(string MessageSeparator = "")
{
   if (!mConnected) return "";

   // Make sure that event handling is set up, if requested
   #ifdef SOCKET_LIBRARY_USE_EVENTS
      SetupSocketEventHandling();
   #endif
   
   string strRetval = "";
   
   uchar arrBuffer[];
   ArrayResize(arrBuffer, ReceiveBufferSize);

   uint nonblock = 1;
   if (TerminalInfoInteger(TERMINAL_X64)) {
      ioctlsocket(mSocket64, FIONBIO, nonblock);
 
      int res = 1;
      while (res > 0) {
         res = recv(mSocket64, arrBuffer, ReceiveBufferSize, 0);
         if (res > 0) {
            StringAdd(mPendingReceiveData, CharArrayToString(arrBuffer, 0, res));

         } else if (res == 0) {
            // Socket closed
		    #ifdef SOCKET_LIBRARY_LOGGING
			   Print("Socket closed");
		    #endif
		    mConnected = false;

         } else {
            mLastWSAError = WSAGetLastError();

            if (mLastWSAError != WSAWOULDBLOCK) {
               #ifdef SOCKET_LIBRARY_LOGGING
                  Print("recv() failed, result:, " , res, ", error: ", mLastWSAError, " queued bytes: " , StringLen(mPendingReceiveData));
               #endif
               mConnected = false;
            }
         }
      }
   } else {
      ioctlsocket(mSocket32, FIONBIO, nonblock);

      int res = 1;
      while (res > 0) {
         res = recv(mSocket32, arrBuffer, ReceiveBufferSize, 0);
         if (res > 0) {
            StringAdd(mPendingReceiveData, CharArrayToString(arrBuffer, 0, res));

         } else if (res == 0) {
            // Socket closed
		    #ifdef SOCKET_LIBRARY_LOGGING
			   Print("Socket closed");
		    #endif
		    mConnected = false;
         
         } else {
            mLastWSAError = WSAGetLastError();

            if (mLastWSAError != WSAWOULDBLOCK) {
               #ifdef SOCKET_LIBRARY_LOGGING
                  Print("recv() failed, result:, " , res, ", error: ", mLastWSAError, " queued bytes: " , StringLen(mPendingReceiveData));
               #endif
               mConnected = false;
            }
         }
      }
   }   
   
   if (mPendingReceiveData == "") {
      // No data
      
   } else if (MessageSeparator == "") {
      // No requested message separator to wait for
      strRetval = mPendingReceiveData;
      mPendingReceiveData = "";
   
   } else {
      int idx = StringFind(mPendingReceiveData, MessageSeparator);
      if (idx >= 0) {
         while (idx == 0) {
            mPendingReceiveData = StringSubstr(mPendingReceiveData, idx + StringLen(MessageSeparator));
            idx = StringFind(mPendingReceiveData, MessageSeparator);
         }
         
         strRetval = StringSubstr(mPendingReceiveData, 0, idx);
         mPendingReceiveData = StringSubstr(mPendingReceiveData, idx + StringLen(MessageSeparator));
      }
   }
   
   return strRetval;
}

// -------------------------------------------------------------
// Receive function which fills an array, provided by reference.
// Always clears the array. Returns the number of bytes 
// put into the array.
// If you send and receive binary data, then you can no longer 
// use the built-in messaging protocol provided by this library's
// option to process a message terminator such as \r\n. You have
// to implement the messaging yourself.
// -------------------------------------------------------------

int ClientSocket::Receive(uchar & callerBuffer[])
{
   if (!mConnected) return 0;

   ArrayResize(callerBuffer, 0);
   int ctTotalReceived = 0;
   
   // Make sure that event handling is set up, if requested
   #ifdef SOCKET_LIBRARY_USE_EVENTS
      SetupSocketEventHandling();
   #endif
   
   uchar arrBuffer[];
   ArrayResize(arrBuffer, ReceiveBufferSize);

   uint nonblock = 1;
   if (TerminalInfoInteger(TERMINAL_X64)) {
      ioctlsocket(mSocket64, FIONBIO, nonblock);
   } else {
      ioctlsocket(mSocket32, FIONBIO, nonblock);
   }

   int res = 1;
   while (res > 0) {
      if (TerminalInfoInteger(TERMINAL_X64)) {
         res = recv(mSocket64, arrBuffer, ReceiveBufferSize, 0);
      } else {
         res = recv(mSocket32, arrBuffer, ReceiveBufferSize, 0);
      }
      
      if (res > 0) {
         ArrayResize(callerBuffer, ctTotalReceived + res);
         ArrayCopy(callerBuffer, arrBuffer, ctTotalReceived, 0, res);
         ctTotalReceived += res;

      } else if (res == 0) {
		 // Socket closed
		 #ifdef SOCKET_LIBRARY_LOGGING
		    Print("Socket closed");
		 #endif
		 mConnected = false;

      } else {
         mLastWSAError = WSAGetLastError();

         if (mLastWSAError != WSAWOULDBLOCK) {
            #ifdef SOCKET_LIBRARY_LOGGING
               Print("recv() failed, result:, " , res, ", error: ", mLastWSAError);
            #endif
            mConnected = false;
         }
      }
   }
   
   return ctTotalReceived;
}

// -------------------------------------------------------------
// Event handling in client socket
// -------------------------------------------------------------

void ClientSocket::SetupSocketEventHandling()
{
   #ifdef SOCKET_LIBRARY_USE_EVENTS
      if (mDoneEventHandling) return;
      
      // Can only do event handling in an EA. Ignore otherwise.
      if (MQLInfoInteger(MQL_PROGRAM_TYPE) != PROGRAM_EXPERT) {
         mDoneEventHandling = true;
         return;
      }
      
      long hWnd = ChartGetInteger(0, CHART_WINDOW_HANDLE);
      if (!hWnd) return;
      mDoneEventHandling = true; // Don't actually care whether it succeeds.
      
      if (TerminalInfoInteger(TERMINAL_X64)) {
         WSAAsyncSelect(mSocket64, hWnd, 0x100 /* WM_KEYDOWN */, 0xFF /* All events */);
      } else {
         WSAAsyncSelect(mSocket32, (int)hWnd, 0x100 /* WM_KEYDOWN */, 0xFF /* All events */);
      }
   #endif
}


// -------------------------------------------------------------
// Server socket class
// -------------------------------------------------------------

class ServerSocket
{
   private:
      // Need different socket handles for 32-bit and 64-bit environments
      SOCKET_HANDLE32 mSocket32;
      SOCKET_HANDLE64 mSocket64;

      // Other state variables
      bool mCreated;
      int mLastWSAError;
      
      // Optional event handling
      void SetupSocketEventHandling();
      bool mDoneEventHandling;
                 
   public:
      // Constructor, specifying whether we allow remote connections
      ServerSocket(ushort ServerPort, bool ForLocalhostOnly);
      
      // Destructor
      ~ServerSocket();
      
      // Accept function, which returns NULL if no waiting client, or
      // a new instace of ClientSocket()
      ClientSocket * Accept();

      // Access to state information
      bool Created() {return mCreated;}
      int GetLastSocketError() {return mLastWSAError;}
      ulong GetSocketHandle() {return (mSocket32 ? mSocket32 : mSocket64);}
};


// -------------------------------------------------------------
// Constructor for server socket
// -------------------------------------------------------------

ServerSocket::ServerSocket(ushort serverport, bool ForLocalhostOnly)
{
   // Create socket and make it non-blocking
   mCreated = false;
   mLastWSAError = 0;
   if (TerminalInfoInteger(TERMINAL_X64)) {
      // Force compiler to use the 64-bit version of socket() 
      // by passing it a uint 3rd parameter 
      uint proto = IPPROTO_TCP;
      mSocket64 = socket(AF_INET, SOCK_STREAM, proto);
      
      if (mSocket64 == INVALID_SOCKET64) {
         mLastWSAError = WSAGetLastError();
         #ifdef SOCKET_LIBRARY_LOGGING
            Print("socket() failed, 64-bit, error: ", mLastWSAError);
         #endif
         return;
      }
      uint nonblock = 1;
      ioctlsocket(mSocket64, FIONBIO, nonblock);

   } else {
      // Force compiler to use the 32-bit version of socket() 
      // by passing it a int 3rd parameter 
      int proto = IPPROTO_TCP;
      mSocket32 = socket(AF_INET, SOCK_STREAM, proto);
      
      if (mSocket32 == INVALID_SOCKET32) {
         mLastWSAError = WSAGetLastError();
         #ifdef SOCKET_LIBRARY_LOGGING
            Print("socket() failed, 32-bit, error: ", mLastWSAError);
         #endif
         return;
      }
      uint nonblock = 1;
      ioctlsocket(mSocket32, FIONBIO, nonblock);
   }

   // Try a bind
   sockaddr server;
   server.family = AF_INET;
   server.port = htons(serverport);
   server.address = (ForLocalhostOnly ? 0x100007f : 0); // 127.0.0.1 or INADDR_ANY

   if (TerminalInfoInteger(TERMINAL_X64)) {
      int bindres = bind(mSocket64, server, sizeof(sockaddr));
      if (bindres != 0) {
         // Bind failed
         mLastWSAError = WSAGetLastError();
         #ifdef SOCKET_LIBRARY_LOGGING
            Print("bind() failed, 64-bit, port probably already in use, error: ", mLastWSAError);
         #endif
         return;
         
      } else {
         int listenres = listen(mSocket64, 10);
         if (listenres != 0) {
            // Listen failed
            mLastWSAError = WSAGetLastError();
            #ifdef SOCKET_LIBRARY_LOGGING
               Print("listen() failed, 64-bit, error: ", mLastWSAError);
            #endif
            return;
            
         } else {
            mCreated = true;         
         }
      }
   } else {
      int bindres = bind(mSocket32, server, sizeof(sockaddr));
      if (bindres != 0) {
         // Bind failed
         mLastWSAError = WSAGetLastError();
         #ifdef SOCKET_LIBRARY_LOGGING
            Print("bind() failed, 32-bit, port probably already in use, error: ", mLastWSAError);
         #endif
         return;
         
      } else {
         int listenres = listen(mSocket32, 10);
         if (listenres != 0) {
            // Listen failed
            mLastWSAError = WSAGetLastError();
            #ifdef SOCKET_LIBRARY_LOGGING
               Print("listen() failed, 32-bit, error: ", mLastWSAError);
            #endif
            return;
            
         } else {
            mCreated = true;         
         }
      }
   }
   
   // Try settig up event handling; can fail here in constructor
   // if no window handle is available because it's being called 
   // from OnInit() while MT4/5 is loading
   #ifdef SOCKET_LIBRARY_USE_EVENTS
      SetupSocketEventHandling();
   #endif
}


// -------------------------------------------------------------
// Destructor. Close the socket if created
// -------------------------------------------------------------

ServerSocket::~ServerSocket()
{
   if (TerminalInfoInteger(TERMINAL_X64)) {
      if (mSocket64 != 0)  closesocket(mSocket64);
   } else {
      if (mSocket32 != 0)  closesocket(mSocket32);
   }   
}

// -------------------------------------------------------------
// Accepts any incoming connection. Returns either NULL,
// or an instance of ClientSocket
// -------------------------------------------------------------

ClientSocket * ServerSocket::Accept()
{
   if (!mCreated) return NULL;
   
   // Make sure that event handling is in place; can fail in constructor
   // if no window handle is available because it's being called 
   // from OnInit() while MT4/5 is loading
   #ifdef SOCKET_LIBRARY_USE_EVENTS
      SetupSocketEventHandling();
   #endif
   
   ClientSocket * pClient = NULL;

   if (TerminalInfoInteger(TERMINAL_X64)) {
      SOCKET_HANDLE64 acc = accept(mSocket64, 0, 0);
      if (acc != INVALID_SOCKET64) {
         pClient = new ClientSocket(NULL, acc);
      }
   } else {
      SOCKET_HANDLE32 acc = accept(mSocket32, 0, 0);
      if (acc != INVALID_SOCKET32) {
         pClient = new ClientSocket(NULL, acc);
      }
   }

   return pClient;
}

// -------------------------------------------------------------
// Event handling
// -------------------------------------------------------------

void ServerSocket::SetupSocketEventHandling()
{
   #ifdef SOCKET_LIBRARY_USE_EVENTS
      if (mDoneEventHandling) return;
   
      // Can only do event handling in an EA. Ignore otherwise.
      if (MQLInfoInteger(MQL_PROGRAM_TYPE) != PROGRAM_EXPERT) {
         mDoneEventHandling = true;
         return;
      }
    
      long hWnd = ChartGetInteger(0, CHART_WINDOW_HANDLE);
      if (!hWnd) return;
      mDoneEventHandling = true; // Don't actually care whether it succeeds.
      
      if (TerminalInfoInteger(TERMINAL_X64)) {
         WSAAsyncSelect(mSocket64, hWnd, 0x100 /* WM_KEYDOWN */, 0xFF /* All events */);
      } else {
         WSAAsyncSelect(mSocket32, (int)hWnd, 0x100 /* WM_KEYDOWN */, 0xFF /* All events */);
      }
   #endif
}