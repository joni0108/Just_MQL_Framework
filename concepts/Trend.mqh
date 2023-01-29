//--- This file will have the CTrend class
#include <controls/Button.mqh>
#include "../libs/Chart.mqh"
#include "../libs/events/OnNewCandle.mqh"

class CTrend
{
private:
    string m_timeframe;
    string m_symbol;
    int m_swingHigh;
    int m_swingLow;
    bool m_bullish;
    long m_chartID;
    int period;
    CButton m_trendButton;
    CButton m_confirmButton;
    CChart m_chart;
    OnNewCandle m_newCandle;
public:
    CTrend() {}
    void Create(string timeframe, string symbol);   //The trend constructor (automatic detection)
    void Create(string timeframe, string symbol, int swingHigh, int swingLow, bool bullish);   //The trend constructor (manual initial points)
    int GetSwingHigh() {return m_swingHigh;}        //Returns the swing high
    int GetSwingLow()  {return m_swingLow;}         //Returns the swing low
    bool IsBullish()   {return m_bullish;}          //Returns true if bullish, false if bearish
    void OnTickUpdate(bool drawPoints);             //Updates the trend on tick
};

void CTrend::Create(string timeframe, string symbol)
{
    long chID = m_chart.FindChart(m_symbol, m_timeframe);
    m_chartID = chID;
    string object1 = "";
    string object2 = "";
    
    ObjectsDeleteAll(chID, 0);
    
    m_timeframe = timeframe;
    m_symbol = symbol;

    //--- Initialize the buttons
    m_trendButton.Create(chID,"TREND",0, 25, 25, 100, 50);
    m_trendButton.ColorBackground(clrGreen);
    m_trendButton.Color(clrWhite);
    m_trendButton.Text("Bullish");

    m_confirmButton.Create(chID,"CONFIRM",0, m_trendButton.Right() + 5, m_trendButton.Top(), m_trendButton.Right() + 80, m_trendButton.Bottom());
    m_confirmButton.ColorBackground(clrWhite);
    m_confirmButton.Color(clrBlack);
    m_confirmButton.Text("Confirm");

    bool loopController = true;

    while(loopController)
    {
        if(m_trendButton.Pressed())
        {
            m_trendButton.ColorBackground(clrRed);
            m_trendButton.Text("Bearish");
        }
        else
        {
            m_trendButton.ColorBackground(clrGreen);
            m_trendButton.Text("Bullish");
        }

        if(m_confirmButton.Pressed())
        {
            if(ObjectsTotal() != 2)
            {
                Alert("Please, add a vertical line in the swing low & high before clicking the confirm button");
                ObjectsDeleteAll(chID, 0);
                m_confirmButton.Pressed(false);
            }
            else
            {
                object1 = ObjectName(chID, 0, 0);
                object2 = ObjectName(chID, 1, 0);

                if(ObjectGetInteger(chID, object1, OBJPROP_TYPE) != OBJ_VLINE || ObjectGetInteger(chID, object2, OBJPROP_TYPE) != OBJ_VLINE)
                {
                    Alert("At least one of the 2 objects in chart is not a vertical line.");
                    ObjectsDeleteAll(chID, 0);
                    m_confirmButton.Pressed(false);
                }
                else
                {
                    loopController = false;
                    break;
                }
            }
        }
        //--- Wait for the confirm button to be pressed
        Sleep(1000);
    }

    m_bullish = m_trendButton.Pressed();

    m_swingLow = (int)ObjectGetInteger(chID, object1, OBJPROP_TIME);
    m_swingHigh = (int)ObjectGetInteger(chID, object2, OBJPROP_TIME);

    ObjectsDeleteAll(chID, 0);
    m_trendButton.Destroy();
    m_confirmButton.Destroy();

    m_newCandle.Create(m_timeframe);

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
}

void CTrend::Create(string timeframe, string symbol, int swingHigh, int swingLow, bool bullish)
{
    m_timeframe = timeframe;
    m_symbol = symbol;
    m_swingHigh = swingHigh;
    m_swingLow = swingLow;
    m_bullish = bullish;
}

void CTrend::OnTickUpdate(bool drawPoints)
{
    if(m_newCandle.IsNewCandle() == true)
    {
        m_swingHigh++;
        m_swingLow++;
    }

    int tempHigh = 0;
    int tempLow = 0;

    //If the trend is bullish
    if(m_bullish)
    {
        tempHigh = iHighest(m_symbol, period, MODE_HIGH, m_swingLow, 0);

        //--- Detects if a new swing high has been reached
        double pullbackMinPrice = (tempHigh - m_swingLow) * 0.382;
        pullbackMinPrice = tempHigh - pullbackMinPrice;

        if(iLowest(m_symbol, period, MODE_LOW, tempHigh, 0) <= pullbackMinPrice)
        {
            m_swingHigh = tempHigh;
            tempLow = iLowest(m_symbol, period, MODE_LOW, m_swingHigh, 0);
        }

        //--- Detects a Continuation
        if(iHighest(m_symbol, period, MODE_HIGH, m_swingLow, 0) > m_swingHigh)
        {
            m_swingLow = tempLow;
            m_swingHigh = -1;
            return;
        }

        //--- Detects a Breakout
        if(iLowest(m_symbol, period, MODE_LOW, tempHigh, 0) < m_swingLow)
        {
            m_swingLow = -1;
            m_swingHigh = tempHigh;
            m_bullish = false;
            return;
        }
    }
    //--- If the trend is bearish
    else
    {
        tempLow = iLowest(m_symbol, period, MODE_LOW, m_swingHigh, 0);

        //--- Detects if a new swing low has been reached
        double pullbackMinPrice = (m_swingHigh - tempLow) * 0.382;
        pullbackMinPrice = tempLow + pullbackMinPrice;

        if(iHighest(m_symbol, period, MODE_HIGH, tempLow, 0) >= pullbackMinPrice)
        {
            m_swingLow = tempLow;
            tempHigh = iHighest(m_symbol, period, MODE_HIGH, m_swingLow, 0);
        }

        //--- Detects a Continuation
        if(iLowest(m_symbol, period, MODE_LOW, m_swingHigh, 0) < m_swingLow)
        {
            m_swingHigh = tempHigh;
            m_swingLow = -1;
            return;
        }

        //--- Detects a Breakout
        if(iHighest(m_symbol, period, MODE_HIGH, tempLow, 0) > m_swingHigh)
        {
            m_swingLow = tempLow;
            m_swingHigh = -1;
            m_bullish = true;
            return;
        }
    }

    if(drawPoints)
    {
        ObjectDelete(m_chartID, "Swing High");
        ObjectDelete(m_chartID, "Swing Low");

        if(m_bullish)
        {
            ObjectCreate(m_chartID, "Swing High", OBJ_TREND, 0, m_swingHigh, iHigh(m_symbol, period, m_swingHigh), 0, clrGreen);
            ObjectCreate(m_chartID, "Swing High", OBJ_TREND, 0, m_swingLow, iLow(m_symbol, period, m_swingLow), 0, clrGreen);
        }
        else
        {
            ObjectCreate(m_chartID, "Swing High", OBJ_TREND, 0, m_swingHigh, iHigh(m_symbol, period, m_swingHigh), 0, clrRed);
            ObjectCreate(m_chartID, "Swing High", OBJ_TREND, 0, m_swingLow, iLow(m_symbol, period, m_swingLow), 0, clrRed);
        }
    }
    

    
}