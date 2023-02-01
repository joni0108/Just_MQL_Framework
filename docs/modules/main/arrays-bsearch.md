# BSearch() | Method
`From class CArrays` [->](arrays.md) <br>
Replaces the ArrayBsearch() from MQL4 and MQL5.

```cpp
//Declaration with its parameters
int BSearch(double &array[], double searched_value);
```

## Parameters
| Parameters       |   Type   | Description                                      |
| :--------------- | :------: | :----------------------------------------------- |
| `array[]`          | [double] | The array in which the seach will be implemented |
| `searched_value` | [double] | The value to be searched                         |

## Return Value
`int`: <br>
Returns the position of the searched value in the array. If the value is not found, returns -1.

<br>

**Note:** <br>
See the documentation of the ArrayBsearch() from MQL4 and MQL5 doocumentation for more information.