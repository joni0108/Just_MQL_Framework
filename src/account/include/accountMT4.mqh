//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class CAccount
  {
public:
                     CAccount(void);
                    ~CAccount(void);
   int               GetLogin();                         //Account Login
   int               GetLeverage();                      //Account Leverage
   int               GetMaxActiveOrders();               //Maximum amount of active orders
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

  } Account;

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int CAccount::GetLogin(void)
  {
   return AccountInfoInteger(ACCOUNT_LOGIN);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int CAccount::GetLeverage(void)
  {
   return AccountInfoInteger(ACCOUNT_LEVERAGE);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int CAccount::GetMaxActiveOrders(void)
  {
   return AccountInfoInteger(ACCOUNT_LIMIT_ORDERS);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CAccount::IsTradingAllowed(void)
  {
   return (bool)AccountInfoInteger(ACCOUNT_TRADE_ALLOWED);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CAccount::IsTradeExpert(void)
  {
   return (bool)AccountInfoInteger(ACCOUNT_TRADE_EXPERT);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double CAccount::GetBalance(void)
  {
   return AccountInfoDouble(ACCOUNT_BALANCE);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double CAccount::GetProfit(void)
  {
   return AccountInfoDouble(ACCOUNT_PROFIT);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double CAccount::GetEquity(void)
  {
   return AccountInfoDouble(ACCOUNT_EQUITY);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double CAccount::GetMargin(void)
  {
   return AccountInfoDouble(ACCOUNT_MARGIN);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double CAccount::GetFreeMargin(void)
  {
   return AccountInfoDouble(ACCOUNT_MARGIN_FREE);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double CAccount::GetBuyingPower(void)
  {
   double bp = 0;

   bp = this.GetEquity() * this.GetLeverage();

   return bp;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double CAccount::GetFreeBuyingPower(void)
  {
   double fbp = 0;

   fbp = this.GetMargin() * this.GetLeverage();

   return fbp;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string CAccount::GetName(void)
  {
   return AccountInfoString(ACCOUNT_NAME);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string CAccount::GetServer(void)
  {
   return AccountInfoString(ACCOUNT_SERVER);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string CAccount::GetCurrency(void)
  {
   return AccountInfoString(ACCOUNT_CURRENCY);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string CAccount::GetCompany(void)
  {
   return AccountInfoString(ACCOUNT_COMPANY);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string CAccount::GetLeverageStr(void)
  {
   return ((string)this.GetLeverage() + ":1");
  }
//+------------------------------------------------------------------+
