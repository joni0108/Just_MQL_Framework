//+------------------------------------------------------------------+
//|                                                      ProjectName |
//|                                      Copyright 2018, CompanyName |
//|                                       http://www.companyname.net |
//+------------------------------------------------------------------+


enum TREND_METHOD
  {
   BY_RETRACEMENT = 0,  //A fibonacci retracement percentage
   BY_CANDLES = 1,      //By an amount of pullback candles
   BY_MIX = 2           //By both parameters
  };

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class CTrend
  {
private:
   string            currentTrend;
   int               slPos;
   int               shPos;

public:
                     CTrend(int timeframe, int method, int count);
  };
//+------------------------------------------------------------------+
