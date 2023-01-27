# CAccount class
This class will return the account details in both languages. <br>

## Usage
```cpp
#include <Just_MQL_Framework/main.mqh> //Include the framework

//Use the predefined class name 'Account'
double balance = Account.GetBalance();

//Print the balance
Print("The balance is: " + DoubleToString(balance,2));
```

## Class Methods
```cpp
//Class methods
long              GetLogin();                         //Account Login
long              GetLeverage();                      //Account Leverage
long              GetMaxActiveOrders();               //Maximum amount of active orders

bool              IsTradingAllowed();                 //Is trading allowed in the account?
bool              IsTradeExpert();                    //Is allowed the automated trading for the account?

double            GetBalance();                       //The balance of the account
double            GetProfit();                        //The profit of the account in the deposited currency
double            GetEquity();                        //The equity of the account (Balance + floating)
double            GetMargin();                        //The margin of the account
double            GetFreeMargin();                    //The free margin of the account
double            GetBuyingPower();                   //The total buying power of the account
double            GetFreeBuyingPower();               //The free buying power of the account

string            GetName();                          //The name of the account
string            GetServer();                        //The server hostname of the account
string            GetCurrency();                      //The currency of the account
string            GetCompany();                       //The company or broker of the account
string            GetLeverageStr();                   //The leverage of the account in string format (leverage:1)
```