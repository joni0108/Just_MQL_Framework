# GetString() | Method
`From class CSymbol` [->](symbol.md) <br>
This method returns information about the symbol as a string.

```cpp
//Declaration with its parameters
string GetString(ENUM_SYMBOL_INFO_STRING info);
```

## Parameters
| Parameters |           Type            | Description                                                                                                                                                        |
| :--------- | :-----------------------: | :----------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `info`     | [ENUM_SYMBOL_INFO_STRING] | The property from the [ENUM_SYMBOL_INFO_STRING](https://www.mql5.com/en/docs/constants/environment_state/marketinfoconstants#enum_symbol_info_integer) enumerator. |

## Return Value
`string`: <br>
Returns the information as a string.

<br>

# Example
This example will print the symbol base currency.
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
    Print("Symbol Base Currency: ", sy.GetString(SYMBOL_CURRENCY_BASE));
    return(INIT_SUCCEEDED);
}
```