# CTicks class
This class will return all the important ticks/candle values based on a given symbol and timeframe <br>

## Usage
```cpp
#include <Just_MQL_Framework/main.mqh> //Include the framework

//Creating a class object or...
CTicks candles;

//Use the predefined class name 'Ticks'
int OnInit()
{
    Ticks.Constructor("BTCUSD", "M1");
    
    //Access the lowest low of the last 10 candles
    int lowestPos = Ticks.Lowest(10, 0, "LOW");

    //Printing the Low of that candle
    Print(DoubleToString(Ticks.Low(lowestPos, 2)));
}
```
## Class Methods
```cpp
//Class methods
   void              Constructor(string symbol, string timeframe);   //Constructor, call it before requesting the information
   double            High(int pos);                                  //Return the high of a given position
   double            Low(int pos);                                   //Return the low of a given position
   double            Open(int pos);                                  //Return the open of a given position
   double            Close(int pos);                                 //Return the close of a given position
   int               Highest(int fromPos, int toPos, string mode);   //Return the highest point of a given argument
   int               Lowest(int fromPos, int toPos, string mode);    //Return the lowest point of a given argument
   string            GetSymbol() {return m_symbol;}                  //Return the symbol given by the custom constructor
   string            GetTimeFrame() {return m_timeframe;}            //Return the timeframe given by the custom constructor
```

## Notes
You must call the non-default class constructor in the `OnInit()` or `OnStart` function before using the rest of the class methods. Use `<objName>.Constructor(<parameters>);` for doing that.