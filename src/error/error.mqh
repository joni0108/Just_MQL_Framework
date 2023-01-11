//+------------------------------------------------------------------+
//|                                                        error.mqh |
//|                                   Copyright 2023, Just Up Coding |
//|                                            https://www.justup.us |
//+------------------------------------------------------------------+
#property copyright "Copyright 2023, Just Up Coding"
#property link      "https://www.justup.us"
#property strict

#include"include/baseErrors.mqh"

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
   int               lastError;              //Last common error
public:
   void              ResetLast();            //Reset the last error
   int               GetLast();              //Get the last error (MQL errors has priority over the framework errors)
   int               GetLastFramework();     //Get the last framework error (check if an MQL error is present and want to check escpecially the framework errors)
   string            GetLastDescription(bool framework = false);   //Get the description of the last error
   void              _SetLast(int error);    //Set the last error
  } Error;
//+------------------------------------------------------------------+

void CError::ResetLast()
  {
   lastError=0;
   ResetLastError();
  }

int CError::GetLast()
  {
      if(GetLastError()==0)
          return lastError;
      else
          return GetLastError();
  }

int CError::GetLastFramework()
  {
   return lastError;
  }

void CError::_SetLast(int error)
  {
   lastError=error;
  }

string CError::GetLastDescription(bool framework = false)
  {
    if(framework)
        return _FrameworkErr(lastError);
    else
        return ErrorDescription(GetLast());
  }