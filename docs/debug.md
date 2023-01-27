# CDebug class
This class doesn't debug as the real definition, but have some methods that will help you detect bugs, failures in the coding logic, and print messages with a pre-defined format.

## Table of Contents
- [CDebug class](#cdebug-class)
  - [Table of Contents](#table-of-contents)
- [Installation](#installation)
- [Usage](#usage)
  - [Print()](#print)
  - [Create()](#create)
  - [IsPressed()](#ispressed)
  - [Release()](#release)
  - [Delete()](#delete)
- [Example](#example)

# Installation
1. **You need to call the framework in the beginning of your script, see the main [README](../README.md) file for more information.**

# Usage
Yoou can use the pre-defined `Debug` class object to call the methods of the class.

## Print()
Will print a message with a pre-defined format.

```cpp
Print(
    string function, //The name of the function, use __FUNCTION__
    string line,     //The line of the code, use __LINE__
)
```

Return value: `void`

## Create()
It will make a pre-defined button on the chart.

```cpp
Create(
    long chartId,                   //The id of the chart
    int subWindow = 0,              //The subwindow of the chart
    color colorBG = clrDarkGray,    //The background color of the button
    color colorText = clrWhite      //The text color of the button
    );
```

Return value: `void`

## IsPressed()
It will return true if the button is pressed.

```cpp
IsPressed();
```

Return value: `bool` - True if the button is pressed.

## Release()
It will release the button.

```cpp
Release();
```

Return value: `void`

## Delete()
It will delete the button.

```cpp
Delete();
```

# Example
This example will print a message when the button is pressed.

```cpp
//+------------------------------------------------------------------+
//| Example program for the CTicks class                             |
//+------------------------------------------------------------------+
//--- Importing the framework
#include <Just_MQL_Framework/main.mqh>

//--- OnInit function
int OnInit()
{
    //--- Create the debug button
    Debug.Create(ChartId(), 0, clrDarkGray, clrWhite);

    ExpertRemove();
    return(INIT_SUCCEEDED);
}

//--- Deinit function
void OnDeinit(const int reason)
{
    //--- Deleting the button
    Debug.Delete();
}

//--- OnChartEvent function
void OnChartEvent(const int id, const long &lparam, const double &dparam, const string &sparam)
{
    //--- Checking if the button is pressed
    if(Debug.IsPressed())
    {
        //--- Printing a message
        Debug.Print(__FUNCTION__, __LINE__);
        //--- Releasing the button
        Debug.Release();
    }
}
```