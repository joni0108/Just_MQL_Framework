//+------------------------------------------------------------------+
//|                                                     Telegram.mqh |
//|                                   Copyright 2023, Just Up Coding |
//|                                            https://www.justup.us |
//+------------------------------------------------------------------+
#property copyright "Copyright 2023, Just Up Coding"
#property link      "https://www.justup.us"
#property strict

//+------------------------------------------------------------------+
//| Class CTelegram                                                  |
//| Usage: Communicate with a telegram channel and send content      |
//|                 to it using a telegram bot token & chat id       |
//+------------------------------------------------------------------+

#ifdef __MQL4__
#define UrlDefinedError 4066
#endif
#ifdef  __MQL5__
#define UrlDefinedError 4014
#endif

string TelegramApiUrl = "https://api.telegram.org";

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class CTelegram
  {
public:
   void              Constructor(string telegramToken, string telegramChatId);
   bool              SendMessage(string message, string filePath = "");
private:
   string            m_telegramToken;
   string            m_telegramChatId;
  } _telegram;

//--- Class constructor
void CTelegram::Constructor(string telegramToken, string telegramChatId)
  {
   m_telegramToken = telegramToken;
   m_telegramChatId = telegramChatId;
  }

//--- Send a message to Telegram
bool CTelegram::SendMessage(string message, string filePath)
  {
   string headers    = "";
   string requestUrl = "";
   char   postData[];
   char   resultData[];
   string resultHeaders;
   int    timeout = 5000; // 1 second, may be too short for a slow connection
   string url = TelegramApiUrl;
   string token = m_telegramToken;
   string chat = m_telegramChatId;

   ResetLastError();

   if(filePath == "")
     {
      requestUrl =
         StringFormat("%s/bot%s/sendmessage?chat_id=%s&text=%s", url, token, chat, message);
     }
   else
     {
      requestUrl = StringFormat("%s/bot%s/sendPhoto", url, token);
      if(!GetPostData(postData, headers, chat, message, filePath))
        {
         return (false);
        }
     }

   ResetLastError();
   int response =
      WebRequest("POST", requestUrl, headers, timeout, postData, resultData, resultHeaders);

   switch(response)
     {
      case -1:
        {
         int errorCode = GetLastError();
         Print("Error in WebRequest. Error code  =", errorCode);
         if(errorCode == UrlDefinedError)
           {
            //--- url may not be listed
            PrintFormat("Add the address '%s' in the list of allowed URLs", url);
           }
         break;
        }
      case 200:
         //--- Success
         Print("The message has been successfully sent");
         break;
      default:
        {
         string result = CharArrayToString(resultData);
         PrintFormat("Unexpected Response '%i', '%s'", response, result);
         break;
        }
     }

   return (response == 200);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool GetPostData(char &postData[], string &headers, string chat, string text, string fileName)
  {

   ResetLastError();

   if(!FileIsExist(fileName))
     {
      PrintFormat("File '%s' does not exist", fileName);
      return (false);
     }

   int flags = FILE_READ | FILE_BIN;
   int file  = FileOpen(fileName, flags);
   if(file == INVALID_HANDLE)
     {
      int err = GetLastError();
      PrintFormat("Could not open file '%s', error=%i", fileName, err);
      return (false);
     }

   int   fileSize = (int)FileSize(file);
   uchar photo[];
   ArrayResize(photo, fileSize);
   FileReadArray(file, photo, 0, fileSize);
   FileClose(file);

   string hash = "";
   AddPostData(postData, hash, "chat_id", chat);
   if(StringLen(text) > 0)
     {
      AddPostData(postData, hash, "caption", text);
     }
   AddPostData(postData, hash, "photo", photo, fileName);
   ArrayCopy(postData, "--" + hash + "--\r\n");

   headers = "Content-Type: multipart/form-data; boundary=" + hash + "\r\n";

   return (true);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void AddPostData(uchar &data[], string &hash, string key = "", string value = "")
  {

   uchar valueArr[];
   StringToCharArray(value, valueArr, 0, StringLen(value));

   AddPostData(data, hash, key, valueArr);
   return;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void AddPostData(uchar &data[], string &hash, string key, uchar &value[], string fileName = "")
  {

   if(hash == "")
     {
      hash = Hash();
     }

   ArrayCopy(data, "\r\n");
   ArrayCopy(data, "--" + hash + "\r\n");
   if(fileName == "")
     {
      ArrayCopy(data, "Content-Disposition: form-data; name=\"" + key + "\"\r\n");
     }
   else
     {
      ArrayCopy(data, "Content-Disposition: form-data; name=\"" + key + "\"; filename=\"" +
                fileName + "\"\r\n");
     }
   ArrayCopy(data, "\r\n");
   ArrayCopy(data, value, ArraySize(data));
   ArrayCopy(data, "\r\n");

   return;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void ArrayCopy(uchar &dst[], string src)
  {

   uchar srcArray[];
   StringToCharArray(src, srcArray, 0, StringLen(src));
   ArrayCopy(dst, srcArray, ArraySize(dst), 0, ArraySize(srcArray));
   return;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string Hash()
  {

   uchar  tmp[];
   string seed = IntegerToString(TimeCurrent());
   int    len  = StringToCharArray(seed, tmp, 0, StringLen(seed));
   string hash = "";
   for(int i = 0; i < len; i++)
      hash += StringFormat("%02X", tmp[i]);
   hash = StringSubstr(hash, 0, 16);

   return (hash);
  }

//--- End of File
//+------------------------------------------------------------------+
