# Select() | Method
`From class CTicks` [->](ticks.md) <br>
Fills the class properties `m_timeframe` and `m_symbol` for further use of the other class methods of the class.

```cpp
//Declaration with its parameters
void Select(E_TIMEFRAMES timeframe, string symbol);
```

## Parameters
| Parameters  |      Type      | Description                                                                            |
| :---------- | :------------: | :------------------------------------------------------------------------------------- |
| `timeframe` | [E_TIMEFRAMES] | The timeframe from the [E_TIMEFRAMES](../../enumerations/e_timeframes.md) enumeration. |
| `symbol`    |    [string]    | The symbol that will be selected.                                                      |

## Return Value
`void`: <br>
Returns nothing.