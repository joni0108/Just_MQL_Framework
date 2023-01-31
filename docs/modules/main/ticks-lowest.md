# Lowest() | Method
`From class CTicks` [->](ticks.md) <br>
Returns the highest value of the candle in the selected symbol and timeframe, given positions and property type.

```cpp
//Declaration with its parameters
double Lowest(int from, int to, E_CANDLE_MODE mode);
```

## Parameters
| Parameters |      Type       | Description                                                                                               |
| :--------- | :-------------: | :-------------------------------------------------------------------------------------------------------- |
| `from`     |      [int]      | The position of the candle                                                                                |
| `to`       |      [int]      | The position of the candle                                                                                |
| `mode`     | [E_CANDLE_MODE] | The property type of the candle from the [E_TIMEFRAMES](../../enumerations/e_candle_mode.md) enumeration. |

## Return Value
`int`: <br>
It returns the position of the candle with the lowest value of the given property type, in the selected symbol and timeframe between the given positions.

## Notes
You must use the `Select()` method before using this method in order to not get wrong results. <br>

<br>

# Example
It returns the position of the candle with the lowest open price of the last 10 candles in the current timeframe and symbol.

For this example we will use the pre-defined class object `Ticks`.

```cpp
//--- EXAMPLE OF METHOD __METHOD__ FROM CLASS __CLASS__ ---
#property copyright "Just Up Corp"
#property strict

//--- Including the framework/library---
#include <Just_MQL_Framework/modules/main/ticks.mqh>

//--- OnInit Function ---
int OnInit()
{
    Ticks.Select(PERIOD_CURRENT, Symbol());
    Print("Ticks.Lowest(10, 0, OPEN) = ", Ticks.Lowest(10, 0, OPEN));

    return INIT_SUCCEEDED;
}
```