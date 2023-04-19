class CTrend
{
private:
    double m_lastPrice;
    double m_swingHigh;
    double m_swingLow;
    bool m_upTrend;
    bool m_waitingRetracement;
    bool m_validatingRetracement;
    bool m_retracementValidationSuccessful;
    
public:
    CTrend() {
        m_lastPrice = 0;
        m_swingHigh = 0;
        m_swingLow = 0;
        m_upTrend = false;
        m_waitingRetracement = false;
        m_validatingRetracement = false;
        m_retracementValidationSuccessful = false;
    }
    
    bool DetectTrend(double currentPrice) {
        if (currentPrice > m_lastPrice) {
            if (!m_upTrend) {
                m_upTrend = true;
                m_swingLow = m_lastPrice;
            }
            m_swingHigh = MathMax(m_swingHigh, currentPrice);
            return true;
        } else if (currentPrice < m_lastPrice) {
            if (m_upTrend) {
                m_upTrend = false;
                m_swingHigh = m_lastPrice;
            }
            m_swingLow = MathMin(m_swingLow, currentPrice);
            return false;
        }
        return m_upTrend;
    }
    
    bool WaitingRetracement() {
        if (m_retracementValidationSuccessful) {
            m_retracementValidationSuccessful = false;
            return false;
        }
        if (!m_waitingRetracement && !m_validatingRetracement) {
            m_waitingRetracement = true;
            return true;
        }
        return false;
    }
    
    bool ValidateRetracement(double currentPrice) {
        if (m_waitingRetracement) {
            m_waitingRetracement = false;
            m_validatingRetracement = true;
            m_retracementValidationSuccessful = false;
            return true;
        }
        if (m_validatingRetracement) {
            if (m_upTrend) {
                if (currentPrice < m_lastPrice && currentPrice < m_swingHigh) {
                    m_retracementValidationSuccessful = true;
                    return true;
                }
            } else {
                if (currentPrice > m_lastPrice && currentPrice > m_swingLow) {
                    m_retracementValidationSuccessful = true;
                    return true;
                }
            }
        }
        return false;
    }
    
    bool UpTrend() {
        return m_upTrend;
    }
    
    double SwingHigh() {
        return m_swingHigh;
    }
    
    double SwingLow() {
        return m_swingLow;
    }
    
    void UpdatePrice(double currentPrice) {
        m_lastPrice = currentPrice;
    }
};
