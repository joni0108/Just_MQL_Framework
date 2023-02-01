# CopySeries() | Method
`From class CArrays` [->](arrays.md) <br>
Replaces the ArrayCopySeries() from MQL4 and MQL5.

```cpp
//Declaration with its parameters
int CopySeries(double &array[], int series_index, string symbol=NULL,ENUM_TIMEFRAMES timeframe=PERIOD_CURRENT);
```

## Parameters
| Parameters     |       Type        | Description                                                              |
| :------------- | :---------------: | :----------------------------------------------------------------------- |
| `array[]`      |     [double]      | The source array.                                                        |
| `series_index` |    [E_CANDLES]    | The mode index from the [E_CANDLES](../../enumerations/e_candle_mode.md) |
| `symbol`       |     [string]      | The symbol                                                               |
| `timeframe`    | [ENUM_TIMEFRAMES] | The timeframe from the ENUM_TIMEFRAMES                                   |

## Return Value
`int`: <br>
Returns the amount of elements copied or `-1` if failed.

<br>

**Note:** <br>
See the documentation of the ArrayCopySeries() from MQL4 and MQL5 doocumentation for more information.