class CTerminalInfo
{
public:
    CTerminalInfo() {}
    ~CTerminalInfo() {}

    bool FTPAllowed();      // Returns true if FTP is allowed
    bool EmailAllowed();    // Returns true if email is allowed
    bool DLLsAllowed();     // Returns true if DLLs are allowed
    bool TradeAllowed();    // Returns true if trading is allowed
    bool NotificationsAllowed();    // Returns true if notifications are allowed
    string Language();      // Returns terminal language
    string Company();       // Returns terminal company name
    string Name();          // Returns terminal name
    string Path();          // Returns terminal path
    string DataPath();      // Returns terminal data path
    string CommonDataPath();    // Returns terminal common data path
} TerminalInfo;

bool CTerminalInfo::FTPAllowed()
{
    return (bool)TerminalInfoInteger(TERMINAL_FTP_ENABLED);
}

bool CTerminalInfo::EmailAllowed()
{
    return (bool)TerminalInfoInteger(TERMINAL_EMAIL_ENABLED);
}

bool CTerminalInfo::DLLsAllowed()
{
    return (bool)TerminalInfoInteger(TERMINAL_DLLS_ALLOWED);
}

bool CTerminalInfo::TradeAllowed()
{
    return (bool)TerminalInfoInteger(TERMINAL_TRADE_ALLOWED);
}

bool CTerminalInfo::NotificationsAllowed()
{
    return (bool)TerminalInfoInteger(TERMINAL_NOTIFICATIONS_ENABLED);
}

string CTerminalInfo::Language()
{
    return TerminalInfoString(TERMINAL_LANGUAGE);
}

string CTerminalInfo::Company()
{
    return TerminalInfoString(TERMINAL_COMPANY);
}

string CTerminalInfo::Name()
{
    return TerminalInfoString(TERMINAL_NAME);
}

string CTerminalInfo::Path()
{
    return TerminalInfoString(TERMINAL_PATH);
}

string CTerminalInfo::DataPath()
{
    return TerminalInfoString(TERMINAL_DATA_PATH);
}