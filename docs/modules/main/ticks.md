# CTicks | Class
View the class source code for [mql4](../../../sources/main/ticksMQL4.mqh) and [mql5](../../../sources/main/ticksMQL5.mqh). <br>

### Description
This class will return all the candlestick-related information such as the `high`, `low`, etc.

# Usage
The class name is `CTicks`, you can declare a new object of this class or use the pre-defined object `Ticks`.

## Class Methods
- `void Select()` [->](ticks-select.md) Select a symbol and timeframe for further use.
- `double High()` [->](ticks-high.md) Returns the high price of the candle.
- `double Low()` [->](ticks-low.md) Returns the low price of the candle.
- `double Open()` [->](ticks-open.md) Returns the open price of the candle.
- `double Close()` [->](ticks-close.md) Returns the close price of the candle.
- `double Highest()` [->](ticks-highest.md) Returns the highest price of the candle.
- `double Lowest()` [->](ticks-lowest.md) Returns the lowest price of the candle.
- `bool IsBullish()` [->](ticks-isbullish.md) Returns true if the candle is bullish.
- `double Ask()` [->](ticks-ask.md) Returns the ask price of the candle.
- `double Bid()` [->](ticks-bid.md) Returns the bid price of the candle.
- `double Volume()` [->](ticks-volume.md) Returns the volume of the candle.
- `double Time()` [->](ticks-time.md) Returns the time of the candle.


## Usage Steps
1. Declare the new class object using `CTicks <obj_name>`. If you want to use the pre-defined class object `Ticks`, do not declare the new class object.
2. Use `<obj_name>.Select()` or `Ticks.Create()` method to select a symbol and timeframe.
3. Use `<obj_name>.<Method>()` or `Ticks.<Method>()` to use any of the class methods.

### Notes
You must select a symbol and timeframe before using the other class methods. <br>
If you get a "-1" or -1 as response and see the error number `10001`: Empty class properties.

<br>

# Example
In this example we will initialize, use some methods.

```cpp
//--- EXAMPLE OF CLASS CTICKS ---
#property copyright "Just Up Corp"
#property strict

//--- Including the framework/library ---
#include <Just_MQL_Framework/modules/main/ticks.mqh>

//--- Creating the class objects ---
CTicks candle;

//--- OnInit Function ---
int OnInit()
{
    //--- Set the symbol and timeframe to the one in which we are working on
    candle.Select(CURRENT, Symbol());
    Print("Ticks.High(0) = ", candle.High(0));
    Print("Ticks.Low(0) = ", candle.Low(0));
    Print("Ticks.Open(0) = ", candle.Open(0));
    Print("Ticks.Close(0) = ", candle.Close(0));
    Print("Ticks.Highest(10, 0, HIGH) = ", candle.Highest(10, 0, HIGH));
    Print("Ticks.Lowest(10, 0, LOW) = ", candle.Lowest(10, 0, LOW));
    Print("Ticks.IsBullish(1) = ", candle.IsBullish(1));
    Print("Ticks.Ask(0) = ", candle.Ask(0));
    Print("Ticks.Bid(0) = ", candle.Bid(0));
    Print("Ticks.Volume(0) = ", candle.Volume(0));
    Print("Ticks.Time(1) = ", candle.Time(1));
    return(INIT_SUCCEEDED);
}
```