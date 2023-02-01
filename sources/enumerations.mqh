//--- Definitions
#ifndef MODE_ASCEND
    #define MODE_ASCEND 0
#endif
#ifndef MODE_DESCEND
    #define MODE_DESCEND 1
#endif

//--- Enumerations List
enum E_CANDLE_MODE
{
    OPEN = 0,     // Open price
    LOW = 1,      // Low price
    HIGH = 2,     // High price
    CLOSE = 3,    // Close price
    VOLUME = 4    // Volume
};

enum ENUM_INFO_STRING
{
//--- Terminal
    TERMINAL_INFO_LANGUAGE = 0,         // Terminal language
    TERMINAL_INFO_COMPANY = 1,          // Terminal company name
    TERMINAL_INFO_NAME = 2,             // Terminal name
    TERMINAL_INFO_PATH = 3,             // Terminal path
    TERMINAL_INFO_DATA_PATH = 4,        // Terminal data path

//--- Account
    ACCOUNT_INFO_NAME = 5,              // Account name
    ACCOUNT_INFO_SERVER = 6,            // Account server
    ACCOUNT_INFO_CURRRENCY = 7,         // Account currency
    ACCOUNT_INFO_COMPANY = 8,           // Account company name
    ACCOUNT_INFO_TYPE = 9,              // Account type (demo, real, contest)
};

enum ENUM_INFO_BOOL
{
    TERMINAL_INFO_SERVER_CONNECTED = 0,      // Terminal connected to a trading server
    TERMINAL_INFO_DLLS_ALLOWED = 1,          // Terminal allows using DLLs
    TERMINAL_INFO_TRADE_ALLOWED = 2,        // Terminal allows expert to trade
    TERMINAL_INFO_EMAIL_ALLOWED = 3,        // Terminal allows sending emails
    TERMINAL_INFO_NOTIFICATIONS_ALLOWED = 4,// Terminal allows sending notifications and MQ ID setup for push notifications
    TERMINAL_INFO_FTP_ALLOWED = 5,          // Terminal allows using FTP
    EXPERT_INFO_IS_TESTING = 6,             // Expert is running in the strategy tester
    EXPERT_INFO_IN_VISUAL_MODE = 7,         // Expert is running in the visual mode of the strategy tester
    EXPERT_INFO_IN_OPTIMIZATION = 8,        // Expert is running in the optimization mode of the strategy tester
};

enum ENUM_INFO_INTEGER
{
    TERMINAL_INFO_BUILD = 0,                // Terminal build number
    TERMINAL_INFO_MAX_BARS = 1,             // Maximum number of bars in a chart
    TERMINAL_INFO_CPU_CORES = 2,            // Number of CPU cores
    TERMINAL_INFO_DISK_SPACE = 3,           // Free disk space in MB
    TERMINAL_INFO_MEMORY_PHYCICAL = 4,      // Physical memory in MB
    TERMINAL_INFO_MEMORY_TOTAL = 5,         // Total memory in MB
    TERMINAL_INFO_MEMORY_FREE = 6,      // Available memory in MB
    TERMINAL_INFO_MEMORY_USED = 7,          // Used memory in MB
    TERMINAL_INFO_DPI = 8,                  // DPI
    TERMINAL_INFO_LAST_PING = 9,            // Last ping in Microseconds. A second is 1000000 microseconds
    ACCOUNT_INFO_LOGIN = 10,                // Account login number
    ACCOUNT_INFO_LEVERAGE = 11,             // Account leverage
    ACCOUNT_INFO_LIMIT_ORDERS = 12,         // Account limit orders. 0 - unlimited
};

enum ENUM_INFO_DOUBLE
{
    ACCOUNT_INFO_BALANCE = 0,               // Account balance
    ACCOUNT_INFO_CREDIT = 1,                // Account credit
    ACCOUNT_INFO_PROFIT = 2,                // Account profit
    ACCOUNT_INFO_EQUITY = 3,                // Account equity
    ACCOUNT_INFO_MARGIN = 4,                // Account margin
    ACCOUNT_INFO_MARGIN_FREE = 5,           // Account free margin
};