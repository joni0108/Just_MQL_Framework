//+---------------------------------------------------------------------+
//|                                                            Main.mqh |
//|                             Copyright 2022-2025, Just Up Coding LLC |
//|                                                http://www.justup.us |
//+---------------------------------------------------------------------+
//+---------------------------------------------------------------------+
//| <Main Framework Code>                                               |
//| Usage: Import this file to import the whole framework               |
//|                                                                     |
//+---------------------------------------------------------------------+
#property copyright "Copyright 2022-2025, Just Up Coding LLC"
#property link      "http://www.justup.us"
#property version   "2.0"

#define INCLUDE_LIBRARIES

//+---------------------------------------------------------------------+
#include "/src/account/account.mqh"
#include "src/files/files.mqh"
#include "src/ticks/ticks.mqh"
#include "src/terminal/terminal.mqh"
#include "src/trading/trading.mqh"
#include "src/indicators/indicators.mqh"

#ifdef INCLUDE_LIBRARIES
   #include "librariesList.mqh"
#endif 