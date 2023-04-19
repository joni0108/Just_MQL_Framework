#include "../enumerations.mqh"

class CTrend
{
private:
        int uslPos;         // Unconfirmed swing low position
        int ushPos;         // Unconfirmed swing high position
        bool drawPoints;    // Draw swing points
        color clrSwings;    // Swing points color
        color clrInternal;  // Unconfirmed swing points color
        bool mappingByClose;   // Close for break out if true, wick for break out if false
        long chart;         // Chart ID
        string symbol;      // Symbol
        ENUM_TIMEFRAMES timeframe;  // Timeframe
protected:
        int slPos;          // Confirmed swing low position
        int shPos;          // Confirmed swing high position
        int trendDir;       // Trend direction

public:
        CTrend() {}
        void Init(int islPos, int ishPos, int itrendDirection, bool imappingByClose = false, string isymbol = NULL, ENUM_TIMEFRAMES itimeframe = 0)  //Initialize trend variables
        {
                this.slPos = islPos;
                this.shPos = ishPos;
                this.trendDir = itrendDirection;
                this.mappingByClose = imappingByClose;

                if(this.chart == 0)
                    this.chart = ChartID();

                if(isymbol == NULL)
                    isymbol = Symbol();
                
                if(itimeframe == 0)
                    itimeframe = PERIOD_CURRENT;
                
                this.symbol = isymbol;
                this.timeframe = itimeframe;

        }
        void Init(int lookBack = 500, bool imappingByClose = false, string isymbol = NULL, ENUM_TIMEFRAMES itimeframe = 0);     //Initialize trend variables automatically
        bool Update(int presentPos = 0);                        //Update trend variables
        void Destroy();                                         //Destroy trend chart elements

        //--- Setters
        void SetSwingsColor(color iclrSwings) { this.clrSwings = iclrSwings; }
        void SetInternalColor(color iclrInternal) { this.clrInternal = iclrInternal; }
        void SetDrawSwingPoints(bool idrawPoints) { this.drawPoints = idrawPoints; }
        void SetChart(long ichart) { this.chart = ichart; }

        //--- Getters
        int GetSwingLowPos() { return this.slPos; }
        int GetSwingHighPos() { return this.shPos; }
        int GetTrendDirection() { return this.trendDir; }
        int GetUnconfirmedSwingLowPos() { return this.uslPos; }
        int GetUnconfirmedSwingHighPos() { return this.ushPos; }
        bool GetDrawSwingPoints() { return this.drawPoints; }
        color GetSwingsColor() { return this.clrSwings; }
        color GetInternalColor() { return this.clrInternal; }
        long GetChart() { return this.chart; }
};

void CTrend::Init(int lookBack = 500, bool imappingByClose = false, string isymbol = NULL, ENUM_TIMEFRAMES itimeframe = 0)
{
        if(lookBack < 100)
            lookBack = 100;
        
        this.slPos = lookBack;
        this.shPos = lookBack;
        this.uslPos = lookBack;
        this.ushPos = lookBack;
        this.trendDir = TREND_BULLISH;
        this.mappingByClose = imappingByClose;

        if(this.chart == 0)
            this.chart = ChartID();
        
        if(isymbol == NULL)
            isymbol = Symbol();
                
        if(itimeframe == 0)
            timeframe = PERIOD_CURRENT;
                
        this.symbol = isymbol;
        this.timeframe = itimeframe;

        //--- Run a loop to find the actual swing points
        int i = lookBack;

        while(i > 0)
        {
            this.Update(i);
            i--;
        }

        return;
}

void CTrend::Destroy()
{
        ObjectDelete("SwingLow");
        ObjectDelete("SwingHigh");
        ObjectDelete("UnconfirmedSwingLow");
        ObjectDelete("UnconfirmedSwingHigh");
        return;
}

bool CTrend::Update(int presentPos = 0)
{
    //---> Initial Verification
    if(presentPos < 0)
    {
        Print("Error: Invalid parameters in CTrend::Update()");
        return false;
    }

    Print("Swing H & LL: " + shPos + " & " + slPos);

    int p = presentPos; // Present position

    //---> Draw points logic
    if(presentPos <= 1)
    {
        Print("Swing H & LL: " + shPos + " & " + slPos);
        Print("Unconfirmed Swing H & LL: " + ushPos + " & " + uslPos);
        
        if(this.drawPoints)
        {
            Destroy();
            
            ObjectCreate(chart, "SwingHigh", OBJ_TREND,0, iTime(symbol, timeframe, shPos), iHigh(symbol, timeframe, shPos), Time[0], iHigh(symbol, timeframe, shPos));
            ObjectCreate(chart, "SwingLow", OBJ_TREND,0, iTime(symbol, timeframe, slPos), iLow(symbol, timeframe, slPos), Time[0], iLow(symbol, timeframe, slPos));
            ObjectCreate(chart, "UnconfirmedSwingHigh", OBJ_TREND,0, iTime(symbol, timeframe, ushPos), iHigh(symbol, timeframe, ushPos), Time[0], iHigh(symbol, timeframe, ushPos));
            ObjectCreate(chart, "UnconfirmedSwingLow", OBJ_TREND,0, iTime(symbol, timeframe, uslPos), iLow(symbol, timeframe, uslPos), Time[0], iLow(symbol, timeframe, uslPos));

            ObjectSetInteger(chart, "SwingHigh", OBJPROP_COLOR, clrSwings);
            ObjectSetInteger(chart, "SwingLow", OBJPROP_COLOR, clrSwings);
            ObjectSetInteger(chart, "UnconfirmedSwingHigh", OBJPROP_COLOR, clrInternal);
            ObjectSetInteger(chart, "UnconfirmedSwingLow", OBJPROP_COLOR, clrInternal);

            ObjectSetInteger(chart, "SwingHigh", OBJPROP_WIDTH, 2);
            ObjectSetInteger(chart, "SwingLow", OBJPROP_WIDTH, 2);
            ObjectSetInteger(chart, "UnconfirmedSwingHigh", OBJPROP_WIDTH, 1);
            ObjectSetInteger(chart, "UnconfirmedSwingLow", OBJPROP_WIDTH, 1);
        }
    }

    //---> Bullish trend logic
    if(trendDir == TREND_BULLISH)
    {
        ushPos = iHighest(symbol, timeframe, MODE_HIGH, slPos, p);
        uslPos = iLowest(symbol, timeframe, MODE_LOW, ushPos, p);

        if(ushPos == -1 || uslPos == -1)
            return false;

        //--- Swing high confirmed
        double minToRetrace = 0.25 * (iHigh(symbol, timeframe, ushPos) - iLow(symbol, timeframe, slPos));

        if(iHigh(symbol, timeframe, ushPos) - iLow(symbol, timeframe, ushPos) > minToRetrace)
        {
            for (int i = p; i < shPos; i++)
            {
                if(iClose(symbol, timeframe, i) < iOpen(symbol, timeframe, i) && iClose(symbol, timeframe, i+1) < iOpen(symbol, timeframe, i+1))
                {
                    shPos = iHighest(symbol, timeframe, MODE_HIGH, slPos, uslPos);
                    break;
                }
                    
            }
            
        }

        if(!mappingByClose)
        {

            //--- Continuation Bos
            if(shPos != -1 && iHigh(symbol, timeframe, p) > iHigh(symbol, timeframe, shPos))
            {
                for (int x = p; x < shPos; x++)
                {
                    if(iClose(symbol, timeframe, x) < iOpen(symbol, timeframe, x) && iClose(symbol, timeframe, x+1) < iOpen(symbol, timeframe, x+1))
                    {
                        slPos = iLowest(symbol, timeframe, MODE_LOW, x+1, p);
                        break;
                    }
                    
                }
                
                shPos = -1;
                return true;
            }

            //--- Change of trend
            if(iLow(symbol, timeframe, p) < iLow(symbol, timeframe, slPos))
            {
                for (int z = p; z < slPos; z++)
                {
                    if(iClose(symbol, timeframe, z) > iOpen(symbol, timeframe, z) && iClose(symbol, timeframe, z+1) > iOpen(symbol, timeframe, z+1))
                    {
                        shPos = iHighest(symbol, timeframe, MODE_LOW, z, z+1);
                        break;
                    }
                    
                }
                
                
                shPos = ushPos;
                slPos = -1;
                trendDir = TREND_BEARISH;
                return true;
            }
        }
        else
        {
            //--- Continuation Bos
            if(shPos != -1 && iClose(symbol, timeframe, p+1) > iHigh(symbol, timeframe, shPos))
            {
                slPos = iLowest(symbol, timeframe, MODE_LOW, shPos, p);
                shPos = -1;
                return true;
            }

            //--- Change of trend
            if(iClose(symbol, timeframe, p+1) < iLow(symbol, timeframe, slPos))
            {
                shPos = ushPos;
                slPos = -1;
                trendDir = TREND_BEARISH;
                return true;
            }
        }
    }
    else
    {
        
    }

    return false;
}