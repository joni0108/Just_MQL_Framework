# CKeyPressed | Class
View the class source code for [mql4](../../../sources/terminal/keyPressedDictionayMQL4.mqh) and [mql5](../../../sources/terminal/keyPressedDictionayMQL5.mqh). <br>

### Description
This class will detect what key was pressed in the keyboard and return it as an string.

# Usage
The class name is `CKeyPressed`, you can declare a new object of this class or use the pre-defined object `GK`.

1. Use `string x = <obj_name>.GetKey(const int _lparam);` in the OnChartEvent function to get the key name.

## Key Names

| _lparam | Return Value |
| --- | --- |
| 65 | A |
| 66 | B |
| 67 | C |
| 68 | D |
| 69 | E |
| 70 | F |
| 71 | G |
| 72 | H |
| 73 | I |
| 74 | J |
| 75 | K |
| 76 | L |
| 77 | M |
| 78 | N |
| 79 | O |
| 80 | P |
| 81 | Q |
| 82 | R |
| 83 | S |
| 84 | T |
| 85 | U |
| 86 | V |
| 87 | W |
| 88 | X |
| 89 | Y |
| 90 | Z |
| 48 | 0 |
| 49 | 1 |
| 50 | 2 |
| 51 | 3 |
| 52 | 4 |
| 53 | 5 |
| 54 | 6 |
| 55 | 7 |
| 56 | 8 |
| 57 | 9 |
| 96 | T0 |
| 97 | T1 |
| 98 | T2 |
| 99 | T3 |
| 100 | T4 |
| 101 | T5 |
| 102 | T6 |
| 103 | T7 |
| 104 | T8 |
| 105 | T9 |
| 106 | T* |
| 107 | T+ |
| 109 | T- |
| 110 | T. |
| 111 | T/ |
| 186 | :* |
| 187 | ;+ |
| 188 | ,< |
| 189 | -= |
| 190 | .> |
| 191 | /? |
| 192 | @` |
| 219 | [{ |
| 220 | \| |
| 221 | ]} |
| 222 | ^~ |
| 226 | \_ |
| 112 | F1 |
| 113 | F2 |
| 114 | F3 |
| 115 | F4 |
| 116 | F5 |
| 117 | F6 |
| 118 | F7 |
| 119 | F8 |
| 120 | F9 |
| 121 | F10 |
| 122 | F11 |
| 123 | F12 |
| 8 | BackSpace |
| 12 | NumLockOFF T5 |
| 13 | Enter |
| 16 | Shift |
| 17 | Ctrl |
| 18 | Alt |
| 19 | Pause |