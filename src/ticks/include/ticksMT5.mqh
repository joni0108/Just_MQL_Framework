#include "../../error/error.mqh"

/*
    MODES:
    "OPEN" - open price
    "HIGH" - high price
    "LOW" - low price
    "CLOSE" - close price
    
    TIMEFRAMES:
    "CURRENT" - current timeframe
    "M1" - 1 minute
    "M5" - 5 minutes
    "M15" - 15 minutes
    "M30" - 30 minutes
    "H1" - 1 hour
    "H4" - 4 hours
    "D1" - 1 day
    "W1" - 1 week
*/

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class CTicks
  {
private:
   string            m_symbol;                                       //Symbol
   string            m_timeframe;                                    //Timeframe in string
   ENUM_TIMEFRAMES   m_tf;                                           //Timeframe in enum periods
   int initialized;
public:
                     CTicks() {}
                    ~CTicks() {}
   void              Create(string symbol, string timeframe);   //Constructor, call it before requesting the information
   double            High(int pos);                                  //Return the high of a given position
   double            Low(int pos);                                   //Return the low of a given position
   double            Open(int pos);                                  //Return the open of a given position
   double            Close(int pos);                                 //Return the close of a given position
   int               Highest(int fromPos, int toPos, string mode);   //Return the highest point of a given argument
   int               Lowest(int fromPos, int toPos, string mode);    //Return the lowest point of a given argument
   string            GetSymbol() {return m_symbol;}                  //Return the symbol given by the custom constructor
   string            GetTimeFrame() {return m_timeframe;}            //Return the timeframe given by the custom constructor

  } Ticks;
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
<<<<<<< HEAD
void CTicks::Constructor(string symbol,string timeframe)
=======
void CTicks::Create(string symbol,string timeframe)
>>>>>>> main
  {
   this.m_timeframe = timeframe;
   this.m_symbol = symbol;

   if(timeframe == "CURRENT")
     {this.m_tf = PERIOD_CURRENT; initialized = 1; return;}

   if(timeframe == "M1")
     {this.m_tf = PERIOD_M1; initialized = 1; return;}

   if(timeframe == "M5")
     {this.m_tf = PERIOD_M5; initialized = 1; return;}

   if(timeframe == "M15")
     {this.m_tf = PERIOD_M15; initialized = 1; return;}

   if(timeframe == "M30")
     {this.m_tf = PERIOD_M30; initialized = 1; return;}

   if(timeframe == "H1")
     {this.m_tf = PERIOD_H1; initialized = 1; return;}

   if(timeframe == "H4")
     {this.m_tf = PERIOD_H4; initialized = 1; return;}

   if(timeframe == "D1")
     {this.m_tf = PERIOD_D1; initialized = 1; return;}

   if(timeframe == "W1")
     {this.m_tf = PERIOD_W1; initialized = 1; return;}
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double CTicks::High(int pos)
  {
   if (initialized != 1)
   {
    Print("ERR_CONSTRUCTOR_NOT_CALLED", __FUNCTION__);
    return -1;
   }
   
   return iHigh(m_symbol, m_tf, pos);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double CTicks::Open(int pos)
  {
   if (initialized != 1)
   {
    Print("ERR_CONSTRUCTOR_NOT_CALLED", __FUNCTION__);
    return -1;
   }
   
   return iOpen(m_symbol, m_tf, pos);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double CTicks::Low(int pos)
  {
   if (initialized != 1)
   {
    Print("ERR_CONSTRUCTOR_NOT_CALLED", __FUNCTION__);
    return -1;
   }
   
   return iLow(m_symbol, m_tf, pos);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double CTicks::Close(int pos)
  {
   if (initialized != 1)
   {
    Print("ERR_CONSTRUCTOR_NOT_CALLED", __FUNCTION__);
    return -1;
   }
   
   return iClose(m_symbol, m_tf, pos);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int CTicks::Highest(int fromPos,int toPos,string mode)
  {
   if (initialized != 1)
   {
    Print("ERR_CONSTRUCTOR_NOT_CALLED", __FUNCTION__);
    return -1;
   }
   
   if(mode == "HIGH")
      return iHighest(m_symbol, m_tf, MODE_HIGH, fromPos, toPos);

   if(mode == "LOW")
      return iHighest(m_symbol, m_tf, MODE_LOW, fromPos, toPos);

   if(mode == "OPEN")
      return iHighest(m_symbol, m_tf, MODE_OPEN, fromPos, toPos);

   if(mode == "CLOSE")
      return iHighest(m_symbol, m_tf, MODE_CLOSE, fromPos, toPos);

   else
     {
      Print("ERR_WRONG_PARAMETERS", __FUNCTION__, "mode");
      return -1;
     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int CTicks::Lowest(int fromPos,int toPos,string mode)
  {
   if(mode == "HIGH")
      return iLowest(m_symbol, m_tf, MODE_HIGH, fromPos, toPos);

   if(mode == "LOW")
      return iLowest(m_symbol, m_tf, MODE_LOW, fromPos, toPos);

   if(mode == "OPEN")
      return iLowest(m_symbol, m_tf, MODE_OPEN, fromPos, toPos);

   if(mode == "CLOSE")
      return iLowest(m_symbol, m_tf, MODE_CLOSE, fromPos, toPos);

   else
     {
      Print("ERR_WRONG_PARAMETERS", __FUNCTION__, "mode");
      return -1;
     }
  }
//+------------------------------------------------------------------+
