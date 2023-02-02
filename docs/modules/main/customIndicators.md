# CCustomIndicators | Class
View the class source code for [mql4](../../../sources/main/customIndicatorsMQL4.mqh) and [mql5](../../../sources/main/customIndicatorsMQL5.mqh). <br>

### Description
This class have all the uncompatible MQL4 and MQL5 functions related to custom indicators.

# Usage
The class name is `CCustomIndicators`, you can declare a new object of this class or use the pre-defined object `CustomIndicators`.

## Class Methods
- `void SetPrevCalculated()` [->](customIndicators-setPrevCalculated.md) Sets the internal property `prev_calculated` to a value.
- `int GetIndicatorCounted()` [->](customIndicators-getIndicatorCounted.md) Reference to the `IndicatorCounted()` function in MQL4.
- `void SetIndicatorDigits()` [->](customIndicators-setIndicatorDigits.md) Reference to the `IndicatorDigits()` function in MQL4.
- `void SetIndicatorShortName()` [->](customIndicators-setIndicatorShortName.md) Reference to the `IndicatorShortName()` function in MQL4.
- `void SetIndicatorArrow()` [->](customIndicators-setIndicatorArrow.md) Reference to the `IndicatorArrow()` function in MQL4.
- `bool SetIndexBufferH()` [->](customIndicators-setIndexBufferH.md) Reference to the `SetIndexBuffer()` function in MQL4.
- `void SetIndexDrawBegin()` [->](customIndicators-setIndexDrawBegin.md) Reference to the `SetIndexDrawBegin()` function in MQL4.
- `void SetIndexEmptyValue()` [->](customIndicators-setIndexEmptyValue.md) Reference to the `SetIndexEmptyValue()` function in MQL4.
- `void SetIndexLabel()` [->](customIndicators-setIndexLabel.md) Reference to the `SetIndexLabel()` function in MQL4.
- `void SetIndexShift()` [->](customIndicators-setIndexShift.md) Reference to the `SetIndexShift()` function in MQL4.
- `void SetIndexStyle()` [->](customIndicators-setIndexStyle.md) Reference to the `SetIndexStyle()` function in MQL4.
- `void SetLevelStyle()` [->](customIndicators-setLevelStyle.md) Reference to the `SetLevelStyle()` function in MQL4.
- `void SetIndexValue()` [->](customIndicators-setIndexValue.md) Reference to the `SetIndexValue()` function in MQL4.

## Usage Steps
1. Declare the new class object using `CCustomIndicators <obj_name>`. If you want to use the pre-defined class object `CustomIndicator`, do not declare the new class object.
2. Use `<obj_name>.SetPrevCalculated()` or `CustomIndicators.SetPrevCalculated()` method in the `OnCalculate()` function and pass the `prev_calculated` value as a parameter if you want to use the `IndicatorCounted()` method.
3. Use `<obj_name>.<Method>()` or `CustomIndicators.<Method>()` to use any of the class methods.

### Notes
If you use the `GetIndicatorCounted()` method, you must use the `SetPrevCalculated()` method before within the `OnCalculate()` function passing the `prev_calculated` value as a parameter. If you do not do that, the `GetIndicatorCounted()` method will return an uninitialized value.

<br>