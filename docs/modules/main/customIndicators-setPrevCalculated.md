# SetPrevCalculated() | Method
`From class CCustomIndicators` [->](customIndicators.md) <br>
This method initialize the `prev_calculated` variable in the `OnCalculate()` function. This variable is used in the `GetIndicatorCounted()` method. <br>
If you will not use the `GetIndicatorCounted()` method, you do not need to use this method.

```cpp
//Declaration with its parameters
void SetPrevCalculated(int value);
```

## Parameters
| Parameters |  Type  | Description                                                         |
| :--------- | :----: | :------------------------------------------------------------------ |
| `value`    | [type] | Pass the `prev_calculated` variable in the `OnCalculate()` function |

## Return Value
`void`: <br>
returns nothing.

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