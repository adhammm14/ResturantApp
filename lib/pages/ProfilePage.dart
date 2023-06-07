import 'package:filllo/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/customer.dart';

class ProfilePage extends StatefulWidget {
  Customer customer;

  ProfilePage({Key? key, required this.customer}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState(customer);
}

class _ProfilePageState extends State<ProfilePage> {
  Customer customer;

  _ProfilePageState(this.customer);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SPColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
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
        title: Text(
          "Account",
          style: GoogleFonts.bebasNeue(
            color: BlackC,
            fontSize: 25,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment:CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20,),
            Text(
              customer.Name,
              style: GoogleFonts.bebasNeue(
                color: BlackC,
                fontSize: 40,
              ),
            ),
            SizedBox(height: 20,),
            Text(
              customer.Email,
              style: GoogleFonts.bebasNeue(
                color: BlackC,
                fontSize: 30,
              ),
            ),
            SizedBox(height: 20,),
            Text(
              customer.Address,
              style: GoogleFonts.bebasNeue(
                color: BlackC,
                fontSize: 30,
              ),
            ),
            SizedBox(height: 20,),
            Text(
              customer.PhoneNumber,
              style: GoogleFonts.bebasNeue(
                color: BlackC,
                fontSize: 30,
              ),
            ),
            SizedBox(height: 20,),
            Text(
              customer.CustomerID.toString(),
              style: GoogleFonts.bebasNeue(
                color: BlackC,
                fontSize: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
