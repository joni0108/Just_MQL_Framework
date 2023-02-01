# GetBoolean() | Method
`From class CInfo` [->](info.md) <br>
This method returns information about the terminal or account as a double..

```cpp
//Declaration with its parameters
string GetBoolean(ENUM_INFO_BOOL info);
```

## Parameters
| Parameters |        Type        | Description                                                                                            |
| :--------- | :----------------: | :----------------------------------------------------------------------------------------------------- |
| `info`     | [ENUM_INFO_BOOL] | The property from the [ENUM_INFO_BOOL](../../enumerations/e_enum_info.md/#ENUM_INFO_BOOL) enumerator. |

## Return Value
`bool`: <br>
Returns the information as a boolean or `false` if the information is not available or it was an error.

<br>

# Example
This example will print if the DLLs are enabled, and if the expert is allowed to trade.
```cpp
//--- EXAMPLE OF METHOD GetBoolean() FROM CLASS CInfo ---
#property copyright "Just Up Corp"
#property strict

//--- Including the framework/library---
#include <Just_MQL_Framework/modules/main/info.mqh>

//--- Creating the class objects ---
CInfo infoAT;

//--- OnInit Function ---
int OnInit()
{
    //--- Using some methods ---
    Print("Are the DLLs enabled?: ", infoAT.GetBoolean(TERMINAL_INFO_DLLS_ALLOWED));
    Print("Is the expert allowed to trade?: ", infoAT.GetBoolean(TERMINAL_INFO_TRADE_ALLOWED));
    return(INIT_SUCCEEDED);
}
```