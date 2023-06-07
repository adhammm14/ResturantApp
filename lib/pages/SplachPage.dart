import 'package:filllo/constants/constants.dart';
import 'package:filllo/pages/HomePage.dart';
import 'package:filllo/pages/LoginPage.dart';
import 'package:filllo/pages/SecondPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:slide_to_act/slide_to_act.dart';

class SplachPage extends StatefulWidget {
  const SplachPage({Key? key}) : super(key: key);

  @override
  State<SplachPage> createState() => _SplachPageState();
}

class _SplachPageState extends State<SplachPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SPColor,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SafeArea(
            child: Container(
              height: double.infinity,
              width: double.infinity,
              color: SPColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 10,),
                  Text("Let's Eat...",
                  style: GoogleFonts.abel(
                    color: BlackC,
                    fontSize: 45,
                    fontWeight: FontWeight.w500,
                  ),),
                ],
              ),
            ),
          ),
          Stack(
            children: [
              Container(
                color: Colors.black,
                height: 450,
              ),
              SizedBox(
                height: 450,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 5.0),
                          child: SvgPicture.asset(
                            "assest/icons/star.svg",
                            width: 30,
                            color: YColor,
                          ),
                        ),
                        Text(
                          "The taste that\nmake you feel awesome.",
                          style: GoogleFonts.bebasNeue(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5.0,top: 50.0),
                          child: SvgPicture.asset(
                            "assest/icons/star.svg",
                            width: 30,
                            color: Colors.amber,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 50),
                    SlideAction(
                      onSubmit: (){
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => LoginPage()
                        ));
                      },
                      innerColor: YColor,
                      outerColor: Colors.white,
                      height: 60,
                      sliderButtonIconSize:20,
                      text: "Slide To Explore",
                      textStyle: GoogleFonts.bebasNeue(
                        color: BlackC,
                        fontWeight: FontWeight.w500,
                        fontSize: 30
                      ),
                    ),
                    SizedBox(height: 40),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            left: 20,
            right: 20,
            bottom: 270,
            child: Image.asset("assest/images/food.jpeg",
              width: 600,
              height: 430,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
