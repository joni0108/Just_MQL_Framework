#include "../enumerations.mqh"

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class CTicks
  {
private:
   ENUM_TIMEFRAMES   m_timeframe;
   string            m_symbol;
public:
                     CTicks();
                    ~CTicks();
   void              Select(ENUM_TIMEFRAMES timeframe, string symbol);
   double            High(int pos);
   double            Low(int pos);
   double            Open(int pos);
   double            Close(int pos);
   int               Highest(int from, int to, E_CANDLE_MODE mode);
   int               Lowest(int from, int to, E_CANDLE_MODE mode);
   bool              IsBullish(int pos);
  } Ticks;

//--- Class Constructor
CTicks::CTicks()
  {
  }

//--- Class Destructor
CTicks::~CTicks()
  {
  }

//--- Select() method
void CTicks::Select(ENUM_TIMEFRAMES timeframe, string symbol)
  {
   m_timeframe = timeframe;
   m_symbol = symbol;
  }

//--- High() method
double CTicks::High(int pos)
  {
   return iHigh(m_symbol, m_timeframe, pos);
  }

//--- Low() method
double CTicks::Low(int pos)
  {
   return iLow(m_symbol, m_timeframe, pos);
  }

//--- Open() method
double CTicks::Open(int pos)
  {
   return iOpen(m_symbol, m_timeframe, pos);
  }

//--- Close() method
double CTicks::Close(int pos)
  {
   return iClose(m_symbol, m_timeframe, pos);
  }

//--- Highest() method
int CTicks::Highest(int from, int to, E_CANDLE_MODE mode)
  {
   if(mode == OPEN)
     {
      return iHighest(m_symbol, m_timeframe, MODE_OPEN, from, to);
     }
   else
      if(mode == LOW)
        {
         return iHighest(m_symbol, m_timeframe, MODE_LOW, from, to);
        }
      else
         if(mode == HIGH)
           {
            return iHighest(m_symbol, m_timeframe, MODE_HIGH, from, to);
           }
         else
            if(mode == CLOSE)
              {
               return iHighest(m_symbol, m_timeframe, MODE_CLOSE, from, to);
              }
            else
               if(mode == VOLUME)
                 {
                  return iHighest(m_symbol, m_timeframe, MODE_VOLUME, from, to);
                 }

   return -1;
  }

//--- Lowest() method
int CTicks::Lowest(int from, int to, E_CANDLE_MODE mode)
  {
   if(mode == OPEN)
     {
      return iLowest(m_symbol, m_timeframe, MODE_OPEN, from, to);
     }
   else
      if(mode == LOW)
        {
         return iLowest(m_symbol, m_timeframe, MODE_LOW, from, to);
        }
      else
         if(mode == HIGH)
           {
            return iLowest(m_symbol, m_timeframe, MODE_HIGH, from, to);
           }
         else
            if(mode == CLOSE)
              {
               return iLowest(m_symbol, m_timeframe, MODE_CLOSE, from, to);
              }
            else
               if(mode == VOLUME)
                 {
                  return iLowest(m_symbol, m_timeframe, MODE_VOLUME, from, to);
                 }

   return -1;
  }

//--- IsBullish() method
bool CTicks::IsBullish(int pos)
  {
   return iClose(m_symbol, m_timeframe, pos) > iOpen(m_symbol, m_timeframe, pos);
  }
//+------------------------------------------------------------------+
