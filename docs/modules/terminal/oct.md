# COneClickTradingWindow | Class
View the class source code for [mql4](../../../sources/terminal/oneClickMQL4.mqh) and [mql5](../../../sources/terminal/oneClickMQL5.mqh). <br>

### Description
This class will send market positions using the one click trading window. The One Click Trading interface MUST BE active in order to use it.

# Usage
The class name is `COneClickTradingWindow`, you can declare a new object of this class or use the pre-defined object `OCT`.

## Class Methods
- `void SetLots(double val)` -> Sets the lots in the window.
- `void ClickBuy();` -> Press the Buy button.
- `void ClickSell();` -> Press the Sell button.

## Usage Steps
1. Declare the new class object using `COneClickTradingWindow <obj_name>`. If you want to use the pre-defined class object `OCT`, do not declare the new class object.
2. Use `<obj_name>.SetLots()` method to sets the lots.
3. Use `<obj_name>.<Method>()` or `Ticks.<Method>()` to use any of the class methods.

### Notes
If you do not set the lots by code, it will use whatever is in the window. This class just click the buttons, no parameters can be passed while buying or selling.

<br>

# Example
In this example we will initialize, use some methods.

```cpp
//--- EXAMPLE OF CLASS CTICKS ---
#property copyright "Just Up Corp"
#property strict

//--- Including the framework/library ---
#include <Just_MQL_Framework/modules/terminal/oneclick.mqh>

//--- Creating the class objects ---

//--- OnInit Function ---
int OnInit()
{
    OCT.SetLots(0.01);
    OCT.ClickBuy();
    return(INIT_SUCCEEDED);
}
```