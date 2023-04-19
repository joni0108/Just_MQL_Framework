# SetAutoTrading() | Function
View the function source code for [mql4](../../../sources/terminal/autoTradingMQL4.mqh) and [mql5](../../../sources/terminal/autoTradingMQL5.mqh). <br>

### Description
This class will toggle the autotrading in the terminal by simulating clicks in the autotrading button.

# Usage
Call the function `SetAutoTrading(state)` where, `state` is `true` for enabling it, and `false` for disabling it.

### Notes
It will only execute if the current state of the auto trading button in the terminal is different to the state passed as parameter.

<br>

# Example
In this example we will initialize, use some methods.

```cpp
//--- EXAMPLE OF CLASS CTICKS ---
#property copyright "Just Up Corp"
#property strict

//--- Including the framework/library ---
#include <Just_MQL_Framework/modules/terminal/autotrading.mqh>

//--- OnInit Function ---
int OnInit()
{
    SetAutoTrading(true);
    Print("Autotrading has been enabled");
    return(INIT_SUCCEEDED);
}
```