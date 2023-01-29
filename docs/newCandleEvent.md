# OnNewCandle class
This class will handle the event of a new candle in multiple timeframes

### Table of Contents
- [OnNewCandle class](#onnewcandle-class)
    - [Table of Contents](#table-of-contents)
- [Installation](#installation)
- [Usage](#usage)
  - [IsNewCandle()](#isnewcandle)
- [Example](#example)
  - [Timeframes string](#timeframes-string)

# Installation
1. **You need to call the framework in the beginning of your script, see the main [README](../README.md) file for more information.**
2. Make a new `class object` of the `OnNewCandle` class.
3. Initialize the OnNewCandle object using:

```cpp
Create(string timeframe);
```

**Parameters:**
- `timeframe` - The timeframe in string, see the [Timeframes string](#timeframes-string) section for more information.

# Usage
## IsNewCandle()
This class method will return true if a new candle has been formed, or false if not. Use it inside the `OnTick()` function.

# Example
This example will send an `alert` when a new candle is being formed:

```cpp
//--- Including the Framework
#include <Just_MQL_Framework/main.mqh>

//--- Declaring a class object
OnNewCandle m1Candle;

//--- OnInit() function
int OnInit()
{
    m1Candle.Create("M1");

    return INIT_SUCCEEDED;
}

void OnTick()
{
    if(m1Candle.IsNewCandle() == true)
    {
        Alert("A new candle has been formed in the M1 timeframe");
    }
}
```

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