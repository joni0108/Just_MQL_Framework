# CTelegram | Class
View the class source code for [mql4](../../../sources/apis/telegramMQL4.mqh) and [mql5](../../../sources/apis/telegramMQL5.mqh). <br>

### Description
This class will send messages and images to a telegram channel or group using a telegram bot.

# Usage
The class name is `CTelegram`, you can declare a new object of this class.

## Class Methods
- `Constructor(string telegramToken, string telegramChatId)` -> The class constructor, pass the telegram bot token and telegram chat id.
- `void bool SendMessage(string message, string filePath = "");` -> Sends a message and an image (optional)

### Notes
You must pass the image path in order to send an image. This does mean that if you want to send a screenshot, you must take it first using the built-in metaquotes funtion and then pass the file path.

## Usage Steps
1. Add the URL `https://api.telegram.org` to the allowed web addresses in the terminal settings.
2. Declare the new class object using `CTelegram <obj_name>(string telegramToken, string telegramChatId)`.
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

//External variables
input string botToken = "";
input string chatId = "";

//--- Creating the class objects ---
CTelegram telegram(botToken, chatId);

//--- OnInit Function ---
int OnInit()
{
    telegram.SendMessage("This is a message without image");
    return(INIT_SUCCEEDED);
}
```