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