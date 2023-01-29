# CTerminalInfo class
This class will return all the terminal related things. You can use the pre-defined object `TerminalInfo`.

## Class Methods
```cpp
    bool FTPAllowed();      // Returns true if FTP is allowed
    bool EmailAllowed();    // Returns true if email is allowed
    bool DLLsAllowed();     // Returns true if DLLs are allowed
    bool TradeAllowed();    // Returns true if trading is allowed
    bool NotificationsAllowed();    // Returns true if notifications are allowed
    int Width();            // Returns terminal width
    int Height();           // Returns terminal height
    string Language();      // Returns terminal language
    string Company();       // Returns terminal company name
    string Name();          // Returns terminal name
    string Path();          // Returns terminal path
    string DataPath();      // Returns terminal data path
    string CommonDataPath();    // Returns terminal common data path
```