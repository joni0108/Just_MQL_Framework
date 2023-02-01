# CArrays | Class
View the class source code for [mql4](../../../sources/main/arraysMQL4.mqh) and [mql5](../../../sources/main/arraysMQL5.mqh). <br>

### Description
Includes all the arrays-built-in functions that have different syntax in MQL4 and MQL5.

# Usage
The class name is `Arrays`, you can declare a new object of this class or use the pre-defined object `Arrays`.

## Class Methods
- `int BSearch()` [->](arrays-bsearch.md) The ArrayBSearch() from MQL4 and MQL5.
- `int Copy()` [->](arrays-copy.md) The ArrayCopy() from MQL4 and MQL5.
- `int CopySeries()` [->](arrays-copySeries.md) The ArrayCopySeries() from MQL4 and MQL5.
- `int Initialize()` [->](arrays-initialize.md) The ArrayInitialize() from MQL4 and MQL5.
- `int Maximum()` [->](arrays-maximum.md) The ArrayMaximum() from MQL4 and MQL5.
- `int ArraySort()` [->](arrays-arraySort.md) The ArraySort() from MQL4 and MQL5.

### Setters
- `SetName(string name)` -> Sets the **name** property of the class.
- `SetActive(bool active)` -> Sets the **IsActive** property of the class.

### Getters
- [string] `GetName()` -> Returns the **name** property of the class.
- [bool] `GetActive()` -> Returns the **IsActive** property of the class.

## Usage Steps
1. Declare the new class object using `CName <obj_name>`. If you want to use the pre-defined class object `Name`, do not declare the new class object.
2. Use `<obj_name>.Create()` or `Name.Create()` method to initialize the class object in the `OnInit()` function.
3. Use `<obj_name>.<Method>()` or `Name.<Method>()` to use any of the class methods.
4. Do not forget to use `<obj_name>.Destroy()` or `Name.Destroy()` in the `OnDeinit()` function to delete the class object.

### Notes
Any notes?

<br>

# Example
In this example we will initialize, use some methods, and destroy a class object.

```cpp
//--- EXAMPLE OF CLASS ---
#property copyright "Just Up Corp"
#property strict

//--- Including the framework/library ---
#include <...>

//--- Creating the class objects ---
CName name;

//--- OnInit Function ---
int OnInit()
{


    return INIT_SUCCEEDED;
}

//--- OnDeinit Function ---
void OnDeinit(const int reason)
{

}

//--- OnTick Function ---
void OnTick()
{

}

//--- OnChartEvent Function ---
void OnChartEvent(const int id,const long& lparam,const double& dparam,const string& sparam)
{

}
```

## Example Flow Chart
Attach the flowchart of the code used in this example.