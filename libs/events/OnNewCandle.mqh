//--- This will return true on a new candle

class OnNewCandle
{
private:
    int period;
    datetime m_lastCandleTime;
public:
    OnNewCandle() {}
    void Create(string timeframe);
    bool IsNewCandle();
};

void OnNewCandle::Create(string timeframe)
{

    if(timeframe == "CURRENT")
      period = PERIOD_CURRENT;
   else if(timeframe == "M1")
      period = 1;
    else if(timeframe == "M5")
      period = 5;
    else if(timeframe == "M15")
      period = 15;
    else if(timeframe == "M30")
      period = 30;
    else if(timeframe == "H1")
      period = 60;
    else if(timeframe == "H4")
      period = 240;
    else if(timeframe == "D1")
      period = 1440;
    else if(timeframe == "W1")
      period = 10080;
    else if(timeframe == "MN1")
      period = 43200;

    if(period == -1)
    {
      Print("ERR_INVALID_PARAMETERS: Invalid timeframe: " + timeframe);
      return;
    }

    m_lastCandleTime = 0;
}

bool OnNewCandle::IsNewCandle()
{
    if(m_lastCandleTime != iTime(NULL, period, 0))
    {
        //--- On initialization will not send a signal
        if(m_lastCandleTime != 0)
        {
            m_lastCandleTime = iTime(NULL, period, 0);
            return(true);
        }
        else
        {
            m_lastCandleTime = iTime(NULL, period, 0);
            return(false);
        }
    }

    return(false);
}