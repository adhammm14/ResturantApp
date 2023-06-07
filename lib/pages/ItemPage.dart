import 'package:filllo/constants/constants.dart';
import 'package:filllo/models/order.dart';
import 'package:filllo/modules/modules.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/Item.dart';
import '../models/customer.dart';

class ItemPage extends StatefulWidget {
  Item item;
  Customer customer;

  ItemPage({Key? key, required this.item, required this.customer}) : super(key: key);

  @override
  State<ItemPage> createState() => _ItemPageState(item, customer);
}

class _ItemPageState extends State<ItemPage> {
  Item item;
  Customer customer;

  _ItemPageState(this.item,this.customer);

  int id = orders.isEmpty ? 1 : orders.last.OrderID + 1;

  int quantity = 1;
  bool regular = true;
  bool isAdded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SPColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ThinBlack,
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: ThinBlack,
            ),
            child: Center(
              child: Image.network(
                item.image,
                width: 270,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.name,
                      style: GoogleFonts.bebasNeue(
                        color: BlackC,
                        fontSize: 30,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Pure beef burger patty, with our \nsignature sauce and cheddar cheese.",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: GoogleFonts.abel(
                        color: BlackC,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                Text(
                  "\$${item.price}",
                  style: GoogleFonts.abel(
                    color: BlackC,
                    fontSize: 30,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: ThinBlack,
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          regular = true;
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        width: 180,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: regular ? YColor : Colors.transparent,
                        ),
                        child: Center(
                          child: Text(
                            "Regular",
                            style: GoogleFonts.bebasNeue(fontSize: 22),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          regular = false;
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        width: 180,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: regular ? Colors.transparent : YColor,
                        ),
                        child: Center(
                          child: Text(
                            "Combo",
                            style: GoogleFonts.bebasNeue(fontSize: 22),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          regular
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Text(
                    "Choose Sandwich only",
                    style: GoogleFonts.abel(
                      color: BlackC,
                      fontSize: 20,
                    ),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "French Fries, Soft Drink Can, \nand Thousand Island Sauce Cup",
                        style: GoogleFonts.abel(
                          color: BlackC,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        "+ \$40",
                        style: GoogleFonts.abel(
                          color: BlackC,
                          fontSize: 22,
                        ),
                      ),
                    ],
                  ),
                ),
        ],
      ),
      bottomSheet: Container(
        height: 150,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Container(
                width: 180,
                height: 100,
                padding: EdgeInsets.only(left: 15,right: 15,top: 2),
                decoration: BoxDecoration(
                  color: ThinBlack,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove_rounded,size: 30,color: BlackC,),
                      onPressed: (){
                        setState(() {
                          if(quantity>1){
                            quantity--;
                          }
                        });
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(quantity.toString(),style: GoogleFonts.bebasNeue(
                        color: BlackC,
                        fontSize: 25,
                      ),),
                    ),
                    IconButton(
                      icon: Icon(Icons.add_rounded,size: 30,color: BlackC,),
                      onPressed: (){
                        setState(() {
                          quantity++;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: isAdded? 90 : 18.0,vertical: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(350, 55),
                  backgroundColor: YColor,
                  shape: const StadiumBorder(),
                ),
                child: isAdded
                    ? Text(
                        "Done!",
                        style: GoogleFonts.bebasNeue(
                          color: BlackC,
                          fontSize: 25,
                        ),
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.shopping_cart,
                            size: 30,
                            color: BlackC,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Add to Cart",
                            style: GoogleFonts.bebasNeue(
                              color: BlackC,
                              fontSize: 25,
                            ),
                          )
                        ],
                      ),
                onPressed: () async {
                  createOrder(Order(
                      id,
                      DateTime.now(),
                      customer.CustomerID,
                      item,
                      quantity));
                  if (isAdded) return;

                  setState(() => isAdded = true);
                  await Future.delayed(const Duration(seconds: 2));
                  setState(() => isAdded = false);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
