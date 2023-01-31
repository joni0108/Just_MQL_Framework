# Close() | Method
`From class CTicks` [->](ticks.md) <br>
Returns the close price of the candle in the selected symbol and timeframe and given position.

```cpp
//Declaration with its parameters
double Close(int pos);
```

## Parameters
| Parameters | Type  | Description                |
| :--------- | :---: | :------------------------- |
| `pos`      | [int] | The position of the candle |

## Return Value
`double`: <br>
It returns the close price of the candle in the selected symbol and timeframe and given position.

## Notes
You must use the `Select()` method before using this method in order to not get wrong results. <br>

<br>

# Example
This example will return the close price of the candle in the selected symbol and timeframe and given position. For this example we will use the pre-defined class object `Ticks`.

```cpp
//--- EXAMPLE OF METHOD __METHOD__ FROM CLASS __CLASS__ ---
#property copyright "Just Up Corp"
#property strict

//--- Including the framework/library---
#include <Just_MQL_Framework/modules/main/ticks.mqh>

//--- OnInit Function ---
int OnInit()
{
    Ticks.Select(CURRENT, Symbol());
    Print("Ticks.Close(0) = ", Ticks.Close(0));

    return INIT_SUCCEEDED;
}
```