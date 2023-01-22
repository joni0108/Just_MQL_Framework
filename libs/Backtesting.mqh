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
   string            strategies[];
public:
                     CBacktesting() {}
                    ~CBacktesting() {}
   void              Create(string name);                   //Constructor

   bool              AddEntry(long ticket,                  //The ticket of the entry
                              string strategy,              //The strategy used
                              bool takeScreenshot = true    //If you want to take a screenshot of the entry
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

      FileWrite(handle, "Type", "Asset", "Date", "SL Pips", "P/L Pips", "Hours in trade", "Risk $", "Strategy", "P/L RRR", "P/L $");
      FileClose(handle);
     }

   if(!FileIsExist(reportPath))
     {
      int handle2 = FileOpen(reportPath, FILE_TXT | FILE_READ | FILE_WRITE);

      if(handle2 == -1)
        {
         Print("ERR_BACKTESTING_CREATE " + reportPath);
         return;
        }

      FileWrite(handle2, "# Backtesting Report");
      
      FileClose(handle2);
     }
    
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CBacktesting::AddEntry(long ticket, string strategy, bool takeScreenshot = true)
  {
   if(!FileIsExist(csvPath))
     {
      Print("ERR_CONSTRUCTOR_NOT_CALLED " + csvPath);
      return false;
     }

   ArrayResize(tickets, ArraySize(tickets) + 1);
   ArrayResize(strategies, ArraySize(strategies) + 1);

   tickets[ArraySize(tickets) - 1] = ticket;

   strategies[ArraySize(strategies) - 1] = strategy;

   return true;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CBacktesting::Update()
  {
      for(int i=0;i<ArraySize(tickets);i++)
        {
            if(tickets[i] == 0)
               continue;
            else
              {
                  if(!Trading.Select((int)tickets[i],BY_TICKET,POOL_HISTORY))
                     continue;
                  
                  else
                    {
                        int handle = FileOpen(csvPath,FILE_CSV|FILE_READ|FILE_WRITE);
                        
                        if(handle == INVALID_HANDLE)
                        {
                           Print("ERR_BACKTESTING_CREATE " + csvPath);
                           return;
                        }
                        
                        else
                          {
                              FileSeek(handle,0,SEEK_END);
                              
                              string type;
                              
                              if(Trading.GetType() == 0)
                                 type = "BUY";
                              else
                                 type = "SELL";
                              
                              FileWrite(handle,type,Trading.GetSymbol(),(string)Trading.GetOpenTime(),(string)Trading.GetSLPips(),(string)Trading.GetDuration("H"),(string)Trading.GetRisk("$"),strategy[i],(string)Trading.GetPL("R"),Trading.GetPL("$"));
                              
                              FileClose(handle);
                              
                              //--- Logic for the screenshot
                              
                              tickets[i] = 0;
                          }
                    }
              }
        }
  }
//+------------------------------------------------------------------+
