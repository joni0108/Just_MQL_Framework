# CWebRequests class
This class will help handling web requests <br>

## Usage
1- Add the following urls to your allowed Web Request addresses in your platform:
    - https://discord.com
    - https://api.telegram.com
```cpp
#include <Just_MQL_Framework/main.mqh> //Include the framework

//Creating a class object or...
CWebRequests webRequest;

//Getting the webhook
input string webHook = "";

//Use the predefined class name 'WebRequest'
int OnInit()
{
    WebRequest.discord.Constructor(webHook);

}

void OnChartEvent(const int id,const long& lparam,const double& dparam,const string& sparam)
  {
      if(Chart.object.debug.IsPressed() == true)
        {
            Print("The button was pressed");
            WebRequest.discord.SendMessage("Hola", "Como", "Estas");
            Chart.object.debug.Release();
        }
  }
```
## Class Methods
```cpp
//Class methods
    WebRequest.discord.Constructor(webHook);                                                                            //Discord Constructor, REQUIRED before any other line
    WebRequest.discord.SendMessage(string msgName, string msgTitle, string message);                                    //Send an embed message to discord, all the fields must be different to ""
    WebRequest.discord.SendScreenshot(string symbol, int _period, int ScreenWidth = 1912, int ScreenHeight = 1080);     //Take a chart screenshot and send it to discord

    WebRequest.telegram.Constructor(string telegramToken, string telegramChatId);                                       //Telegram Constructor, REQUIRED before any other line
    WebRequest.telegram.SendMessage(string message, string filePath = "");                                              //Send a message and image to a telegram channel
```

## Notes
You must call the non-default class constructor in the `OnInit()` or `OnStart` function before using the rest of the class methods. Use `<objName>.Constructor(<parameters>);` for doing that.

## Common Errors
- Error 4060 - Please, make sure you have the URLs listed in the `usage` in your allowed webRequest addresses.