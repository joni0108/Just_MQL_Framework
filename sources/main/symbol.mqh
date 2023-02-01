class CSymbol
{
private:
    string _symbol;
public:
    CSymbol() {}
    void Select(string symbol);
    string GetString(ENUM_SYMBOL_INFO_STRING info);
    double GetDouble(ENUM_SYMBOL_INFO_DOUBLE info);
    int GetInteger(ENUM_SYMBOL_INFO_INTEGER info);
} Symbol;

void CSymbol::Select(string symbol)
{
    _symbol = symbol;
}

string CSymbol::GetString(ENUM_SYMBOL_INFO_STRING info)
{
    return SymbolInfoString(_symbol, info);
}

double CSymbol::GetDouble(ENUM_SYMBOL_INFO_DOUBLE info)
{
    return SymbolInfoDouble(_symbol, info);
}

int CSymbol::GetInteger(ENUM_SYMBOL_INFO_INTEGER info)
{
    return SymbolInfoInteger(_symbol, info);
}