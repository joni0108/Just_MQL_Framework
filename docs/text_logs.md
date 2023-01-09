# CAccount class
This class will help you handle log files with a predefined format, adding logs to the file with just a single line. <br>

## Usage
```cpp
#include <Just_MQL_Framework/main.mqh> //Include the framework

//Creatin a class object
CLogs logsFile;

int OnInit()
{
    logsFile.Constructor("myFileName");
    logsFile.Initialize();
    logsFile.Add("Just logging xd", LOGS);
    
    logsFile.Unitialize();
}
```
## Class Methods
```cpp
//Class methods
void              Constructor(string name, string path = NULL, bool commonFlag = false);  //Class Constructor, call it in the OnInit()
void              Add(string details, LOG_TYPE type, int errorCode = 0);                  //Add a log to the file
void              Initialize();                                                           //Add the initialization line
void              Unitialize();                                                           //Add the deinitialization line
```

## Notes
You must call the non-default class constructor in the `OnInit()` or `OnStart` function before using the rest of the class methods. Use `<objName>.Constructor(<parameters>);` for doing that.