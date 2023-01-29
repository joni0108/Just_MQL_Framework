class CSymbol
{
private:
    string m_symbolName;
public:
    CSymbol() {}
    ~CSymbol() {}

    void Select(string symbolName);     // Selects symbol

    bool IsVisible();                   // Returns true if symbol is visible in the market watch
    int GetDigits();                    // Returns number of digits after decimal point
    int GetSpread();                    // Returns spread value in points
    double GetBid();                    // Returns current bid price
    double GetAsk();                    // Returns current ask price
    double GetPoint();                  // Returns point value in the deposit currency
    double GetMinLot();                 // Returns minimum lot size
    double GetMaxLot();                 // Returns maximum lot size
    double GetLotStep();                // Returns lot step
    double GetSwapLong();               // Returns swap value for long positions
    double GetSwapShort();              // Returns swap value for short positions
    string GetBaseCurrency();           // Returns base currency
    string GetSecondCurrency();         // Returns second currency
    string GetDescription();            // Returns symbol description
    string GetPath();                   // Returns symbol path in the symbol tree
} Symbol;

void CSymbol::Select(string symbolName)
{
    m_symbolName = symbolName;
}

bool CSymbol::IsVisible()
{
    return SymbolInfoInteger(m_symbolName, SYMBOL_VISIBLE) == 1;
}

int CSymbol::GetDigits()
{
    return (int)SymbolInfoInteger(m_symbolName, SYMBOL_DIGITS);
}

int CSymbol::GetSpread()
{
    return (int)SymbolInfoInteger(m_symbolName, SYMBOL_SPREAD);
}

double CSymbol::GetBid()
{
    return SymbolInfoDouble(m_symbolName, SYMBOL_BID);
}

double CSymbol::GetAsk()
{
    return SymbolInfoDouble(m_symbolName, SYMBOL_ASK);
}   

double CSymbol::GetPoint()
{
    return SymbolInfoDouble(m_symbolName, SYMBOL_POINT);
}

double CSymbol::GetMinLot()
{
    return SymbolInfoDouble(m_symbolName, SYMBOL_TRADE_TICK_VALUE);
}

double CSymbol::GetMaxLot()
{
    return SymbolInfoDouble(m_symbolName, SYMBOL_TRADE_TICK_VALUE);
}

double CSymbol::GetLotStep()
{
    return SymbolInfoDouble(m_symbolName, SYMBOL_TRADE_TICK_VALUE);
}

double CSymbol::GetSwapLong()
{
    return SymbolInfoDouble(m_symbolName, SYMBOL_SWAP_LONG);
}

double CSymbol::GetSwapShort()
{
    return SymbolInfoDouble(m_symbolName, SYMBOL_SWAP_SHORT);
}

string CSymbol::GetBaseCurrency()
{
    return SymbolInfoString(m_symbolName, SYMBOL_CURRENCY_BASE);
}

string CSymbol::GetSecondCurrency()
{
    return SymbolInfoString(m_symbolName, SYMBOL_CURRENCY_PROFIT);
}

string CSymbol::GetDescription()
{
    return SymbolInfoString(m_symbolName, SYMBOL_DESCRIPTION);
}

string CSymbol::GetPath()
{
    return SymbolInfoString(m_symbolName, SYMBOL_PATH);
}