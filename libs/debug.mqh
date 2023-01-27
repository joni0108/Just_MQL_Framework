#ifdef __MQL4__
#include "mql4/chart_testBut.mqh"
#endif

#ifdef __MQL5__
#include "mql5/chart_testBut.mqh"
#endif

class CDebug
{
private:
    /* data */
public:
    CDebug() {}
    ~CDebug() {}

    void Print(string function, int line);   //Print with a debug format
    void           Create(long chartId, int subWindow = 0, color colorBG = clrDarkGray, color colorText = clrWhite);    //Create a debug button
    bool           IsPressed();     //Check if the debug button is pressed
    void           Release();       //Release the debug button
    void           Delete();        //Delete the debug button
} Debug;

void CDebug::Print(string function, int line)
{

    Print("DEBUG ----> ", function, " - ", (string)line, " | Metatrader Error: ", Error.GetLast(), " | Description: ", Error.GetDescription());
}

void CDebug::Create(long chartId, int subWindow = 0, color colorBG = clrDarkGray, color colorText = clrWhite)
{
    _DebugButtonCreate(chartId, subWindow, colorBG, colorText);
}

bool CDebug::IsPressed()
{
    return _IsDebugButtonPressed();
}

void CDebug::Release()
{
    _DebugButtonOnClick();
}

void CDebug::Delete()
{
    _DeleteDebugBut();
}