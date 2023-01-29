# CSymbol class
This class return information about the symbol.

## Usage
Before using the class methods you must call `Symbol.Select("Symbol name")` to select the symbol.

## Class Methods
```cpp
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
```