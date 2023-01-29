# CTrend class
This class will handle the trend in the chart.

### Table of Contents
- [CTrend class](#ctrend-class)
    - [Table of Contents](#table-of-contents)
- [Trend Rules](#trend-rules)
- [Installation](#installation)
  - [Timeframes string](#timeframes-string)
- [Usage](#usage)
  - [OnTickUpdate()](#ontickupdate)
  - [Getters](#getters)
- [Example](#example)

# Trend Rules
1. A Pullback is valid if it is at least a 38.2% retracement from the main impulse.
2. A breakout is valid with just a candle break above/below a valid swing high/low respectively.

# Installation
1. **You need to call the framework in the beginning of your script, see the main [README](../README.md) file for more information.**
2. Make a new `class object` of the `CTrend` class.
3. Initialize the Ctrend object using:

```cpp
//Set the swings by code
Create(
        string timeframe,   //The timeframe string
        string symbol,      //The symbol
        int swingHigh,      //The position of the swing high
        int swingLow,       //The position of the swing low
        bool bullish        //If the current trend is bullish set it true
      );

//Set the swings visually by the end user
Create(
        string timeframe,   //The timeframe string
        string symbol       //The symbol
      );

/*
On this mode, the user should place a vertical line in both swings, set a chart
button to bullish or bearish, and will enter in an infinite loop that will run
until the end user click the confirm button when everything is set up.
*/
```

**Parameters** <br>
- `timeframe` - The timeframe in string, see the [Timeframes string](#timeframes-string) section for more information.

## Timeframes string
The following timeframes are supported:
- `CURRENT` - The current timeframe
- `M1`  - 1 minute
- `M5`  - 5 minutes
- `M10` - 10 minutes
- `M15` - 15 minutes
- `M30` - 30 minutes
- `H1`  - 1 hour
- `H4`  - 4 hours
- `D1`  - 1 day
- `W1`  - 1 week


# Usage
## OnTickUpdate()
This method must be called in the `OnTick()` function.

```cpp
OnTickUpdate(
                bool drawPoints     //Draw swing points in the chart
            );
```

## Getters
- `GetSwingHigh()` - Return the last valid swing high
- `GetSwingLow()` - Return the last valid swing low
- `IsBullish()` - Return true if the trend is bullish, false if is bearish

# Example
This example will handle the trend in the `M15 timeframe` in the `BTCUSD` in a non-automated way. The client must select the points visually.

```cpp
//--- Including the framework
#include <Just_MQL_Framework/main.mqh>

//--- Class object
CTrend trend;

int OnInit()
{
    trend.Create("M15", "BTCUSD");

    return INIT_SUCCEEDED;
}

void OnTicks()
{
    OnTicksUpdate(true);

    Print("Is the trend bullish?: " + trend.IsBullish());
}
```