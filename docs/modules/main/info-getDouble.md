# GetDouble() | Method
`From class CInfo` [->](info.md) <br>
This method returns information about the terminal or account as a double..

```cpp
//Declaration with its parameters
string GetDouble(ENUM_INFO_DOUBLE info);
```

## Parameters
| Parameters |        Type        | Description                                                                                            |
| :--------- | :----------------: | :----------------------------------------------------------------------------------------------------- |
| `info`     | [ENUM_INFO_DOUBLE] | The property from the [ENUM_INFO_DOUBLE](../../enumerations/e_enum_info.md/#ENUM_INFO_DOUBLE) enumerator. |

## Return Value
`double`: <br>
Returns the information as a double or `-1` if the information is not available or it was an error.

<br>

# Example
This example will print the account balance and account equity.
```cpp
//--- EXAMPLE OF METHOD GetDouble() FROM CLASS CInfo ---
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
    Print("Terminal Balance: ", infoAT.GetDouble(ACCOUNT_INFO_BALANCE));
    Print("Account Equity: ", infoAT.GetDouble(ACCOUNT_INFO_EQUITY));
    return(INIT_SUCCEEDED);
}
```