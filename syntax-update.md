# Migrate your code from v1.42 -> v2
--- > How to to the conversion from v1.42 to v2

Here will be how to modify your code to run with the new version, however there's not the new libraries added, only the modification in the syntax of the libraries available in the v1.42.

# CChart Class
This class was splitted into 2 classes for the version 2 of the framework.

| From (v1.42)                     | To (v2)              | Description                   |
| :------------------------------- | :------------------- | :---------------------------- |
| `Chart.action.CloseAll()`        | `Chart.CloseAll()`   | The parameters are the same.  |
| `Chart.object.logo.Create()`     | `Chart.LogoCreate()` | The parameters are the same.  |
| `Chart.object.logo.Delete()`     | `Chart.LogoDelete()` | The parameters are the same.  |
| `Chart.object.debug.Create()`    | `Debug.Create()`     | The parameters are the same.  |
| `Chart.object.debug.IsPressed()` | `Debug.IsPressed()`  | The patrameters are the same. |
| `Chart.object.debug.Release()`   | `Debug.Release()`    | The parameters are the same.  |
| `Chart.object.debug.Delete()`    | `Debug.Delete()`     | The parameters are the same.  |

# CWebRequest Class
This class was splitted into 2 independent classes: CDiscord and CTelegram.

| From (v1.42)                          | To (v2)                                               | Description                                      |
| :------------------------------------ | :---------------------------------------------------- | :----------------------------------------------- |
| `CWebRequest <object_name>`           | `CDiscord <object_name>` or `CTelegram <object_name>` | Depends on the specific channel you want to use. |
| `WebRequest.discord.Constructor()`    | `<discord_object>.Create()`                           | The parameters are the same                      |
| `WebRequest.discord.SendMessage()`    | `<discord_object>.SendMessage()`                      | The parameters are the same.                     |
| `WebRequest.discord.SendScreenshot()` | `<discord_object>.SendScreenshot()`                   | The parameters are the same.                     |
| `WebRequest.telegram.Constructor()`   | `<telegram_object>.Create()`                          | The parameters are the same.                     |
| `WebRequest.telegram.SendMessage()`   | `<telegram_object>.SendMessage()`                     | The parameters are the same.                     |

The class `CWebRequest` and its pre-defined object `WebRequest` do not longer exist.

# Rest of classes
All the classes that have the `Constructor()` method was changed by `Create()` method in the new version.

**Example:** <br>
`Ticks.Constructor()` --> `Ticks.Create()` | Same parameters.