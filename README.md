# Just_MQL_Framework
![GitHub](https://img.shields.io/github/license/justupcorp/Just_MQL_Framework?color=blue)
![Repository Last Release](https://img.shields.io/github/v/release/justupcorp/Just_MQL_Framework?color=light_green)
![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/justupcorp/Just_MQL_Framework?label=download%20size)
<br>
A cross-language framework that allows you to code your scripts and EAs only once and use it on both MT4 & MT5. <br>

## Cross-language Features Supported
### Main Features
- [x] Trading
- [x] Indicators (can be improved)
- [x] Terminal Handling and Manual Trading 
- [x] Working with Files (text, csv, logs)
- [x] Candlesticks Information
- [x] Errors Description
- [x] Account Information
- [ ] Terminal Information 
- [ ] Symbol Information
- [ ] Web Sockets

### Utilities
- [x] Discord Post Connection
- [x] Telegram Post Connection
- [x] Working with Charts
- [x] Backtesting Reports and Data export
- [ ] Trading Concepts
  - [ ] Trends
  - [ ] Candlestick patterns
  - [ ] Chart patterns
  - [ ] Smart money concepts
- [ ] Discord Get Connection
- [ ] Telegram Get Connection
- [ ] Notion API Connection

## Installation
1. Download the framework from an official release. Please, do not clone the repository directly, it may contain some bugs and incomplete code, and the wiki is not updated to the changes in the `master` branch.
2. Place the folder `Just_MQL_Framework` in your `MQL4` or `MQL5` include folder.
3. Move the files from `dlls/MQL4` to the local folder `MQL4/Libraries` and from `dlls/MQL5` to the local folder `MQL5/Libraries`.
4. At the top of your script or EA, include the framework with `#include <Just_MQL_Framework-<version>/main.mqh>`. Example for loading the release 1.42-stable: <br>

```cpp
#include <Just_MQL_Framework-1.42-stable/main.mqh>
```

### Custom Installation

If you only want to include the support to cross-language and do not want to load the utility libraries, go to the `Main.mqh` file and comment the line #15 that have the definition of `INCLUDE_LIBRARIES`.

If you wish to include an specific library from the utility pool, go to the file `librariesList.mqh` and see how to include the parent of the library from there and just add the following line in your script after including the framework main file:
```cpp
#include <Just_MQL_Framework-<version name>/<the path of the library to include>>
```

This is an example of including the framework version 2.0 and including only the `CDebug` class in your file:

```cpp
//You have commented the line #15 of the main.mqh file already

#include <Just_MQL_Framework-2.0-stable/main.mqh>
#include <Just_MQL_Framework-2.0-stable/libs/Debug.mqh>

//Now you are free to use the framework required libraries and only the CDebug class from the utility pool.
```

### Common errors
1. The EA doesn't compile:
   - Check for syntax errors in your code. The framework is tested and it compiles without errors before each release. (Also check if you downloaded from an official release and not cloned the `main` branch)
   - Check for syntax errors in your code on the framework methods. Use the `wiki` to check the correct syntax.
   - Check that you are coding under the same version than the wiki you are using. The wiki will be always `up-to-date` with the latest release. However if you are using an old version of the framework, you can check the wiki for that release in the `docs` folder in the copy you downloaded.
2. The EA is not doing what it is meant to do (an error in the coding logic):
   - Please, check if you are using the correct methods and parameters. Use the `wiki` or your version `documentation` to check the correct syntax.
   - Check if is not a logical error in your code.
   - Check if the `Autotrading` is enabled in the terminal and in your EA.
   - Check if the `DLLs` are enabled in the terminal and in your EA.
   - Run a `Print((string)Error.GetLast() + " " + Error.GetDescription());` and check the `console` to see if there is any error.
   - If the problem continue, please open an `issue` with all the details and how to replicate it in the `issue` section of the repository.

### Migrating from V1.42 to V2?
See the [Syntax Update](syntax-update.md) file.

### Notes
Always download the lastest version from the releases section, the `master` branch may contain some bugs or incomplete code. <br>

## Usage
The framework has the following classes:
- [CAccount](https://github.com/justupcorp/Just_MQL_Framework/wiki/CAccount) - To get all the account information
- [CTextFiles](https://github.com/justupcorp/Just_MQL_Framework/wiki/CTextFile) - To handle text files on a very easy way
- [CLogs](https://github.com/justupcorp/Just_MQL_Framework/wiki/CLogs) - To handle logs files with a predefined format
- [CCSVFile](https://github.com/justupcorp/Just_MQL_Framework/wiki/CCSVFile) - To handle CSV files very easy, includes fuctions to read, modify, and find values into an specific cell using `rows & columns` coordinates system.
- [CTicks](https://github.com/justupcorp/Just_MQL_Framework/wiki/CTicks) - To handle the candles values
- [CTerminal](https://github.com/justupcorp/Just_MQL_Framework/wiki/CTerminal) - To control the Metatrader terminal buttons
- [CTrading](https://github.com/justupcorp/Just_MQL_Framework/wiki/CTrading) - To handle and control all the trading activities
- [CIndicators](https://github.com/justupcorp/Just_MQL_Framework/wiki/CIndicators) - To handle indicators in both versiones using the MQL4 structure
- [CError](https://github.com/justupcorp/Just_MQL_Framework/wiki/CError) - To handle MQL and internal framework errors

<br>

The framework also has some `utility classes` that are not a requirement to code your EA or script, but they are very useful to have them in your code:

- [CChart](https://github.com/justupcorp/Just_MQL_Framework/wiki/CChart) - To handle charts.
- [CDiscord](https://github.com/justupcorp/Just_MQL_Framework/wiki/CDiscord) - To send messages and chart screenshots to a Discord channel.
- [CTelegram](https://github.com/justupcorp/Just_MQL_Framework/wiki/CTelegram) - To send messages and chart screenshots to a Telegram channel.
- [CDebug](https://github.com/justupcorp/Just_MQL_Framework/wiki/CDebug) - To debug your code in a very easy way, adding formatted `Print()` functions and a chart button to test some function calls.

The framework also have some `concepts libraries` that will help you to code some EAs with trading concepts in a very easy way:
- CTrend class - _under development._

_See the [wiki](https://github.com/justupcorp/Just_MQL_Framework/wiki/home) for detailed information on how to use each class._

# Contributing
If you want to contribute to the framework, please, read the [contributing](contribute.md) file.

# Branches
The repository have 3 main branches:
- `Main` - This branch is up-to-date with the tested and stable version of the framework.
- `Dev` - This is the branch in which I am coding new features and libraries, after testing them and fix all bugs, the new features will be implemented to the `Main` branch.
- `Open` - This branch is always up-to-date with the `Main` branch, and this is the public branch, if you want to make a change, like adding new features, or fixing bugs, please `use this branch`.
