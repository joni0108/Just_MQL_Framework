# DT | Class
View the class source code for [mql4](../../../sources/main/datetimeMQL4.mqh) and [mql5](../../../sources/main/datetimeMQL5.mqh). <br>

### Description
This add some of the MQL4 datetime functions to MQL5.

# Usage
The class name is `CDT`, you can declare a new object of this class or use the pre-defined object `DateTime`.

## Class Methods
- `int Day()` - Returns the day of the month (1-31) of the specified datetime value.
- `int DayOfWeek()` - Returns the day of the week (1-7) of the specified datetime value.
- `int DayOfYear()` - Returns the day of the year (1-366) of the specified datetime value.
- `int Hour()` - Returns the hour (0-23) of the specified datetime value.
- `int Minute()` - Returns the minute (0-59) of the specified datetime value.
- `int Month()` - Returns the month (1-12) of the specified datetime value.
- `int Second()` - Returns the second (0-59) of the specified datetime value.
- `datetime TimeCurrent()` - Returns the current datetime value.
- `int TimeDay()` - Returns the day from the specified datetime value.
- `int TimeDayOfWeek()` - Returns the day of the week from the specified datetime value.
- `int TimeDayOfYear()` - Returns the day of the year from the specified datetime value.
- `int TimeHour()` - Returns the hour from the specified datetime value.
- `int TimeMinute()` - Returns the minute from the specified datetime value.
- `int TimeMonth()` - Returns the month from the specified datetime value.
- `int TimeSecond()` - Returns the second from the specified datetime value.
- `int TimeYear()` - Returns the year from the specified datetime value.
- `int Year()` - Returns the year.

## Usage Steps
1. Declare the new class object using `CDT <obj_name>`. If you want to use the pre-defined class object `DateTime`, do not declare the new class object.
2. Use `<obj_name>.<Method>()` or `DateTime.<Method>()` to use any of the class methods.

### Notes
You can use the MqlDateTime structure instead of loading this class to your project. MqlDateTime structure is available for MQL4 and MQL5. <br>

<br>