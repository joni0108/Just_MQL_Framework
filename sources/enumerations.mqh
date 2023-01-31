//--- Enumerations List

enum E_TIMEFRAMES
{
    CURRENT = 0,    // Current timeframe
    M1 = 1,         // 1 minute
    M5 = 5,         // 5 minutes
    M15 = 15,       // 15 minutes
    M30 = 30,       // 30 minutes
    H1 = 60,        // 1 hour
    H4 = 240,       // 4 hours
    D1 = 1440,      // 1 day
    W1 = 10080,     // 1 week
    MN1 = 43200     // 1 month
};

enum E_CANDLE_MODE
{
    OPEN = 0,     // Open price
    LOW = 1,      // Low price
    HIGH = 2,     // High price
    CLOSE = 3,    // Close price
    VOLUME = 4    // Volume
};