//Conversion Functions
string CharToStr(int char_code)
{
    return CharToString(char_code);
}

string DoubleToStr(double value, int digits)
{
    return DoubleToString(value, digits);
}

double StrToDouble(string value)
{
    return StringToDouble(value);
}

int StrToInteger(string value)
{
    return StringToInteger(value);
}

datetime StrToTime(string value)
{
    return StringToTime(value);
}

string TimeToStr(datetime value, int format)
{
    return TimeToString(value, format);
}