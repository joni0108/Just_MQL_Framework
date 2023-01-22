//+------------------------------------------------------------------+
//|                                                      Discord.mqh |
//|                                   Copyright 2023, Just Up Coding |
//|                                            https://www.justup.us |
//+------------------------------------------------------------------+
#property copyright "Copyright 2023, Just Up Coding"
#property link      "https://www.justup.us"
#property strict
//+------------------------------------------------------------------+
//| Class CDiscord                                                   |
//| Usage: Communicate with a discord channel and send content       |
//|                 to it using the channel webhook                  |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class CDiscord
  {
public:
   void              Constructor(string webhook);

   void              SendMessage(string msgName, string msgTitle, string message);
   void              SendScreenShot(string symbol, int _period, int ScreenWidth = 1912, int ScreenHeight = 1080);

private:
   string            m_webhook;
  } _discord;

//--- Class constructor
void CDiscord::Constructor(string webhook)
  {
   m_webhook = webhook;
  }

//--- Send a message to Discord
void CDiscord::SendMessage(string msgName, string msgTitle, string message)
  {
   char data[], send[];
   string result;
   string params=("{\"content\":\"" + msgName + "\",\"tts\":false,\"embeds\":[{\"title\":\"" + msgTitle + "\",\"description\":\"" + message + "\"}]}");
   string str="Content-Type:application/json\r\n";

   StringToCharArray(params,send,0,StringLen(params));
   int res=WebRequest("POST", m_webhook, str, 5000, send, data, result);

   if(res<0)
     {
      Print("Message Send Error: ",GetLastError());
     }
   else
     {
     }

   return;
  }

//--- Send a screenshot to Discord
void CDiscord::SendScreenShot(string symbol,int _period, int ScreenWidth = 1912, int ScreenHeight = 1080)
  {

   int res=-1;
   char data[],file[];
   string filename;
   ResetLastError();
   for(int x=1; x<=20; x++)
     {
      long currChart=ChartFirst();
      int i=0;
      while(i<CHARTS_MAX)
        {
         if(ChartSymbol(currChart)==symbol)
           {
            ChartRedraw(currChart);
            break;
           }
         currChart=ChartNext(currChart);
         if(currChart==-1)
            break;
         i++;
        }
      filename=StringFormat("%s_%s.png",ChartSymbol(currChart),ChartPeriod(currChart));
      //---
      if(ChartScreenShot(currChart,filename,ScreenWidth,ScreenHeight))
        {
         Sleep(200);
        }
      else
        {
         Print("ChartScreenShot Error: ",(string)GetLastError());
         Sleep(50);
         continue;
        }
      res=FileOpen(filename,FILE_READ|FILE_WRITE|FILE_BIN);
      if(res<0)
        {
         Print("File Open Error: "+filename+", Attempt: ",x);
         Sleep(100);
         continue;
        }
      if(FileSize(res)==0)
        {
         FileClose(res);
         Print("FileSize Error, Attempt: ",x);
         Sleep(100);
         continue;
        }
      break;
     }
   if(FileReadArray(res,file)!=FileSize(res))
     {
      FileClose(res);
      Print("File Read Error: "+filename);
      return;
     }
   FileClose(res);

   if(ArraySize(file)>0)
     {
      string str,sep="-------Fech2lie9mp8R34k";
      str="--"+sep+"\r\n";
      str+="Content-Disposition: form-data; name=\"attachments\"; filename=\""+filename+"\"\r\n";
      str+="Content-Type: image/png\r\n\r\n";
      res =StringToCharArray(str,data);
      res+=ArrayCopy(data,file,res-1,0);
      res+=StringToCharArray("\r\n--"+sep+"--\r\n",data,res-1);
      ArrayResize(data,ArraySize(data)-1);
      str="Content-Type: multipart/form-data; boundary="+sep+"\r\n";
      ResetLastError();
      res=WebRequest("POST",m_webhook,str,5000,data,data,str);
      if(res==NULL)
         Print("Server response: ",CharArrayToString(data));
      if(res<0)
        {
         Print("Error: ",GetLastError());
        }
      else
        {
        }
      FileDelete(filename);
     }

   Sleep(5);
   return;
  }

//--- End of File
//+------------------------------------------------------------------+
