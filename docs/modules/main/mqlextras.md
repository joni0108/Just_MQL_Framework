# MqlExtras
These functions will not be added to any class, instead will be added to the global namespace.<br>

# Installation
1. It comes with the `main` module if you included, ir not, use:
   
```cpp
#include <Just_MQL_Framework/main/mqlExtras.mqh>
```

## Conversion Functions
| Function                                        | Description                      |
| :---------------------------------------------- | :------------------------------- |
| `string CharToStr(char value)`                  | Converts a char to a string.     |
| `string DoubleToStr(double value, int digits) ` | Converts a double to a string.   |
| `double StrToDouble(string value)`              | Converts a string to a double.   |
| `int StrToInteger(string value)`                | Converts a string to an integer. |
| `datetime StrToTime(string value)`              | Converts a string to a datetime. |
| `string TimeToStr(datetime value, int mode)`    | Converts a datetime to a string. |