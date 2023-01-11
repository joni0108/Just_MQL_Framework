#include "src/NewOrder.mqh"
#include "src/AutoTrading.mqh"
#include "src/KeyPressed.mqh"
#include "../../base/definitions.mqh"
#include "../../error/error.mqh"

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class CTerminal
  {
private:

public:

   class AT //Autotrading Button
     {
   public:
      void           Set(bool state)                   //Set the autotrading button to an state
        {
         SetAutotrading(state);
        }
     } AutoTrading;


   class TRADE //Manual Trade
     {

   public:

      class NewOrder
        {
      public:
         void           NewPosition(string symbol, int type, double size, double price, double sl, double tp, string comment) //Open a new manual trade using the "New Order" button
           {
            NewOrder(symbol, type, size, price, sl, tp, comment);
           }
        } NewOrder;

     } Trade;

   class CHART
     {
   public:
      string         GetKeyPressed(const int lparam)
        {
         return GK.GetKey(lparam);
        }
     } Chart;
  } Terminal;


//+------------------------------------------------------------------+