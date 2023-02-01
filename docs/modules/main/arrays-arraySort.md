# ArraySort() | Method
`From class CArrays` [->](arrays.md) <br>
Replaces the ArrayInitialize() from MQL4 and MQL5.

```cpp
//Declaration with its parameters
int ArraySort(double &array[], int count=WHOLE_ARRAY, int start=0, int mode=MODE_ASCEND);
```

## Parameters
| Parameters |   Type   | Description                                   |
| :--------- | :------: | :-------------------------------------------- |
| `array[]`  | [double] | The source array.                             |
| `count`    | [double] | Number of elements to sort                    |
| `start`    | [double] | The start position of the array               |
| `mode`     |  [int]   | Sorting mode. `MODE_ASCEND` or `MODE_DESCEND` |

## Return Value
`bool`: <br>
The function returns true on success, otherwise  - false.

<br>

**Note:** <br>
See the documentation of the ArraySort() from MQL4 and MQL5 doocumentation for more information.