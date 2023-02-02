# SetPrevCalculated() | Method
`From class CCustomIndicators` [->](customIndicators.md) <br>
This method is the reference to the `IndicatorCounted()` function in MQL4. <br>

You must use the `SetPrevCalculated()` method in the `OnCalculate()` function before using the `GetIndicatorCounted()` method. <br> 

See the reference [here](customIndicators-setPrevCalculated.md)

```cpp
//Declaration with its parameters
int GetIndicatorCounted();
```

## Parameters
`void`

## Return Value
`int`: <br>
Returns the amount of bars not changed after the indicator had been launched last.

<br>

# Example
```cpp
OnCalculate()
{
    //Initialize the prev_calculated variable
    CustomIndicators.SetPrevCalculated(prev_calculated);
    
    //Use the GetIndicatorCounted() method
    int counted_bars = CustomIndicators.GetIndicatorCounted();
}
```