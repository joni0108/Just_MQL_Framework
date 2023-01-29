# ClientSocket & ServerSocket
These classes allows you to open clients and servers sockets using DLLs.

### Table of content
- [ClientSocket \& ServerSocket](#clientsocket--serversocket)
    - [Table of content](#table-of-content)
- [Installation](#installation)
    - [Installation of a socket for client](#installation-of-a-socket-for-client)
- [Usage](#usage)
  - [Check if the socket is still connected](#check-if-the-socket-is-still-connected)
  - [Sending information](#sending-information)
  - [Closing the socket](#closing-the-socket)
    - [For Client](#for-client)
- [Sockets for server](#sockets-for-server)
    - [Notes](#notes)
- [Example](#example)
    - [Requirements to run:](#requirements-to-run)
    - [Credits](#credits)
    - [Usage](#usage-1)
  - [Server | Python](#server--python)
  - [Client | MQL](#client--mql)

# Installation
1. **You need to call the framework in the beginning of your script, see the main [README](../README.md) file for more information.**
2. Allow DLLs import in your project.
3. Make a new `class object` of the `ServerSocket` or `ClientSocket` class using the following code:

### Installation of a socket for client
```cpp
ClientSocket * clientSocket = NULL;

int OnInit()
{
    //Check if the socket is not already created
    if(!clientSocket)
    {
        clientSocket = new ClientSocket(<host>, <port>); //Using only the port as parameter will make the class use the localhost.
    }

    //Check if the socket is connected
    if(clientSocket.IsSocketConnected == true)
    {
        //Actions with the socket like sending or receiving data.
    }
    else
    {
        delete clientSocket;
        clientSocket = NULL;
    }

    return INIT_SUCCEEDED;
}
```

# Usage
## Check if the socket is still connected
```cpp
if(clientSocket.IsSocketConnected())
{
    //Socket is connected
}
```

## Sending information
```cpp
clientSocket.Send(<message_string> + "\n");
```

## Closing the socket
You must close the sockets while leaving the EA in your `OnDeinit()` function. Use: <br>

### For Client
```cpp
if (clientSocket) 
{
      delete clientSocket;
      clientSocket = NULL;
}
```

# Sockets for server
In order to see the usage for opening a server socket, click [here](https://www.mql5.com/en/blogs/post/706665). <br>

### Notes
This library is being edited for an easiest way to use the sockets for the server side. That is the reason why I do not include the documentation for the server and redirect you to the official release.

# Example
In this example, will be 2 codes, one for Python, and another for MQL. <br>
The python code will serve as a server, and the MQL code will execute a client connection and send messages to the python server socket.

### Requirements to run:
- [x] Have Python3 installed in your system.
- [x] Have Visual Studio or any other IDE that supports python
- [x] Run the MQL script into an `.mq4` or `.mq5` file compiled.

### Credits
- Python script from Kevin De La Coba Malam in [Youtube](https://www.youtube.com/watch?v=qHc3l8Hkr14).

### Usage
1. Copy the python code into a file with extension `.py`.
2. Run it to open the server socket.
3. Copy the MQL code into an `.mq4` or `.mq5` and compile it using the Metaeditor.
4. Run the EA in your Metatrader Platform.

The client socket (MQL) will connect to the server socket (python), send 2 messages and close the connection by using the "KILL" message

## Server | Python
```python
import socket

port = 8080

serversocket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
serversocket.bind(("localhost", port))
serversocket.listen(10)

connection, addr = serversocket.accept()
print("[INFO] Connection stablished from:", addr)

msg = ""
while not "KILL" in msg:
    msg = connection.recv(1024).decode()
    print("[MESSAGE]", msg)

connection.close()
serversocket.close()
```

## Client | MQL
```cpp
#include <Just_MQL_Framework/main.mqh>

ClientSocket * clientSocket = NULL;

int port = 8080;

int OnInit()
{
    //Check if the socket is not already created
    if(!clientSocket)
    {
        clientSocket = new ClientSocket(port); //Using only the port as parameter will make the class use the localhost.
    }

    //Check if the socket is connected
    if(clientSocket.IsSocketConnected == true)
    {
        //Actions with the socket like sending or receiving data.
        clientSocket.Send("Hello world!" + "\n");
        clientSocket.Send("Ok, Bye!" + "\n");
        clientSocket.Send("KILL" + "\n");
    }
    else
    {
        delete clientSocket;
        clientSocket = NULL;
    }

    ExpertRemove();
    return INIT_SUCCEEDED;
}

//Close the socket onFinish
void OnDeinit()
{
    delete clientSocket;
    clientSocket = NULL;
}
```