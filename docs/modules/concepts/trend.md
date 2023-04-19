# CTrend | Class
View the class source code for [mql4](../../../sources/concepts/trendMQL4.mqh) and [mql5](../../../sources/concepts/trendMQL5.mqh). <br>

### Description
The CTrend class is a class in MQL4 that can be used to detect the current trend in a financial market. The class has methods to detect the trend, to get the swing high and swing low, and to validate retracements.

A pullback get defined by a 2 pullback candles in a row if traded outside the last impulse candle range. A breakout is based on candle wicks.

# Usage
The class name is `CTrend`, you can declare a new object of this class.

## Class Methods
- `bool DetectTrend(double currentPrice)` -> This method detects the current trend based on the current price.
- `bool WaitingRetracement()` -> This method checks whether the class is waiting for a retracement.
- `bool ValidateRetracement(double currentPrice)` -> This method validates a retracement. 
- `bool UpTrend()` -> Checks if the market is up-trending.
- `double SwingHigh()` -> This method returns the swing high of the current trend.
- `double SwingLow()` -> This method returns the swing low of the current trend.
- `void UpdatePrice(double currentPrice)` -> This method updates the last price recorded on the chart.

## Usage Steps
1. Declare the new class object using `CTrend <obj_name>`.
2. Use `double currentPrice = MarketInfo(Symbol(), MODE_LAST);` on the OnTick funcion.
3. Use `<obj_name>.UpdatePrice(currentPrice);` to update the current price.

### Notes
See the example below to a better understanding on how to use it.

<br>

# Example
In this example we will initialize, use some methods, and destroy a class object.

```cpp
//--- EXAMPLE OF CLASS ---
#property copyright "Just Up Corp"
#property strict

//--- Including the framework/library ---
#include <Just_MQL_Framework/modules/concepts/trend.mqh>

//--- Creating the class objects ---
CTrend trend;

//--- OnInit Function ---
int OnInit()
{


    return INIT_SUCCEEDED;
}

//--- OnDeinit Function ---
void OnDeinit(const int reason)
{

}

//--- OnTick Function ---
void OnTick()
{
    double currentPrice = MarketInfo(Symbol(), MODE_LAST);
    trend.UpdatePrice(currentPrice);

    if (!trend.WaitingRetracement())
    {
        if (trend.DetectTrend(currentPrice))
        {
            Print("Current trend is an uptrend.");
        }
        else
        {
            Print("Current trend is a downtrend.");
        }
    }
    else
    {
        if (trend.ValidateRetracement(currentPrice))
        {
            if (trend.UpTrend())
            {
                double swingHigh = trend.SwingHigh();
                Print("Valid retracement in uptrend. Swing high is ", swingHigh);
            }
            else
            {
                double swingLow = trend.SwingLow();
                Print("Valid retracement in downtrend. Swing low is ", swingLow);
            }
        }
    }
}

//--- OnChartEvent Function ---
void OnChartEvent(const int id,const long& lparam,const double& dparam,const string& sparam)
{

}
```

In this example, the OnTick function is called on each tick of the market. The function first gets the current price using the MarketInfo function and passes it to the UpdatePrice method of the CTrend object.

Next, the function checks whether the class is waiting for a retracement using the WaitingRetracement method. If the class is not waiting for a retracement, it detects the current trend using the DetectTrend method and prints the result.

If the class is waiting for a retracement, it validates the retracement using the ValidateRetracement method. If the retracement is valid, it gets the swing high or swing low of the current trend using the SwingHigh or SwingLow method, and prints the result.

Note that this is just a simple example, and that the CTrend class can be used in a variety of ways depending on the trader's specific needs and trading strategy.