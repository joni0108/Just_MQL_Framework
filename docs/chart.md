# CChart class
<<<<<<< HEAD

## TODO
- [ ] Split the class into modules
- [ ] Add the new methods of `long Chart.Find(string symbol, string timeframe);`
- [ ] Add the `bool ChartSelect(long chartID);` and all the .Get methods

--------------------------------------------------------------------------- OLD
# CChart class
This class will help yoou handle chart actions and chart objects <br>

## Usage
```cpp
#include <Just_MQL_Framework/main.mqh> //Include the framework

//Creating a class object or...
CChart chart;

//Use the predefined class name 'Chart'
int OnInit()
{
    Chart.action.CloseAll(false);
    
}

void OnChartEvent(const int id,const long& lparam,const double& dparam,const string& sparam)
  {
      if(Chart.object.debug.IsPressed() == true)
        {
            Print("The button was pressed");
            Chart.object.debug.Release();
        }
  }
```
## Class Methods
```cpp
//Class methods
//ACTIONS - Are methods that perform actions in the chart
    Chart.action.CloseAll(bool includeCurrent, string ignoreWithComment = NULL);    //Closes all the charts, except current and the one with a comment if selected
//OBJECTS - Are methods that handle chart objects
    Chart.object.logo.Create(long chartId, ENUM_CHART_SIDE _side, string imagePath, int subWindow = 0, int xOffset = 20, int yOffset = 20);     //Creates a chart object ready to pass a logo to it. Pass the image in the imagePath parameter like "\\Image\\<name>.bmp".
    Chart.object.logo.Delete(); //Destroys the object

    Chart.object.debug.Create(long chartId, int subWindow = 0, color colorBG = clrDarkGray, color colorText = clrWhite);    //Creates a debug button very easy to debug your functions, call it in OnInit() function.
    Chart.object.debug.IsPressed(); //Returns true if the button is pressed
    Chart.object.debug.Release(); //Will release the pressed button, call it in the OnChartEvent() function after your execution
    Chart.object.debug.Delete();    //Destroy the debug
```
=======
This class will have some features to help you handle charts.

- [CChart class](#cchart-class)
- [Installation](#installation)
- [Usage](#usage)
  - [CloseAll()](#closeall)
  - [FindChart()](#findchart)
  - [LogoCreate()](#logocreate)
    - [Notes](#notes)
  - [LogoDelete()](#logodelete)
- [Example](#example)
    - [Intallation](#intallation)
- [Errors](#errors)

# Installation
1. **You need to call the framework in the beginning of your script, see the main [README](../README.md) file for more information.**

# Usage
You can use the pre-defined `Chart` object, or create a new `CChart` class object.

## CloseAll()
This method closes all the opened charts.

```cpp
CloseAll(
        bool includeCurrent = false,   //If true, the current chart will be closed too
        bool ignoreWithComment = NULL  //If provided, the charts with this comment will not be closed
);
```

Return value: `void`

## FindChart()
This method finds a chart by the symbol and timeframe.

```cpp
FindChart(
        string symbol,        //The symbol of the chart
        string timeframe      //The timeframe of the chart
);
```

***Parameters:***
- `symbol` - The symbol of the chart.
- `timeframe` - The timeframe of the chart. It must be:
  - `CURRENT` - The current chart.
  - `M1` - 1 minute.
  - `M5` - 5 minutes.
  - `M15` - 15 minutes.
  - `M30` - 30 minutes.
  - `H1` - 1 hour.
  - `H4` - 4 hours.
  - `D1` - 1 day.
  - `W1` - 1 week.
  - `MN1` - 1 month.

## LogoCreate()
This method creates a logo on the chart.

```cpp
LogoCreate(
            long chartId,           //The id of the chart
            ENUM_CHART_SIDE _side,  //The side of the chart
            string imagePath,       //The path of the image
            int subWindow = 0,      //The subwindow of the chart
            int xOffset = 20,       //The x offset of the logo from the corner
            int yOffset = 20        //The y offset of the logo from the corner
);
```

***Parameters:***
- `ENUM_CHART_SIDE` - The side of the chart, can be 
  - CHART_SIDE_LEFT_UP
  - CHART_SIDE_RIGHT_UP
  - CHART_SIDE_RIGHT_DOWN 
  - CHART_SIDE_LEFT_DOWN
- `imagePath` - The path of the image, try using `\\Images\\<name>.bmp`.

### Notes
The image must be a bitmap image, and the size in the chart will be equally to the size of the image in pixels.

Return value: `bool` - `true` if the logo was created successfully, `false` if it failed.

## LogoDelete()
This method deletes a logo from the chart.

```cpp
LogoDelete();
```

Return value: `void`

# Example
This example will create a logo in the chart, close all the other charts, and return the chart id of the BTCUSD, M1 chart.
### Intallation
You must have an image with the name `logo.bmp` in the `Images` folder.

```cpp
//+------------------------------------------------------------------+
//| Example program for the CTicks class                             |
//+------------------------------------------------------------------+
//--- Importing the framework
#include <Just_MQL_Framework/main.mqh>

int OnInit()
{
    Chart.CloseAll(false);

    //--- Creating a logo
    Chart.LogoCreate(Chart.FindChart("BTCUSD", "M1"), CHART_SIDE_RIGHT_DOWN, "\\Images\\logo.bmp");

    if(Chart.FindChart("BTCUSD", "M1") == -1)
        Print("The chart was not found");
    else
        Print("The chart was found, its id is: ", Chart.FindChart("BTCUSD", "M1"));

    Sleep(10000);

    ExpertRemove();
    return(INIT_SUCCEEDED);
}

void OnDeinit(const int reason)
{
    //--- Removing the logo
    Chart.LogoDelete();
}
```

# Errors
- `ERR_INVALID_PARAMETERS` - The parameters are invalid in one of the methods.
>>>>>>> main
