import 'package:filllo/models/order.dart';
import 'package:filllo/models/payment.dart';

import '../models/Item.dart';
import 'mysql.dart';

List<Item> Burgers = [];

List<Item> FriedChicken = [];

List<Item> Pizza = [];

List<List<Item>> items = [
  Burgers,
  FriedChicken,
  Pizza,
];

List<Order> orders = [];

List<String> deliveryArea = [
  "6 October",
  "Sheikh Zayed",
  "ElHaram",
  "Fiesel",
  "Madint Nasr",
];

double totalMount() {
  double total = 0;
  for (final e in orders) {
    for(final li in items){
      for(final i in li){
        if(e.item.id == i.id){
          total += (e.Quantity*i.price);
        }
      }
    }
  }
  return total;
}

Future<void> getBurgers() async {
  final connection = await Mysql().getConnection();
  if (connection != null) {
    connection.query("select * from MenuItem where Category = 'Burgers';");
    var results = await connection
        .query("select * from MenuItem where Category = 'Burgers';");
    for (final row in results) {
      Burgers.add(Item(id: row[0].toString(), name: row[1], image: row[4].toString(), price: row[3]));
    }
    connection.close();
  }
}

Future<void> getChicken() async {
  final connection = await Mysql().getConnection();
  if (connection != null) {
    connection.query("select * from MenuItem where Category = 'Chicken';");
    var results = await connection
        .query("select * from MenuItem where Category = 'Chicken';");
    for (final row in results) {
      FriedChicken.add(Item(id: row[0].toString(), name: row[1], image: row[4].toString(), price: row[3]));
    }
    connection.close();
  }
}

Future<void> getPizza() async {
  final connection = await Mysql().getConnection();
  if (connection != null) {
    connection.query("select * from MenuItem where Category = 'Pizza';");
    var results = await connection
        .query("select * from MenuItem where Category = 'Pizza';");
    for (final row in results) {
      Pizza.add(Item(id: row[0].toString(), name: row[1], image: row[4].toString(), price: row[3]));
    }
    connection.close();
  }
}

Future<void> getOrders() async {
  final connection = await Mysql().getConnection();
  if (connection != null) {
    connection.query("select * from Orderr;");
    var results = await connection
        .query("select * from Orderr;");
    for (final row in results) {
      orders.add(Order(int.parse(row[0].toString()), row[1], int.parse(row[2].toString()), items[check(row[3].toString())][row[3]], int.parse(row[4].toString())));
    }
    connection.close();
  }
}

int check(String id){
  for(int ts=0; ts < items.length ; ts++){
    for(final i in items[ts]){
      if(i.id == id){
        return ts;
      }
    }
  }
  return 0;
}

Future<void> createOrder(Order order) async {
  final connection = await Mysql().getConnection();
  if(connection!= null) {
    connection.query("INSERT INTO Orderr VALUES(${order.OrderID},'${order.OrderDate}',${order.CustomerID},${order.item.id},${order.Quantity});");
    connection.close();
  }
  orders.add(order);
}

Future<void> deleteOrder(Order order) async {
  final connection = await Mysql().getConnection();
  if(connection!= null) {
    connection.query("delete from Orderr where OrderID = ${order.OrderID};");
    connection.close();
  }
  orders.remove(order);
}

Future<void> createPayment(Payment payment) async {
  final connection = await Mysql().getConnection();
  if(connection!= null) {
    connection.query("INSERT INTO Payment VALUES(${payment.PaymentID},${payment.Amount},'${payment.PaymentDate}');");
    connection.close();
  }
}
