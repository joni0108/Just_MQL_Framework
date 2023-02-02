#include "../enumerations.mqh"

class CCustomIndicators
{
private:
    int prev_calculated_global;
public:
    CCustomIndicators() {}
    
    void SetPrevCalculated(int value) { prev_calculated_global = value;}
    int GetIndicatorCounted();
    void SetIndicatorDigits(int digits);
    void SetIndicatorShortName(string name);
    void SetIndicatorArrow(int arrow, int code);
    bool SetIndexBufferH(int index, double &buffer[]);
    void SetIndexDrawBegin(int index, int begin);
    void SetIndexEmptyValue(int index, double value);
    void SetIndexLabel(int index, string value);
    void SetIndexShift(int index, int value);
    void SetIndexStyle(int index, int type, int style=EMPTY, int width=EMPTY, color clr=CLR_NONE);
    void SetLevelStyle(int draw_style, int line_width, color clr=CLR_NONE);
    void SetLevelValue(int level, double value);

} CustomIndicators;

int CCustomIndicators::GetIndicatorCounted()
{
    if(prev_calculated_global > 0) return prev_calculated_global;
    if(prev_calculated_global == 0) return 0;
    return 0;
}

void CCustomIndicators::SetIndicatorDigits(int digits)
{
    IndicatorSetInteger(INDICATOR_DIGITS, digits);
}

void CCustomIndicators::SetIndicatorShortName(string name)
{
    IndicatorSetString(INDICATOR_SHORTNAME, name);
}

void CCustomIndicators::SetIndicatorArrow(int arrow, int code)
{
    PlotIndexSetInteger(arrow, PLOT_ARROW, code);
}

bool CCustomIndicators::SetIndexBufferH(int index, double &buffer[])
{
    return SetIndexBuffer(index, buffer, INDICATOR_DATA);
}

void CCustomIndicators::SetIndexDrawBegin(int index, int begin)
{
    PlotIndexSetInteger(index, PLOT_DRAW_BEGIN, begin);
}

void CCustomIndicators::SetIndexEmptyValue(int index, double value)
{
    PlotIndexSetDouble(index, PLOT_EMPTY_VALUE, value);
}

void CCustomIndicators::SetIndexLabel(int index, string value)
{
    PlotIndexSetString(index, PLOT_LABEL, value);
}

void CCustomIndicators::SetIndexShift(int index, int value)
{
    PlotIndexSetInteger(index, PLOT_SHIFT, value);
}

void CCustomIndicators::SetIndexStyle(int index, int type, int style=EMPTY, int width=EMPTY, color clr=CLR_NONE)
{
    if(width > -1)
        PlotIndexSetInteger(index, PLOT_LINE_WIDTH, width);
    if(clr != CLR_NONE)
        PlotIndexSetInteger(index, PLOT_LINE_COLOR, clr);
    
    switch (type)
    {
    case 0:
        PlotIndexSetInteger(index, PLOT_DRAW_TYPE, DRAW_LINE);
        break;
    case 1:
        PlotIndexSetInteger(index, PLOT_DRAW_TYPE, DRAW_SECTION);
        break;
    case 2:
        PlotIndexSetInteger(index, PLOT_DRAW_TYPE, DRAW_HISTOGRAM);
        break;
    case 3:
        PlotIndexSetInteger(index, PLOT_DRAW_TYPE, DRAW_ARROW);
        break;
    case 4:
        PlotIndexSetInteger(index, PLOT_DRAW_TYPE, DRAW_ZIGZAG);
        break;
    case 12:
        PlotIndexSetInteger(index, PLOT_DRAW_TYPE, DRAW_NONE);
        break;
    
    default: PlotIndexSetInteger(index, PLOT_DRAW_TYPE, DRAW_LINE);
        break;
    }

    switch (style)
    {
    case 0:
        PlotIndexSetInteger(index, PLOT_LINE_STYLE, STYLE_SOLID);
        break;
    case 1:
        PlotIndexSetInteger(index, PLOT_LINE_STYLE, STYLE_DASH);
        break;
    case 2:
        PlotIndexSetInteger(index, PLOT_LINE_STYLE, STYLE_DOT);
        break;
    case 3:
        PlotIndexSetInteger(index, PLOT_LINE_STYLE, STYLE_DASHDOT);
        break;
    case 4:
        PlotIndexSetInteger(index, PLOT_LINE_STYLE, STYLE_DASHDOTDOT);
        break;
    
    default: return;
        break;
    }
}

void CCustomIndicators::SetLevelStyle(int draw_style, int line_width, color clr=CLR_NONE)
{
    IndicatorSetInteger(INDICATOR_LEVELWIDTH, line_width);
    
    if(clr != CLR_NONE)
        IndicatorSetInteger(INDICATOR_LEVELCOLOR, clr);

    switch (draw_style)
    {
    case 0:
        IndicatorSetInteger(INDICATOR_LEVELSTYLE, STYLE_SOLID);
        break;
    case 1:
        IndicatorSetInteger(INDICATOR_LEVELSTYLE, STYLE_DASH);
        break;
    case 2:
        IndicatorSetInteger(INDICATOR_LEVELSTYLE, STYLE_DOT);
        break;
    case 3:
        IndicatorSetInteger(INDICATOR_LEVELSTYLE, STYLE_DASHDOT);
        break;
    case 4:
        IndicatorSetInteger(INDICATOR_LEVELSTYLE, STYLE_DASHDOTDOT);
        break;
    
    default: return;
        break;
    }
}

void CCustomIndicators::SetLevelValue(int level, double value)
{
    IndicatorSetDouble(INDICATOR_LEVELVALUE, level, value);
}