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
public:
   void              ResetLast();             //Reset the last error
   int               GetLast();               //Get the last error (MQL errors has priority over the framework errors)
   string            GetDescription();        //Get the description of the last error
  } Error;
//+------------------------------------------------------------------+

void CError::ResetLast()
  {
   ResetLastError();
  }

int CError::GetLast()
  {
    return GetLastError();
  }

string CError::GetDescription()
  {
     return _ErrorDescr(GetLast());
  }