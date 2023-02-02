class CCustomIndicators
{
public:
    CCustomIndicators() {}

    void SetPrevCalculated(int value) { return;}
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
    return IndicatorCounted();
}

void CCustomIndicators::SetIndicatorDigits(int digits)
{
    IndicatorDigits(digits);
}

void CCustomIndicators::SetIndicatorShortName(string name)
{
    IndicatorShortName(name);
}

void CCustomIndicators::SetIndicatorArrow(int arrow, int code)
{
    SetIndicatorArrow(arrow, code);
}

bool CCustomIndicators::SetIndexBufferH(int index, double &buffer[])
{
    return SetIndexBuffer(index, buffer);
}

void CCustomIndicators::SetIndexDrawBegin(int index, int begin)
{
    SetIndexDrawBegin(index, begin);
}

void CCustomIndicators::SetIndexEmptyValue(int index, double value)
{
    SetIndexEmptyValue(index, value);
}

void CCustomIndicators::SetIndexLabel(int index, string value)
{
    SetIndexLabel(index, value);
}

void CCustomIndicators::SetIndexShift(int index, int value)
{
    SetIndexShift(index, value);
}

void CCustomIndicators::SetIndexStyle(int index, int type, int style=EMPTY, int width=EMPTY, color clr=CLR_NONE)
{
    SetIndexStyle(index, type, style, width, clr);
}

void CCustomIndicators::SetLevelStyle(int draw_style, int line_width, color clr=CLR_NONE)
{
    SetLevelStyle(draw_style, line_width, clr);
}

void CCustomIndicators::SetLevelValue(int level, double value)
{
    SetLevelValue(level, value);
}