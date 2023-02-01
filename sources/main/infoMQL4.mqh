#include "../enumerations.mqh"

class CInfo
{
private:
    string Verify1();
    bool Verify2();
    bool Verify3();
public:
    CInfo();
    ~CInfo();

    string GetString(ENUM_INFO_STRING info);
    bool  GetBoolean(ENUM_INFO_BOOL info);
    int   GetInteger(ENUM_INFO_INTEGER info);
    double GetDouble(ENUM_INFO_DOUBLE info);
} Info;

// Class Constructor
CInfo::CInfo()
{
}

// Class Destructor
CInfo::~CInfo()
{
}

// Get string information
string CInfo::GetString(ENUM_INFO_STRING info)
{
    string res;

    switch (info)
    {
    case TERMINAL_INFO_COMPANY:
        res = TerminalInfoString(TERMINAL_COMPANY);
        break;
    case TERMINAL_INFO_LANGUAGE:
        res = TerminalInfoString(TERMINAL_LANGUAGE);
        break;
    case TERMINAL_INFO_NAME:
        res = TerminalInfoString(TERMINAL_NAME);
        break;
    case TERMINAL_INFO_PATH:
        res = TerminalInfoString(TERMINAL_PATH);
        break;
    case TERMINAL_INFO_DATA_PATH:
        res = TerminalInfoString(TERMINAL_DATA_PATH);
        break;
    case ACCOUNT_INFO_NAME:
        res = AccountInfoString(ACCOUNT_NAME);
        break;
    case ACCOUNT_INFO_SERVER:
        res = AccountInfoString(ACCOUNT_SERVER);
        break;
    case ACCOUNT_INFO_CURRRENCY:
        res = AccountInfoString(ACCOUNT_CURRENCY);
        break;
    case ACCOUNT_INFO_COMPANY:
        res = AccountInfoString(ACCOUNT_COMPANY);
        break;
    case ACCOUNT_INFO_TYPE:
        res = Verify1();
        break;
    
    default: res = "-1";
        break;
    }

    return res;
}

// Get boolean information
bool CInfo::GetBoolean(ENUM_INFO_BOOL info)
{
    bool res;

    switch (info)
    {
    case TERMINAL_INFO_SERVER_CONNECTED:
        res = TerminalInfoInteger(TERMINAL_CONNECTED);
        break;
    case TERMINAL_INFO_DLLS_ALLOWED:
        res = TerminalInfoInteger(TERMINAL_DLLS_ALLOWED);
        break;
    case TERMINAL_INFO_TRADE_ALLOWED:
        res = Verify2();
        break;
    case TERMINAL_INFO_EMAIL_ALLOWED:
        res = TerminalInfoInteger(TERMINAL_EMAIL_ENABLED);
        break;
    case TERMINAL_INFO_NOTIFICATIONS_ALLOWED:
        res = Verify3();
        break;
    case TERMINAL_INFO_FTP_ALLOWED:
        res = TerminalInfoInteger(TERMINAL_FTP_ENABLED);
        break;
    case EXPERT_INFO_IS_TESTING:
        res = IsTesting();
        break;
    case EXPERT_INFO_IN_VISUAL_MODE:
        res = IsVisualMode();
        break;
    case EXPERT_INFO_IN_OPTIMIZATION:
        res = IsOptimization();
        break;
    
    default: res = false;
        break;
    }

    return res;
}

// Get integer information
int CInfo::GetInteger(ENUM_INFO_INTEGER info)
{
    int res;

    switch (info)
    {
    case TERMINAL_INFO_BUILD:
        res = TerminalInfoInteger(TERMINAL_BUILD);
        break;
    case TERMINAL_INFO_MAX_BARS:
        res = TerminalInfoInteger(TERMINAL_MAXBARS);
        break;
    case TERMINAL_INFO_CPU_CORES:
        res = TerminalInfoInteger(TERMINAL_CPU_CORES);
        break;
    case TERMINAL_INFO_DISK_SPACE:
        res = TerminalInfoInteger(TERMINAL_DISK_SPACE);
        break;
    case TERMINAL_INFO_MEMORY_PHYCICAL:
        res = TerminalInfoInteger(TERMINAL_MEMORY_PHYSICAL);
        break;
    case TERMINAL_INFO_MEMORY_TOTAL:
        res = TerminalInfoInteger(TERMINAL_MEMORY_TOTAL);
        break;
    case TERMINAL_INFO_MEMORY_USED:
        res = TerminalInfoInteger(TERMINAL_MEMORY_USED);
        break;
    case TERMINAL_INFO_MEMORY_FREE:
        res = TerminalInfoInteger(TERMINAL_MEMORY_AVAILABLE);
        break;
    case TERMINAL_INFO_DPI:
        res = TerminalInfoInteger(TERMINAL_SCREEN_DPI);
        break;
    case TERMINAL_INFO_LAST_PING:
        res = TerminalInfoInteger(TERMINAL_PING_LAST);
        break;
    case ACCOUNT_INFO_LOGIN:
        res = (int)AccountInfoInteger(ACCOUNT_LOGIN);
        break;
    case ACCOUNT_INFO_LEVERAGE:
        res = (int)AccountInfoInteger(ACCOUNT_LEVERAGE);
        break;
    case ACCOUNT_INFO_LIMIT_ORDERS:
        res = (int)AccountInfoInteger(ACCOUNT_LIMIT_ORDERS);
        break;
    
    default: res = -1;
        break;
    }

    return res;
}

// Get double information
double CInfo::GetDouble(ENUM_INFO_DOUBLE info)
{
    double res;

    switch (info)
    {
        case ACCOUNT_INFO_BALANCE:
            res = AccountInfoDouble(ACCOUNT_BALANCE);
            break;
        case ACCOUNT_INFO_CREDIT:
            res = AccountInfoDouble(ACCOUNT_CREDIT);
            break;
        case ACCOUNT_INFO_PROFIT:
            res = AccountInfoDouble(ACCOUNT_PROFIT);
            break;
        case ACCOUNT_INFO_EQUITY:
            res = AccountInfoDouble(ACCOUNT_EQUITY);
            break;
        case ACCOUNT_INFO_MARGIN:
            res = AccountInfoDouble(ACCOUNT_MARGIN);
            break;
        case ACCOUNT_INFO_MARGIN_FREE:
            res = AccountInfoDouble(ACCOUNT_MARGIN_FREE);
            break;
        default: res = -1;
            break;
    }

    return res;
}

//--- Private methods
string CInfo::Verify1()
{
        int temp0 = (int)AccountInfoInteger(ACCOUNT_TRADE_MODE);

        if(temp0 == ACCOUNT_TRADE_MODE_DEMO)
            return "DEMO";
        else if(temp0 == ACCOUNT_TRADE_MODE_REAL)
            return "REAL";
        else if(temp0 == ACCOUNT_TRADE_MODE_CONTEST)
            return "CONTEST";

        return "-1";
}

bool CInfo::Verify2()
{
    bool temp1 = TerminalInfoInteger(TERMINAL_TRADE_ALLOWED);
    bool temp2 = AccountInfoInteger(ACCOUNT_TRADE_ALLOWED);
    bool temp3 = AccountInfoInteger(ACCOUNT_TRADE_EXPERT);

    if(temp1 && temp2 && temp3)
        return true;
    else
        return false;
}

bool CInfo::Verify3()
{
    bool temp4 = TerminalInfoInteger(TERMINAL_NOTIFICATIONS_ENABLED);
    bool temp5 = TerminalInfoInteger(TERMINAL_MQID);

    if(temp4 && temp5)
        return true;
    else
        return false;
}
