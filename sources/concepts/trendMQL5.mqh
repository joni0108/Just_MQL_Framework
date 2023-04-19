class CTrend
{
private:
    double m_lastPrice;
    double m_swingHigh;
    double m_swingLow;
    bool m_waitingRetracement;
    bool m_upTrend;
    int m_retracementCandles;
    double m_retracementRange;
public:
    CTrend() : m_lastPrice(0), m_swingHigh(0), m_swingLow(0), m_waitingRetracement(false), m_upTrend(true), m_retracementCandles(2), m_retracementRange(0.5) {}
    void UpdatePrice(const double price)
    {
        m_lastPrice = price;
    }
    bool DetectTrend(const double currentPrice)
    {
        if (currentPrice > m_swingHigh)
        {
            m_swingHigh = currentPrice;
            m_upTrend = true;
            m_waitingRetracement = false;
            return true;
        }
        else if (currentPrice < m_swingLow)
        {
            m_swingLow = currentPrice;
            m_upTrend = false;
            m_waitingRetracement = false;
            return true;
        }
        else if (m_waitingRetracement)
        {
            return false;
        }
        else
        {
            m_waitingRetracement = true;
            return false;
        }
    }
    bool WaitingRetracement() const
    {
        return m_waitingRetracement;
    }
    bool ValidateRetracement(const double currentPrice)
    {
        if ((m_upTrend && currentPrice <= m_swingLow) || (!m_upTrend && currentPrice >= m_swingHigh))
        {
            m_waitingRetracement = false;
            return false;
        }
        double range = m_retracementRange * (m_upTrend ? (m_swingHigh - m_swingLow) : (m_swingLow - m_swingHigh));
        double minRetracement = m_upTrend ? (m_swingHigh - range) : (m_swingLow + range);
        double maxRetracement = m_upTrend ? (m_swingHigh + range) : (m_swingLow - range);
        double previousPrice = m_upTrend ? (m_lastPrice - range) : (m_lastPrice + range);
        if ((m_upTrend && currentPrice > previousPrice && currentPrice >= minRetracement && currentPrice < m_lastPrice) ||
            (!m_upTrend && currentPrice < previousPrice && currentPrice <= maxRetracement && currentPrice > m_lastPrice))
        {
            m_lastPrice = currentPrice;
            m_retracementCandles--;
            if (m_retracementCandles == 0)
            {
                m_waitingRetracement = false;
                if (m_upTrend)
                {
                    m_swingLow = currentPrice;
                }
                else
                {
                    m_swingHigh = currentPrice;
                }
                return true;
            }
            else
            {
                return false;
            }
        }
        else
        {
            m_waitingRetracement = false;
            return false;
        }
    }
    bool UpTrend() const
    {
        return m_upTrend;
    }
    double SwingHigh() const
    {
        return m_swingHigh;
    }
    double SwingLow() const
    {
        return m_swingLow;
    }
};