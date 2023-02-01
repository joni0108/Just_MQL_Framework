class CArrays
{
public:
        CArrays() {}
        int BSearch(double &array[], double searched_value);
        int Copy(int &dest[], int &source[], int startDest=0, int startSource=0, int count=WHOLE_ARRAY);
        int Copy(double &dest[], double &source[], int startDest=0, int startSource=0, int count=WHOLE_ARRAY);
        int Copy(string &dest[], string &source[], int startDest=0, int startSource=0, int count=WHOLE_ARRAY);
        int Copy(datetime &dest[], datetime &source[], int startDest=0, int startSource=0, int count=WHOLE_ARRAY);
        int Copy(color &dest[], color &source[], int startDest=0, int startSource=0, int count=WHOLE_ARRAY);
        int Copy(bool &dest[], bool &source[], int startDest=0, int startSource=0, int count=WHOLE_ARRAY);
        int CopySeries(double &array[], int series_index, string symbol=NULL,ENUM_TIMEFRAMES timeframe=PERIOD_CURRENT);
        int Initialize(double &array[], double value);
        int Initialize(int &array[], int value);
        int Initialize(datetime &array[], datetime value);
        int Initialize(color &array[], color value);
        int Initialize(bool &array[], bool value);
        int Maximum(double &array[], int start=0, int count=WHOLE_ARRAY);
        bool Sort(double &array[], int count=WHOLE_ARRAY, int start=0, int mode=MODE_ASCEND);

} Arrays;

int CArrays::BSearch(double &array[], double searched_value)
{
    return ArrayBsearch(array, searched_value);
}

int CArrays::Copy(int &dest[], int &source[], int startDest, int startSource, int count)
{
    return ArrayCopy(dest, source, startDest, startSource, count);
}

int CArrays::Copy(double &dest[], double &source[], int startDest, int startSource, int count)
{
    return ArrayCopy(dest, source, startDest, startSource, count);
}

int CArrays::Copy(string &dest[], string &source[], int startDest, int startSource, int count)
{
    return ArrayCopy(dest, source, startDest, startSource, count);
}

int CArrays::Copy(datetime &dest[], datetime &source[], int startDest, int startSource, int count)
{
    return ArrayCopy(dest, source, startDest, startSource, count);
}

int CArrays::Copy(color &dest[], color &source[], int startDest, int startSource, int count)
{
    return ArrayCopy(dest, source, startDest, startSource, count);
}

int CArrays::Copy(bool &dest[], bool &source[], int startDest, int startSource, int count)
{
    return ArrayCopy(dest, source, startDest, startSource, count);
}

int CArrays::CopySeries(double &array[], int series_index, string symbol=NULL,ENUM_TIMEFRAMES timeframe=PERIOD_CURRENT)
{
    return ArrayCopySeries(array, series_index, symbol, timeframe);
}

int CArrays::Initialize(double &array[], double value)
{
    return ArrayInitialize(array, value);
}

int CArrays::Initialize(int &array[], int value)
{
    return ArrayInitialize(array, value);
}

int CArrays::Initialize(datetime &array[], datetime value)
{
    return ArrayInitialize(array, value);
}

int CArrays::Initialize(color &array[], color value)
{
    return ArrayInitialize(array, value);
}

int CArrays::Initialize(bool &array[], bool value)
{
    return ArrayInitialize(array, value);
}

int CArrays::Maximum(double &array[], int start, int count)
{
    return ArrayMaximum(array, count, start);
}

bool CArrays::Sort(double &array[], int count, int start, int mode)
{
    return (bool)ArraySort(array, count, start, mode);
}