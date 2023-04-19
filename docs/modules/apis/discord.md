# CDiscord | Class
View the class source code for [mql4](../../../sources/apis/discordMQL4.mqh) and [mql5](../../../sources/apis/discordMQL5.mqh). <br>

### Description
This class will send embbeded messages to a discord channel using a discord webhook.

# Usage
The class name is `CDiscord`, you can declare a new object of this class.

## Class Methods
- `Constructor(string webhook)` -> The class constructor, pass the webhook here.
- `void SendMessage(string msgName, string msgTitle, string message)` -> Sends a message
- `void SendScreenShot(string symbol, int _period, int ScreenWidth = 1912, int ScreenHeight = 1080)` -> Sends a chart screenshot if the chart is active.

## Usage Steps
1. Add the URL `discord.com` to the allowed web addresses in the terminal settings.
2. Declare the new class object using `CDiscord <obj_name>(string webhook)`.
3. Use `<obj_name>.<Method>()` or `Ticks.<Method>()` to use any of the class methods.

<br>

# Example
In this example we will initialize, use some methods.

```cpp
//--- EXAMPLE OF CLASS CTICKS ---
#property copyright "Just Up Corp"
#property strict

//--- Including the framework/library ---
#include <Just_MQL_Framework/modules/apis/discord.mqh>

//Variable that have the webhook
input string webhook = "";

//--- Creating the class objects ---
CDiscord discord(webhook);

//--- OnInit Function ---
int OnInit()
{
    discord.SendMessage("This is outside the embbed", "This is the embbed title", "This is the embbed body");
    discord.SendScreenshot("EURUSD", PERIOD_CURRENT);
    return(INIT_SUCCEEDED);
}
```