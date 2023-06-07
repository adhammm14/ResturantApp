import 'package:filllo/constants/constants.dart';
import 'package:filllo/models/customer.dart';
import 'package:filllo/pages/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../modules/mysql.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  int id = 105;

  bool _isVisible = false;
  bool _isPasswordEightCharacters = false;
  bool _hasPasswordOneNumber = false;

  bool _isPrimaryCustomer = false;

  onPasswordChanged(String password) {
    final numericRegex = RegExp(r'[0-9]');

    setState(() {
      _isPasswordEightCharacters = false;
      if (password.length >= 8) _isPasswordEightCharacters = true;

      _hasPasswordOneNumber = false;
      if (numericRegex.hasMatch(password)) _hasPasswordOneNumber = true;
    });
  }

  final TextEditingController nameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SPColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: YColor,
        leading: Container(
          margin: const EdgeInsets.only(left: 15, top: 3, bottom: 3),
          padding: const EdgeInsets.only(left: 8, bottom: 3),
          decoration: BoxDecoration(
              color: YColor,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                  style: BorderStyle.solid, color: BlackC, width: 2)),
          child: Center(
            child: BackButton(
              color: BlackC,
            ),
          ),
        ),
        leadingWidth: 65,
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 130,
                color: YColor,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 60.0, left: 25),
                child: Text(
                  "Create Account",
                  style: GoogleFonts.bebasNeue(
                      color: BlackC, fontSize: 45, fontWeight: FontWeight.w300),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          //name
          Container(
            width: 350,
            decoration: BoxDecoration(
              color: ThinBlack,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              controller: nameController,
              maxLines: 1,
              cursorColor: BlackC,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.person,
                  size: 27,
                  color: BlackC,
                ),
                hintText: 'Name',
                border: InputBorder.none,
                contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          //phone number
          Container(
            width: 350,
            decoration: BoxDecoration(
              color: ThinBlack,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              controller: numberController,
              maxLines: 1,
              cursorColor: BlackC,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.phone,
                  size: 27,
                  color: BlackC,
                ),
                prefixText: "+20  ",
                prefixStyle: TextStyle(
                  color: BlackC,
                ),
                hintText: 'Phone Number',
                border: InputBorder.none,
                contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          //email
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
          //password
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
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Row(
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                      color: _isPasswordEightCharacters
                          ? Colors.green
                          : Colors.transparent,
                      border: _isPasswordEightCharacters
                          ? Border.all(color: Colors.transparent)
                          : Border.all(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(50)),
                  child: const Center(
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 15,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text("Contains at least 8 characters")
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Row(
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                      color: _hasPasswordOneNumber
                          ? Colors.green
                          : Colors.transparent,
                      border: _hasPasswordOneNumber
                          ? Border.all(color: Colors.transparent)
                          : Border.all(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(50)),
                  child: const Center(
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 15,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text("Contains at least 1 number")
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Row(
              children: [
                Checkbox(
                    activeColor: YColor,
                    value: _isPrimaryCustomer,
                    onChanged: (value) => setState(() {
                      _isPrimaryCustomer = value!;
                    }),
                ),
                Text(
                  "Primary Customer",
                  style: TextStyle(color: BlackC ,fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
          Spacer(),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(350, 55),
              backgroundColor: YColor,
              shape: StadiumBorder(),
            ),
            child: Text(
              "Create",
              style: GoogleFonts.bebasNeue(
                color: BlackC,
                fontSize: 25,
              ),
            ),
            onPressed: () async {
              id++;
              if(nameController.text.isNotEmpty&&emailController.text.isNotEmpty&& numberController.text.isNotEmpty){
                Customer cus = Customer(id, nameController.text, emailController.text, numberController.text, "6 of october", _isPrimaryCustomer?0.1:0);
                final connection = await Mysql().getConnection();
                if(connection!= null) {
                  connection.query("INSERT INTO Customer VALUES($id,'${cus.Name}','${cus.Email}','${cus.PhoneNumber}','${cus.Address}',${cus.discounts});");
                  connection.close();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Successfully SignUp!"),
                      backgroundColor: Colors.green,
                    ),
                  );
                  await Future.delayed(const Duration(seconds: 2));
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage(customer: cus,)));
                }
              }else{
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Please enter valid data!"),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}