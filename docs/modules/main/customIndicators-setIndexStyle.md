# SetIndexStyle() | Method
`From class CCustomIndicators` [->](customIndicators.md) <br>
This method is the reference to the `SetIndexStyle()` function in MQL4. <br>

```cpp
//Declaration with its parameters
void SetIndexStyle(int index, int type, int style=EMPTY, int width=EMPTY, color clr=CLR_NONE);
```

## Parameters
`void`
| Parameters |  Type   | Description                                                                                |
| :--------- | :-----: | :----------------------------------------------------------------------------------------- |
| `index`    |  [int]  | Line index. Must lie between 0 and 7.                                                      |
| `type`     |  [int]  | Shape style                                                                                |
| `style`    |  `int`  | Drawing style. It is used for one-pixel thick lines                                        |
| `width`    |  `int`  | Line width. Valid values are: 1,2,3,4,5. EMPTY value means that width will not be changed. |
| `clr`      | `color` | Line color. Absence of this parameter means that the color will not be changed.            |

## Return Value
`void`: <br>
Returns nothing.