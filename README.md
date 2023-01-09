# Just_MQL_Framework
A cross-language framework that allows you to code your scripts and EAs only once and use it on both MT4 &amp; MT5.

# Installation
1. Download/clone the repository into your `MQL4/Include` and `MQL5/Include` folders.
2. At the top of your `#include` instructions on your script, add the following line:
```cpp
#include <Just_MQL_Framework/main.mqh>
```
3. Just enjoy!

## Usage
This framework has the following classes:
- [CAccount](https://github.com/justupcorp/Just_MQL_Framework/wiki/CAccount) - To get all the account information
- [CTextFiles](https://github.com/justupcorp/Just_MQL_Framework/wiki/CTextFile) - To handle text files on a very easy way
- [CLogs](https://github.com/justupcorp/Just_MQL_Framework/wiki/CLogs) - To handle logs files with a predefined format
- [CTicks](https://github.com/justupcorp/Just_MQL_Framework/wiki/CTicks) - To handle the candles values

The wiki is currently being made, please, be patient.

# Contributions & Credits
This framework may include our code and third-party code, all the credits will be listed on the respective document. <br>
If you want to collaborate directly with the project, please, feel free to reach us through the `issues` zone.

## Colaborators List
- [@justupcorp](https://www.github.com/justupcorp)

# TODO
- Add `CError class` to handle MQL4 & MQL5 error descriptions
- Add `CTerminal class` to handle terminal buttons & windows handling
- Add `CLogo class` to handle a logo in the chart
- Add `CTrading class` to handle operations and others in both languages
- Add `CIndicators class` to handle most of the built-in indicators in a very easy way.