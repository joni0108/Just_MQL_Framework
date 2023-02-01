# Copy() | Method
`From class CArrays` [->](arrays.md) <br>
Replaces the ArrayCopy() from MQL4 and MQL5.

```cpp
//Declaration with its parameters
int Copy(int &dest[], int &source[], int startDest=0, int startSource=0, int count=WHOLE_ARRAY);
int Copy(double &dest[], double &source[], int startDest=0, int startSource=0, int count=WHOLE_ARRAY);
int Copy(string &dest[], string &source[], int startDest=0, int startSource=0, int count=WHOLE_ARRAY);
int Copy(datetime &dest[], datetime &source[], int startDest=0, int startSource=0, int count=WHOLE_ARRAY);
int Copy(color &dest[], color &source[], int startDest=0, int startSource=0, int count=WHOLE_ARRAY);
int Copy(bool &dest[], bool &source[], int startDest=0, int startSource=0, int count=WHOLE_ARRAY);
```

## Parameters
| Parameters    | Type  | Description                                  |
| :------------ | :---: | :------------------------------------------- |
| `dest[]`      | [N/A] | The source array.                            |
| `source[]`    | [N/A] | The destination array.                       |
| `startDest`   | [int] | The start position in the destination array. |
| `startSource` | [int] | The start position in the source array.      |
| `count`       | [int] | The number of elements to be copied.         |

## Return Value
`int`: <br>
Returns the amount of elements copied.

<br>

**Note:** <br>
See the documentation of the ArrayCopy() from MQL4 and MQL5 doocumentation for more information.