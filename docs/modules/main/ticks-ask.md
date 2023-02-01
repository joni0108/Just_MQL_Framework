# Ask() | Method
`From class CTicks` [->](ticks.md) <br>
Returns the last known ask price of the selected symbol.

```cpp
//Declaration with its parameters
double Ask();
```

## Parameters
`void` - No parameters

## Return Value
`double`: <br>
It returns the ask price of the selected symbol.

## Notes
You must use the `Select()` method before using this method in order to not get wrong results. The ask will return the same price no matter the timeframe selected. <br>

<br>

# Example
This example will return the ask price of the current symbol. For this example we will use the pre-defined class object `Ticks`.

```cpp
//--- EXAMPLE OF METHOD Ask() FROM CLASS CTicks ---
#property copyright "Just Up Corp"
#property strict

//--- Including the framework/library---
#include <Just_MQL_Framework/modules/main/ticks.mqh>

//--- OnInit Function ---
int OnInit()
{
    Ticks.Select(PERIOD_CURRENT, Symbol());
    Print("Ticks.Ask() = ", Ticks.Ask());

    return INIT_SUCCEEDED;
}
```