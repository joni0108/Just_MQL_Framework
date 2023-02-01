# GetString() | Method
`From class CInfo` [->](info.md) <br>
This method returns information about the terminal or account as a string.

```cpp
//Declaration with its parameters
string GetString(ENUM_INFO_STRING info);
```

## Parameters
| Parameters |        Type        | Description                                                                                            |
| :--------- | :----------------: | :----------------------------------------------------------------------------------------------------- |
| `info`     | [ENUM_INFO_STRING] | The property from the [ENUM_INFO_STRING](../../enumerations/e_enum_info.md/#ENUM_INFO_STRING) enumerator. |

## Return Value
`string`: <br>
Returns the information as a string or `"-1"` if the information is not available or it was an error.

<br>

# Example
This example will print the terminal language and company, as well as the account server and name.
```cpp
//--- EXAMPLE OF METHOD GetString() FROM CLASS CInfo ---
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
    Print("Terminal Company = ", infoAT.GetString(TERMINAL_INFO_COMPANY));
    Print("Terminal Language = ", infoAT.GetString(TERMINAL_INFO_LANGUAGE));
    Print("Account Server = ", infoAT.GetString(ACCOUNT_INFO_SERVER));
    Print("Account Name = ", infoAT.GetString(ACCOUNT_INFO_NAME));
    return(INIT_SUCCEEDED);
}
```