# Initialize() | Method
`From class CArrays` [->](arrays.md) <br>
Replaces the ArrayInitialize() from MQL4 and MQL5.

```cpp
//Declaration with its parameters
int Initialize(double &array[], double value);
int Initialize(int &array[], int value);
int Initialize(string &array[], string value);
int Initialize(datetime &array[], datetime value);
int Initialize(color &array[], color value);
int Initialize(bool &array[], bool value);
```

## Parameters
| Parameters |   Type   | Description             |
| :--------- | :------: | :---------------------- |
| `array[]`  |  [N/A]   | The source array.       |
| `value`    | [double] | The value to initialize |

## Return Value
`int`: <br>
No return value.

<br>

**Note:** <br>
See the documentation of the ArrayInitialize() from MQL4 and MQL5 doocumentation for more information.