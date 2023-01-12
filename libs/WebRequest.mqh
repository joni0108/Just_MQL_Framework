//+------------------------------------------------------------------+
//|                                                   WebRequest.mqh |
//|                                   Copyright 2023, Just Up Coding |
//|                                            https://www.justup.us |
//+------------------------------------------------------------------+
#property copyright "Copyright 2023, Just Up Coding"
#property link      "https://www.justup.us"
#property strict

#ifdef __MQL4__
#include "mql4/webRequest_discord.mqh"
#include "mql4/webRequest_telegram.mqh"
#endif

#ifdef __MQL5__
#include "mql4/webRequest_discord.mqh"
#include "mql4/webRequest_telegram.mqh"
#endif

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class CWebRequests
  {
public:
   //--- Discord
   class CDiscordM
     {
   public:
      void           Constructor(string webHook);
      void           SendMessage(string msgName, string msgTitle, string message);
      void           SendScreenshot(string symbol, int _period, int ScreenWidth = 1912, int ScreenHeight = 1080);
     } discord;

   //--- Telegram
   class CTelegramM
     {
   public:
      void           Constructor(string telegramToken, string telegramChatId);
      bool           SendMessage(string message, string filePath = "");
     } telegram;
  } WebRequest;
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CWebRequests::CDiscordM::Constructor(string webHook)
  {
   _discord.Constructor(webHook);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CWebRequests::CDiscordM::SendMessage(string msgName, string msgTitle, string message)
  {
   _discord.SendMessage(msgName,msgTitle,message);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CWebRequests::CDiscordM::SendScreenshot(string symbol, int _period, int ScreenWidth = 1912, int ScreenHeight = 1080)
  {
   _discord.SendScreenShot(symbol,_period,ScreenWidth,ScreenHeight);
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CWebRequests::CTelegramM::Constructor(string telegramToken, string telegramChatId)
  {
   _telegram.Constructor(telegramToken, telegramChatId);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CWebRequests::CTelegramM::SendMessage(string message, string filePath = "")
  {
   return _telegram.SendMessage(message, filePath);
  }
//+------------------------------------------------------------------+
