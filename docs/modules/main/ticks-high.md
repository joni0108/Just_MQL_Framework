# High() | Method
`From class CTicks` [->](ticks.md) <br>
Returns the high of the candle in the selected symbol and timeframe and given position.

```cpp
//Declaration with its parameters
double High(int pos);
```

## Parameters
| Parameters | Type  | Description                |
| :--------- | :---: | :------------------------- |
| `pos`      | [int] | The position of the candle |

## Return Value
`double`: <br>
It returns the high of the candle in the selected symbol and timeframe and given position.

## Notes
You must use the `Select()` method before using this method in order to not get wrong results. <br>

<br>

# Example
This example will return the high of the candle in the selected symbol and timeframe and given position. For this example we will use the pre-defined class object `Ticks`.

```cpp
//--- EXAMPLE OF METHOD High() FROM CLASS CTicks ---
#property copyright "Just Up Corp"
#property strict

//--- Including the framework/library---
#include <Just_MQL_Framework/modules/main/ticks.mqh>

//--- OnInit Function ---
int OnInit()
{
    Ticks.Select(PERIOD_CURRENT, Symbol());
    Print("Ticks.High(0) = ", Ticks.High(0));

    return INIT_SUCCEEDED;
}
```