# GetString() | Method
`From class CSymbol` [->](symbol.md) <br>
This method returns information about the symbol as a double.

```cpp
//Declaration with its parameters
double GetDouble(ENUM_SYMBOL_INFO_DOUBLE info);
```

## Parameters
| Parameters |           Type            | Description                                                                                                                                                        |
| :--------- | :-----------------------: | :----------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `info`     | [ENUM_SYMBOL_INFO_DOUBLE] | The property from the [ENUM_SYMBOL_INFO_DOUBLE](https://www.mql5.com/en/docs/constants/environment_state/marketinfoconstants#enum_symbol_info_integer) enumerator. |

## Return Value
`double`: <br>
Returns the information as a double.

<br>

# Example
This example will print the symbol point value.
```cpp
//--- EXAMPLE OF METHOD GetInteger() FROM CLASS CInfo ---
#property copyright "Just Up Corp"
#property strict

//--- Including the framework/library---
#include <Just_MQL_Framework/modules/main/symbol.mqh>

//--- Creating the class objects ---
CSymbol sy;

//--- OnInit Function ---
int OnInit()
{
    //--- Selecting the symbol ---
    sy.Select(Symbol());
    
    //--- Using some methods ---
    Print("Symbol Point Value: ", sy.GetString(SYMBOL_POINT));
    return(INIT_SUCCEEDED);
}
```