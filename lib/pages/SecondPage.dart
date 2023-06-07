import 'package:filllo/modules/mysql.dart';
import 'package:flutter/material.dart';


class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  var db = new Mysql();
  var email = "";

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: SafeArea(
            child: Column(
              children: [
                TextButton(
                    onPressed: (){
                      addUsers();
                    },
                    child: Text("Click")
                ),
                Text(email,style: TextStyle(color: Colors.black),),
              ],
            ),
          ),
        ),
      ),
    );
  }
  void fetchUsers() async {
    final connection = await Mysql().getConnection();
    if (connection != null) {
      connection.query('select Fname from employee;');
      var results = await connection.query('select Fname from employee;');
      var l = results.map((r) => r["Fname"]).toList();
      for (var row in l) {
        setState(() {
          email=row;
        });
      }
      connection.close();
    }
  }
  void addUsers() async {
    final connection = await Mysql().getConnection();
    if (connection != null) {
      connection.query("insert into employee values('Adham', 'm', 'Misallam',6 ,'1989-09-19', '10 adan street', 'M',20000, Null, Null);");
      connection.close();
    }
  }
}