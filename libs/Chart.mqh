//+------------------------------------------------------------------+
//|                                                        Chart.mqh |
//|                                   Copyright 2023, Just Up Coding |
//|                                            https://www.justup.us |
//+------------------------------------------------------------------+
#property copyright "Copyright 2023, Just Up Coding"
#property link      "https://www.justup.us"
#property strict

#ifdef __MQL4__
#include "mql4/chart_close.mqh"
#include "mql4/chart_logo.mqh"
#endif

#ifdef __MQL5__
#include "mql5/chart_close.mqh"
#include "mql5/chart_logo.mqh"
#endif


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class CChart
  {
public:

   bool              LogoCreate(long chartId, ENUM_CHART_SIDE _side, string imagePath, int subWindow = 0, int xOffset = 20, int yOffset = 20);
   void              LogoDelete();
   void              CloseAll(bool includeCurrent, string ignoreWithComment = NULL);
   long              FindChart(string symbol, string timeframe);

private:
   CLogo             myLogo;

  } Chart;

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CChart::CloseAll(bool includeCurrent,string ignoreWithComment=NULL)
  {
   ChartCloseAll(includeCurrent, ignoreWithComment);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
long CChart::FindChart(string symbol,string timeframe)
  {
   long chartID = -1;
   int period = -1;
   
   if(timeframe == "CURRENT")
      period = PERIOD_CURRENT;
   else if(timeframe == "M1")
      period = 1;
    else if(timeframe == "M5")
      period = 5;
    else if(timeframe == "M15")
      period = 15;
    else if(timeframe == "M30")
      period = 30;
    else if(timeframe == "H1")
      period = 60;
    else if(timeframe == "H4")
      period = 240;
    else if(timeframe == "D1")
      period = 1440;
    else if(timeframe == "W1")
      period = 10080;
    else if(timeframe == "MN1")
      period = 43200;

    if(period == -1)
    {
      Print("ERR_INVALID_PARAMETERS: Invalid timeframe: " + timeframe);
      return -1;
    }

   for(long ch=ChartFirst(); ch >= 0; ch=ChartNext(ch))
      if(ch!=ChartID())
        {
         if(ChartSymbol(ch) == symbol && ChartPeriod(ch) == period)
           {
            chartID = ch;
            break;
           }
        }

   return chartID;
  }
//+------------------------------------------------------------------+
bool CChart::LogoCreate(long chartId, ENUM_CHART_SIDE _side, string imagePath, int subWindow = 0, int xOffset = 20, int yOffset = 20)
  {
   return myLogo.Create(chartId,_side,imagePath,subWindow,xOffset,yOffset);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CChart::LogoDelete()
  {
   myLogo.Delete();
  }
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
