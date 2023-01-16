# CError class
This class will handle the errors of MQL and framework <br>

## Usage
```cpp
#include <Just_MQL_Framework/main.mqh> //Include the framework

//Creating a class object or...
CError error;

//Use the predefined class name 'Error'
int OnInit()
{
    Print("Error code: " + (string)Error.GetLast);
    Print("Description: " + Error.GetLastDescription());
    
}
```
## Class Methods
```cpp
//Class methods
   void              ResetLast();            //Reset the last error
   int               GetLast();              //Get the last error (MQL errors has priority over the framework errors)
   int               GetLastFramework();     //Get the last framework error (check if an MQL error is present and want to check escpecially the framework errors)
   string            GetLastDescription(bool framework = false);   //Get the description of the last error
   void              _SetLast(int error);    //Set the last error (INTERNAL USE ONLY, PLEASE, DO NOT CALL IT)
```

## Notes
The class will make the internal MQL errors a priority over the internal framework error, this means that if there was an error on MQL and the framework at the same time,
the MQL error will be returned when calling `Error.getLast()` instead of the framework error. <br>
You can use `Error.GetLastFramework()` always to check if there's an specific framework error. <br>
When calling `Error.GetLastDescription()`, by default will return the higher priority error, however you can pass it the value of `true` as parameter to get only the description of the framework error. <br> <br>

Be advice that `Error.SetLast()` is an internal "private" method that is used by the framework, do not call it in your code, or can have unexpected results.