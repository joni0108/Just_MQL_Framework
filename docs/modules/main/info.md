# CInfo | Class
View the class source code for [mql4](../../../sources/main/infoMQL4.mqh) and [mql5](../../../sources/main/infoMQL5.mqh). <br>

### Description
This class will return the most important `terminal` and `account` information.

# Usage
The class name is `CInfo`, you can declare a new object of this class or use the pre-defined object `Info`.

## Class Methods
- `string GetString()` [->](info-getString.md) Return an string information from the terminal or account.
- `int GetInteger()` [->](info-getInteger.md) Return an integer information from the terminal or account.
- `double GetDouble()` [->](info-getDouble.md) Return a double information from the terminal or account.
- `bool GetBoolean()` [->](info-getBoolean.md) Return a boolean information from the terminal or account.


## Usage Steps
1. Declare the new class object using `CInfo <obj_name>`. If you want to use the pre-defined class object `Info`, do not declare the new class object.
2. Use `<obj_name>.<Method>()` or `Info.<Method>()` to use any of the class methods.

<br>

# Example
In this example we will initialize, use some methods.

```cpp
//--- EXAMPLE OF CLASS CINFO ---
#property copyright "Just Up Corp"
#property strict

//--- Including the framework/library ---
#include <Just_MQL_Framework/modules/main/info.mqh>

//--- Creating the class objects ---
CInfo info;

//--- OnInit Function ---
int OnInit()
{
    //--- Using some methods ---
    Print("Account Balance = ", info.GetDouble(ACCOUNT_INFO_BALANCE));
    Print("Account Equity = ", info.GetDouble(ACCOUNT_INFO_EQUITY));
    Print("Terminal Language = ", info.GetString(TERMINAL_INFO_LANGUAGE));
    Print("Terminal Company = ", info.GetString(TERMINAL_INFO_COMPANY));
    Print("Account Login Number  = ", info.GetInteger(ACCOUNT_INFO_LOGIN));
    return(INIT_SUCCEEDED);
}
```