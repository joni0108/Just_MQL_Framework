//+---------------------------------------------------------------------+
//|                                                           Files.mqh |
//|                             Copyright 2022-2025, Just Up Coding LLC |
//|                                                http://www.justup.us |
//+---------------------------------------------------------------------+
//+---------------------------------------------------------------------+
//| CTextFile, CLogs                                                    |
//| Usage: Handle files in MQL                                          |
//|                                                                     |
//+---------------------------------------------------------------------+
#property copyright "Copyright 2022-2025, Just Up Coding LLC"
#property link      "http://www.justup.us"

#include "include/base_txt.mqh"
#include "include/base_logs.mqh"

#ifdef __MQL4__
    #include "include/csvMT4.mqh"
#endif

#ifdef __MQL5__
    #include "include/csvMT5.mqh"
#endif