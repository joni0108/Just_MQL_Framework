# CTerminal class
This class will help you to control some of the Metatrader terminal buttons by using DLLs <br>

Before using make sure you have placed the DLLs from the path `/src/Terminal/--Place in libraries/MT4or5` into your `Libraries` folder in your MQL4 or MQL5 folder.

## Usage
```cpp
#include <Just_MQL_Framework/main.mqh> //Include the framework

//Creating a class object or...
CTerminal terminal;

//Use the predefined class name 'Terminal'
int OnInit()
{
    //Activate the auto trading by clicking the button if it is off
    Terminal.AutoTrading.Set(true); //This class has a predefined verification step to avoid a click in the button if the petition is already made.

    //Open a limit order in bitcoin with 0.12 lots, at 15000, with sl at 14000, and tp 21000
    Terminal.Trade.NewTrade.NewPosition("BTCUSD", BUY_LIMIT, 0.12, 15000, 14000, 21000, "My demo trade");
}
```
## Class Methods
```cpp
//Class methods
   Terminal.AutoTrading.Set(bool state);            //Set the auto trading
   Terminal.Trade.NewTrade.NewPosition(string symbol, int type, double size, double price, double sl, double tp, string comment);   //Open a new position from the New Order interface
   Terminal.Chart.GetKeyPressed(const int lparam);  //Get the key pressed on the keyboard by using the OnChartEvent() lparam.
```

## Notes
DLLs must be allowed and the terminal must be fully maximized to avoid miss-clicks
