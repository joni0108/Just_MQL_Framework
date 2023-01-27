//+---------------------------------------------------------------------+
//|                                                         Trading.mqh |
//|                             Copyright 2022-2025, Just Up Coding LLC |
//|                                                http://www.justup.us |
//+---------------------------------------------------------------------+
//+---------------------------------------------------------------------+
//| CTrading                                                            |
//| Usage: Handle trading like the CTrade class of MQL5                 |
//|                                                                     |
//+---------------------------------------------------------------------+
#property copyright "Copyright 2022-2025, Just Up Coding LLC"
#property link      "http://www.justup.us"

#ifdef __MQL4__
    #include "include/tradingMT4.mqh"
#endif

#ifdef __MQL5__
    #include "include/tradingMT5.mqh"
#endif