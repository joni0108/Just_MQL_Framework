class CDT
{
private:
    MqlDateTime _dt;
public:
    CDT(/* args */) {}
    int Day();
    int DayOfWeek();
    int DayOfYear();
    int Hour();
    int Minute();
    int Month();
    int Seconds();
    datetime Current();
    int TimeDay(datetime date);
    int TimeDayOfWeek(datetime date);
    int TimeDayOfYear(datetime date);
    int TimeHour(datetime date);
    int TimeMinute(datetime date);
    int TimeMonth(datetime date);
    int TimeSeconds(datetime date);
    int TimeYear(datetime date);
    int Year();
} DateTime;

int CDT::Day()
{
    TimeCurrent(_dt);
    return _dt.day;
}

int CDT::DayOfWeek()
{
    TimeCurrent(_dt);
    return _dt.day_of_week;
}

int CDT::DayOfYear()
{
    TimeCurrent(_dt);
    return _dt.day_of_year;
}

int CDT::Hour()
{
    TimeCurrent(_dt);
    return _dt.hour;
}

int CDT::Minute()
{
    TimeCurrent(_dt);
    return _dt.minute;
}

int CDT::Month()
{
    TimeCurrent(_dt);
    return _dt.mon;
}

int CDT::Seconds()
{
    TimeCurrent(_dt);
    return _dt.sec;
}

datetime CDT::Current()
{
    return TimeCurrent();
}

int CDT::TimeDay(datetime date)
{
    TimeToStruct(date, _dt);
    return _dt.day;
}

int CDT::TimeDayOfWeek(datetime date)
{
    TimeToStruct(date, _dt);
    return _dt.day_of_week;
}

int CDT::TimeDayOfYear(datetime date)
{
    TimeToStruct(date, _dt);
    return _dt.day_of_year;
}

int CDT::TimeHour(datetime date)
{
    TimeToStruct(date, _dt);
    return _dt.hour;
}

int CDT::TimeMinute(datetime date)
{
    TimeToStruct(date, _dt);
    return _dt.minute;
}

int CDT::TimeMonth(datetime date)
{
    TimeToStruct(date, _dt);
    return _dt.mon;
}

int CDT::TimeSeconds(datetime date)
{
    TimeToStruct(date, _dt);
    return _dt.sec;
}

int CDT::TimeYear(datetime date)
{
    TimeToStruct(date, _dt);
    return _dt.year;
}

int CDT::Year()
{
    TimeCurrent(_dt);
    return _dt.year;
}