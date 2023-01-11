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
#include "mql4/chart_testBut.mqh"
#endif

#ifdef __MQL5__
#include "mql5/chart_close.mqh"
#include "mql5/chart_logo.mqh"
#include "mql5/chart_testBut.mqh"
#endif


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class CChart
  {
public:


   class CActions
     {
   public:
      void              CloseAll(bool includeCurrent, string ignoreWithComment = NULL);
     } action;

   class CObjects
     {
   public:
      //--- Logo Object
      class CLogos
        {
      private:
         CLogo       myLogo;

      public:
         bool        Create(long chartId, ENUM_CHART_SIDE _side, string imagePath, int subWindow = 0, int xOffset = 20, int yOffset = 20);
         void        Delete();
        } logo;
      
      //--- Debug Button
      class CDebugButton
        {
      public:
         void           Create(long chartId, int subWindow = 0, color colorBG = clrDarkGray, color colorText = clrWhite);
         bool           IsPressed();
         void           Release();
         void           Delete();
        } debug;

     } object;

   //---
  } Chart;

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CChart::CActions::CloseAll(bool includeCurrent,string ignoreWithComment=NULL)
  {
   ChartCloseAll(includeCurrent, ignoreWithComment);
  }
//+------------------------------------------------------------------+
bool CChart::CObjects::CLogos::Create(long chartId, ENUM_CHART_SIDE _side, string imagePath, int subWindow = 0, int xOffset = 20, int yOffset = 20)
  {
   return myLogo.Create(chartId,_side,imagePath,subWindow,xOffset,yOffset);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CChart::CObjects::CLogos::Delete()
  {
   myLogo.Delete();
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CChart::CObjects::CDebugButton::Create(long chartId, int subWindow = 0, color colorBG = clrDarkGray, color colorText = clrWhite)
  {
   _DebugButtonCreate(chartId, subWindow, colorBG, colorText);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CChart::CObjects::CDebugButton::Release()
  {
   _DebugButtonOnClick();
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CChart::CObjects::CDebugButton::Delete()
  {
   _DeleteDebugBut();
  }
//+------------------------------------------------------------------+

bool CChart::CObjects::CDebugButton::IsPressed()
{
   return _IsDebugButtonPressed();
}