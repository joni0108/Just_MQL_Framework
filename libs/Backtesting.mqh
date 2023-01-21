//+------------------------------------------------------------------+
//|                                                  Backtesting.mqh |
//|                                   Copyright 2023, Just Up Coding |
//|                                            https://www.justup.us |
//+------------------------------------------------------------------+
#property copyright "Copyright 2023, Just Up Coding"
#property link      "https://www.justup.us"
#property strict

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class CBacktesting
  {
private:
   string            m_name;
   string            csvPath;
   string            reportPath;
   long              tickets[];
   string            symbols[];
   int               timeframes[];
public:
                     CBacktesting() {}
                    ~CBacktesting() {}
   void              Create(string name);       //Constructor

   bool              AddEntry(long ticket,      //The ticket of the entry
                              string strategy,           //The strategy used
                              bool takeScreenshot = true, //If you want to take a screenshot of the entry
                              int timeframe = PERIOD_CURRENT //The timeframe of the chart screenshot
                             );

   bool              AddEntry(string strategy,  //The strategy used
                              string symbol,             //The symbol
                              double entryPrice,         //The entry price
                              double stopLoss,           //The stop loss
                              double takeProfit,         //The take profit
                              double volume,             //The volume
                              ENUM_ORDER_TYPE orderType, //The order type
                              string comment,            //The comment
                              bool takeScreenshot = true, //If you want to take a screenshot of the entry
                              int timeframe = PERIOD_CURRENT //The timeframe of the chart screenshot
                             );

   void              Update();
   void              Finish();
  };

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CBacktesting::Create(string name)
  {
   m_name = name;
   csvPath = "Backtest/" + m_name + ".csv";
   reportPath = "Backtest/" + m_name + ".md";

   if(!FileIsExist(csvPath))
     {
      int handle = FileOpen(csvPath, FILE_CSV | FILE_READ | FILE_WRITE);

      if(handle == -1)
        {
         Print("ERR_BACKTESTING_CREATE " + csvPath);
         return;
        }

      FileWrite(handle, "DATE", "SYMBOL", "STRATEGY", "ENTRY_PRICE", "STOP_LOSS", "TAKE_PROFIT", "VOLUME", "ORDER_TYPE", "SL PIPS", "TP PIPS", "P/L PIPS", "P/L %");
      FileClose(handle);
     }

   if(!FileIsExist(reportPath))
     {
      int handle = FileOpen(reportPath, FILE_TXT | FILE_READ | FILE_WRITE);

      if(handle == -1)
        {
         Print("ERR_BACKTESTING_CREATE " + reportPath);
         return;
        }

      FileWrite(handle, "# Backtesting Report");
     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CBacktesting::AddEntry(long ticket, string strategy, bool takeScreenshot, int timeframe)
  {
   if(!FileIsExist(csvPath))
     {
      Print("ERR_CONSTRUCTOR_NOT_CALLED " + csvPath);
      return false;
     }

   ArrayResize(tickets, ArraySize(tickets) + 1);
   ArrayResize(symbols, ArraySize(symbols) + 1);
   ArrayResize(timeframes, ArraySize(timeframes) + 1);

   tickets[ArraySize(tickets) - 1] = ticket;
   symbols[ArraySize(symbols) - 1] = OrderSymbol();
   timeframes[ArraySize(timeframes) - 1] = timeframe;

   return true;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CBacktesting::AddEntry(string strategy, string symbol, double entryPrice, double stopLoss, double takeProfit, double volume, ENUM_ORDER_TYPE orderType, string comment, bool takeScreenshot, int timeframe)
  {
   if(!FileIsExist(csvPath))
     {
      Print("ERR_CONSTRUCTOR_NOT_CALLED " + csvPath);
      return false;
     }

   //--- CSV File handle
   int handle = FileOpen(csvPath, FILE_CSV | FILE_READ | FILE_WRITE);

   if(handle == -1)
     {
      Print("ERR_BACKTESTING_ADD_ENTRY " + csvPath);
      return false;
     }
   
   //--- MD File handle
   int handle2 = FileOpen(reportPath, FILE_CSV | FILE_READ | FILE_WRITE);

   if(handle2 == -1)
     {
      Print("ERR_BACKTESTING_ADD_ENTRY " + reportPath);
      return false;
     }

   FileClose(handle);
   FileClose(handle2);
   return true;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CBacktesting::Update()
  {

  }
//+------------------------------------------------------------------+
