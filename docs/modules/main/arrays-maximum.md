# Maximum() | Method
`From class CArrays` [->](arrays.md) <br>
Replaces the ArrayInitialize() from MQL4 and MQL5.

```cpp
//Declaration with its parameters
int Maximum(double &array[], int start=0, int count=WHOLE_ARRAY);
```

## Parameters
| Parameters |   Type   | Description               |
| :--------- | :------: | :------------------------ |
| `array[]`  | [double] | The source array.         |
| `start`    | [double] | index of start checking   |
| `count`    | [double] | Numer of checked elements |

## Return Value
`int`: <br>
The function returns an index of a found element taking into account the array serial. In case of failure it returns `-1`.

<br>

**Note:** <br>
See the documentation of the ArrayMaximum() from MQL4 and MQL5 doocumentation for more information.