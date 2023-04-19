# NewOrder() | Function
View the function source code for [mql4](../../../sources/terminal/newOrderMQL4.mqh) and [mql5](../../../sources/terminal/newOrderMQL5.mqh). <br>

### Description
This class will send any kind of order or position by using the New Order window.

# Usage
Call the function `void NewOrder(string symbol, int type, double size, double price, double sl, double tp, string comment)`

# Example
In this example we will initialize, use some methods.

```cpp
//--- EXAMPLE OF CLASS CTICKS ---
#property copyright "Just Up Corp"
#property strict

//--- Including the framework/library ---
#include <Just_MQL_Framework/modules/terminal/neworder.mqh>

//--- OnInit Function ---
int OnInit()
{
    NewOrder("EURUSD", 2, 0.01, 1.00000, 0.90090, 1.01000, "This is my comment!");
    Print("Order Sent");
    return(INIT_SUCCEEDED);
}
```