# IsBullish() | Method
`From class CTicks` [->](ticks.md) <br>
Returns the bullish state of the candle in the selected symbol and timeframe and given position.

```cpp
//Declaration with its parameters
bool IsBullish(int pos);
```

## Parameters
| Parameters | Type  | Description                |
| :--------- | :---: | :------------------------- |
| `pos`      | [int] | The position of the candle |

## Return Value
`bool`: <br>
It returns `true` or `1` if the candle is bullish, otherwise it returns `false` or `0`.

## Notes
You must use the `Select()` method before using this method in order to not get wrong results. <br>

<br>

# Example
This example will print `1` of the last candle is bullish or `0` if the last candle is bearish. 

For this example we will use the pre-defined class object `Ticks`.

```cpp
//--- EXAMPLE OF METHOD IsBullish() FROM CLASS CTicks ---
#property copyright "Just Up Corp"
#property strict

//--- Including the framework/library---
#include <Just_MQL_Framework/modules/main/ticks.mqh>

//--- OnInit Function ---
int OnInit()
{
    Ticks.Select(PERIOD_CURRENT, Symbol());
    Print("Ticks.IsBullish(1) = ", Ticks.IsBullish(1));

    return INIT_SUCCEEDED;
}
```