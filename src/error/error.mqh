//+------------------------------------------------------------------+
//|                                                        error.mqh |
//|                                   Copyright 2023, Just Up Coding |
//|                                            https://www.justup.us |
//+------------------------------------------------------------------+
#property copyright "Copyright 2023, Just Up Coding"
#property link      "https://www.justup.us"
#property strict

#ifdef __MQL4__
#include "include/mql4Errors.mqh"
#endif

#ifdef __MQL5__
#include "include/mql5Errors.mqh"
#endif

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class CError
  {
private:
   int               lastMQL;                //Last MQL error
   int               lastFramework;          //Last framework error
   int               lastError;              //Last common error
public:
   void              ResetLast();            //Reset the last error
   int               GetLast();              //Get the last error
   string            GetLastDescription();   //Get the description of the last error
   int               LastMQL();              //Get the last MQL error
   int               LastFramework();        //Get the last framework error
  } Error;
//+------------------------------------------------------------------+

