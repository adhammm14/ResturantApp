import 'Item.dart';

class Order{
  int OrderID;
  DateTime OrderDate;
  int CustomerID;
  Item item;
  int Quantity;

  Order(this.OrderID,this.OrderDate,this.CustomerID,this.item,this.Quantity);
}