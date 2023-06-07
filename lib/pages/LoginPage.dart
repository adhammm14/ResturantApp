import 'package:filllo/constants/constants.dart';
import 'package:filllo/pages/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mysql1/mysql1.dart';

import '../models/customer.dart';
import '../modules/modules.dart';
import '../modules/mysql.dart';
import 'SignupPage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  bool _isVisible = false;
  bool _isPasswordEightCharacters = false;
  bool _hasPasswordOneNumber = false;
  var db = Mysql();

  late Customer cus;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  onPasswordChanged(String password) {
    final numericRegex = RegExp(r'[0-9]');
    setState(() {
      _isPasswordEightCharacters = false;
      if (password.length >= 8) _isPasswordEightCharacters = true;

      _hasPasswordOneNumber = false;
      if (numericRegex.hasMatch(password)) _hasPasswordOneNumber = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SPColor,
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 250,
                color: YColor,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 170.0, left: 25),
                child: Text(
                  "Welcome Back!",
                  style: GoogleFonts.bebasNeue(
                      color: BlackC, fontSize: 45, fontWeight: FontWeight.w300),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Container(
            width: 350,
            decoration: BoxDecoration(
              color: ThinBlack,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              controller: emailController,
              maxLines: 1,
              cursorColor: BlackC,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.alternate_email_rounded,
                  size: 27,
                  color: BlackC,
                ),
                hintText: 'Email',
                border: InputBorder.none,
                contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: 350,
            decoration: BoxDecoration(
              color: ThinBlack,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              controller: passController,
              maxLines: 1,
              cursorColor: BlackC,
              onChanged: (password) => onPasswordChanged(password),
              obscureText: !_isVisible,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _isVisible = !_isVisible;
                    });
                  },
                  icon: _isVisible
                      ? const Icon(
                    Icons.visibility,
                    color: Colors.black,
                  )
                      : const Icon(
                    Icons.visibility_off,
                    color: Colors.grey,
                  ),
                ),
                prefixIcon: Icon(
                  Icons.lock,
                  size: 27,
                  color: BlackC,
                ),
                hintText: 'Password',
                border: InputBorder.none,
                contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Spacer(),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(350, 55),
              backgroundColor: YColor,
              shape: const StadiumBorder(),
            ),
            child: Text(
              "Login",
              style: GoogleFonts.bebasNeue(
                color: BlackC,
                fontSize: 25,
              ),
            ),
            onPressed: () async {
              if (await _checkEmail(emailController.text) && passController.text.isNotEmpty) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage(customer: cus,)));
              }else{
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text("We don't found this email"),
                      backgroundColor: Colors.red,
                    ),
                );
              }
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("You Don't Have Account?"),
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(
                      builder: (context) => const SignupPage()));
                },
                child: Text(
                  "SignUp",
                  style: TextStyle(color: YColor, fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
  Future<bool> _checkEmail(String email) async {
    final connection = await Mysql().getConnection();
    if (connection != null) {
      connection.query('select Email from Customer;');
      var results = await connection.query('select Email from Customer;');
      var e = results.map((r) => r["Email"]).toList();
      if (e.contains(email)) {
        String query = 'select * from Customer where Email  = ? ;';
        List<dynamic> values = [email];
        Results result = await connection.query(query, values);
        List<ResultRow> data = result.toList();
        for(ResultRow row in data){
          cus = Customer(row[0],row[1],row[2],row[3],row[4],row[5]);
          return true;
        }
      }
      connection.close();
    }
    return false;
  }
}