#include "src/NewOrder.mqh"
#include "src/AutoTrading.mqh"
#include "src/KeyPressed.mqh"
#include "../../base/definitions.mqh"

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

      /*class OneClick
        {

      public:
         void           Lots(double lots) {OCT.SetLots(lots);}    //Set the OneClickTrading window lots input to a value
         void           Buy() {OCT.ClickBuy();}              //Click the OneClickTrading Window Buy button
         void           Sell() {OCT.ClickSell();}            //Click the OneClickTrading Window Sell button
        } OneClick;*/

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