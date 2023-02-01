# GetInteger() | Method
`From class CSymbol` [->](symbol.md) <br>
This method returns information about the symbol as an integer.

```cpp
//Declaration with its parameters
int GetInteger(ENUM_SYMBOL_INFO_INTEGER info);
```

## Parameters
| Parameters |           Type            | Description                                                                                                                                                        |
| :--------- | :-----------------------: | :----------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `info`     | [ENUM_SYMBOL_INFO_INTEGER] | The property from the [ENUM_SYMBOL_INFO_INTEGER](https://www.mql5.com/en/docs/constants/environment_state/marketinfoconstants#enum_symbol_info_integer) enumerator. |

## Return Value
`int`: <br>
Returns the information as an integer or `-1` if the information is not available or it was an error.

<br>

# Example
This example will print the symbol digits
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
    Print("Symbol Digits: ", sy.GetInteger(SYMBOL_DIGITS));
    return(INIT_SUCCEEDED);
}
```