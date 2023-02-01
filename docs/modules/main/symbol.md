# CSymbol | Class
View the class source code for [mql4](../../../sources/main/symbol.mqh) and [mql5](../../../sources/main/symbol.mqh). It is the same file for both of them. <br>

### Description
This class return information about the symbols.

# Usage
The class name is `CSymbol`, you can declare a new object of this class or use the pre-defined object `Symbol`.

## Class Methods
- `void Select()` [->](symbol-select.md) Selects a symbol for further use.
- `string GetString()` [->](symbol-getString.md) Returns the symbol string information.
- `int GetInteger()` [->](symbol-getInteger.md) Returns the symbol integer information.
- `double GetDouble()` [->](symbol-getDouble.md) Returns the symbol double information.

## Usage Steps
1. Declare the new class object using `CSymbol <obj_name>`. If you want to use the pre-defined class object `Symbol`, do not declare the new class object.
2. Use `<obj_name>.Select()` or `Symbol.Select()` method to initialize the class object in the `OnInit()` function.
3. Use `<obj_name>.<Method>()` or `Symbol.<Method>()` to use any of the class methods.

### Notes
This class does the same as `SymbolInfoInteger()`, `SymbolInfoDouble()` and `SymbolInfoString()` functions from the MQL4/5 language. These functions are compatible with both languages, so it is not necessary to include or use this class. However, if your project uses an unique symbol or `Symbol()` function the whole program, you can use this to not have to pass the symbol as parameter everytime you need symbol information.