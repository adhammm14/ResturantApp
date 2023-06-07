import 'package:filllo/constants/constants.dart';
import 'package:filllo/models/payment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slide_to_act/slide_to_act.dart';

import '../models/Item.dart';
import '../modules/modules.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  String area = deliveryArea[0];
  int id = orders.isEmpty ? 1 : orders.last.OrderID + 1;

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
          "Orders",
          style: GoogleFonts.bebasNeue(
            color: BlackC,
            fontSize: 25,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: orders.isNotEmpty
            ? Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  ListView.builder(
                    itemCount: orders.length,
                    itemBuilder: (BuildContext context, int index) {
                      return
                        Container(
                          margin: const EdgeInsets.only(bottom: 15),
                          width: double.infinity,
                          height: 80,
                          decoration: BoxDecoration(
                            color: ThinBlack,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              Image.network(orders[index].item.image),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    orders[index].item.name,
                                    style: GoogleFonts.bebasNeue(
                                      color: BlackC,
                                      fontSize: 25,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "\$${orders[index].item.price.toString()}",
                                        style: GoogleFonts.abel(
                                          color: BlackC,
                                          fontSize: 20,
                                        ),
                                      ),
                                      SizedBox(width: 50,),
                                      Text(
                                        "x${orders[index].Quantity}",
                                        style: GoogleFonts.abel(
                                          color: BlackC,
                                          fontSize: 22,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const Spacer(),
                              InkWell(
                                onTap: (){
                                  setState(() {
                                    deleteOrder(orders[index]);
                                  });
                                },
                                child: Container(
                                  width: 35,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color: YColor,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        style: BorderStyle.solid,
                                        color: BlackC,
                                        width: 2,
                                      )),
                                  child: Icon(
                                    CupertinoIcons.delete_simple,
                                    weight: 30,
                                    color: BlackC,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                            ],
                          ),
                        );
                    },
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(350, 55),
                      backgroundColor: YColor,
                      shape: StadiumBorder(),
                    ),
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) => Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Items: ",
                                          style: GoogleFonts.abel(
                                            color: BlackC,
                                            fontSize: 25,
                                          ),
                                        ),
                                        Text(
                                          "${orders.length} Items",
                                          style: GoogleFonts.abel(
                                            color: BlackC,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 20,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "City: ",
                                          style: GoogleFonts.abel(
                                            color: BlackC,
                                            fontSize: 25,
                                          ),
                                        ),
                                        PopupMenuButton(
                                          itemBuilder: (BuildContext conx) => [
                                            PopupMenuItem(
                                              child: Text("6 October"),
                                              value: deliveryArea[0],
                                            ),
                                            PopupMenuItem(
                                              child: Text("Sheikh Zayed"),
                                              value: deliveryArea[1],
                                            ),
                                            PopupMenuItem(
                                              child: Text("ElHaram"),
                                              value: deliveryArea[2],
                                            ),
                                            PopupMenuItem(
                                              child: Text("Fiesel"),
                                              value: deliveryArea[3],
                                            ),
                                            PopupMenuItem(
                                              child: Text("Madint Nasr"),
                                              value: deliveryArea[4],
                                            ),
                                          ],
                                          onSelected: (value) {
                                            setState(() {
                                              area = value;
                                            });
                                          },
                                          child: Container(
                                            width: area == deliveryArea[1] ? 170 : 130,
                                            child: Center(
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text(area,style: GoogleFonts.aBeeZee(
                                                    color: BlackC,
                                                    fontSize: 20,
                                                  ),),
                                                  Icon(
                                                      CupertinoIcons.chevron_down,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 20,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Total: ",
                                          style: GoogleFonts.abel(
                                            color: BlackC,
                                            fontSize: 25,
                                          ),
                                        ),
                                        Text(
                                          "\$${totalMount()}",
                                          style: GoogleFonts.abel(
                                            color: BlackC,
                                            fontSize: 22,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 20,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Voucher: ",
                                          style: GoogleFonts.abel(
                                            color: BlackC,
                                            fontSize: 25,
                                          ),
                                        ),
                                        Container(
                                          width: 250,
                                          decoration: BoxDecoration(
                                            color: ThinBlack,
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          child: TextField(
                                            maxLines: 1,
                                            cursorColor: BlackC,
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding: EdgeInsets.only(left: 10)
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                    SlideAction(
                                      onSubmit: (){
                                        setState(() {
                                          id++;
                                        });
                                        createPayment(Payment(id, totalMount(), DateTime.now()));
                                      },
                                      innerColor: BlackC,
                                      outerColor: YColor,
                                      height: 60,
                                      sliderButtonIconSize:20,
                                      text: "Slide To Pay",
                                      textStyle: GoogleFonts.bebasNeue(
                                          color: BlackC,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 30
                                      ),
                                    ),
                                    SizedBox(height: 20,),
                                  ],
                                ),
                          ));
                    },
                    child: Text(
                      "checkout",
                      style: GoogleFonts.bebasNeue(
                        color: BlackC,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ],
              )
            : Center(
                child: Column(
                  children: [
                    Image.asset("assest/images/empty.gif"),
                    Text(
                      "You don't add anything else!",
                      style: GoogleFonts.bebasNeue(
                          color: BlackC,
                          fontSize: 25,
                          fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
