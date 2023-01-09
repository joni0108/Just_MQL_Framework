//+---------------------------------------------------------------------+
//|                                                        Terminal.mqh |
//|                             Copyright 2022-2025, Just Up Coding LLC |
//|                                                http://www.justup.us |
//+---------------------------------------------------------------------+
//+---------------------------------------------------------------------+
//| CTerminal                                                           |
//| Usage: Control the metatrader terminal                              |
//|                                                                     |
//+---------------------------------------------------------------------+
#property copyright "Copyright 2022-2025, Just Up Coding LLC"
#property link      "http://www.justup.us"

#ifdef __MQL4__
    #include "include/terminalMT4.mqh"
#endif

#ifdef __MQL5__
    #include "include/terminalMT5.mqh"
#endif