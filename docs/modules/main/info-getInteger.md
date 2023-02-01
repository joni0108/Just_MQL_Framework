# GetInteger() | Method
`From class CInfo` [->](info.md) <br>
This method returns information about the terminal or account as an integer.

```cpp
//Declaration with its parameters
string GetInteger(ENUM_INFO_INTEGER info);
```

## Parameters
| Parameters |        Type         | Description                                                                                              |
| :--------- | :-----------------: | :------------------------------------------------------------------------------------------------------- |
| `info`     | [ENUM_INFO_INTEGER] | The property from the [ENUM_INFO_INTEGER](../../enumerations/e_enum_info/#ENUM_INFO_INTEGER) enumerator. |

## Return Value
`int`: <br>
Returns the information as an integer or `-1` if the information is not available or it was an error.

<br>

# Example
This example will print the terminal build number and number account number.
```cpp
//--- EXAMPLE OF METHOD GetInteger() FROM CLASS CInfo ---
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
    Print("Terminal Build: ", infoAT.GetInteger(TERMINAL_INFO_BUILD));
    Print("Account Number: ", infoAT.GetInteger(ACCOUNT_INFO_LOGIN));
    return(INIT_SUCCEEDED);
}
```