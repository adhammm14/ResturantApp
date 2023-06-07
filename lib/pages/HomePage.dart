import 'package:filllo/constants/constants.dart';
import 'package:filllo/models/customer.dart';
import 'package:filllo/models/order.dart';
import 'package:filllo/modules/modules.dart';
import 'package:filllo/pages/OrdersPage.dart';
import 'package:filllo/pages/ProfilePage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'ItemPage.dart';

class HomePage extends StatefulWidget {
  Customer customer;

  HomePage({Key? key, required this.customer}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState(customer);
}

class _HomePageState extends State<HomePage> {
  Customer customer;

  _HomePageState(this.customer);

  List<String> categories = [
    "Burger",
    "Fried Chicken",
    "Pizza",
  ];

  late bool _isLoading;

  int id = orders.isEmpty ? 1 : orders.last.OrderID + 1;

  @override
  void initState() {
    _isLoading = true;
    getBurgers();
    getChicken();
    getPizza();
    getOrders();
    Future.delayed(const Duration(milliseconds: 1), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  int current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SPColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage(customer: customer)),
              );
            },
            icon: Icon(
              Icons.person,
              color: BlackC,
              size: 35,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OrdersPage()),
                );
              },
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  Icon(
                    Icons.shopping_cart,
                    color: BlackC,
                    size: 35,
                  ),
                  orders.isNotEmpty
                      ? AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          height: 13,
                          width: 13,
                          decoration: BoxDecoration(
                            color: YColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        )
                      : AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          height: 13,
                          width: 13,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.centerRight,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: ThinBlack,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: TextField(
                    maxLines: 1,
                    cursorColor: BlackC,
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search_rounded,
                          size: 27,
                          color: BlackC,
                        ),
                        hintText: 'Search',
                        border: InputBorder.none),
                  ),
                ),
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      color: BlackC, borderRadius: BorderRadius.circular(35)),
                  child: const Icon(
                    Icons.filter_list_rounded,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Categories",
              style: GoogleFonts.bebasNeue(
                color: BlackC,
                fontSize: 25,
              ),
            ),
            Container(
              height: 60,
              width: double.infinity,
              child: ListView.builder(
                itemCount: categories.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        current = index;
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.all(5),
                      width: 110,
                      height: 45,
                      decoration: BoxDecoration(
                        color: current == index ? YColor : ThinBlack,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              categories[index],
                              style: GoogleFonts.bebasNeue(
                                color: BlackC,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              height: 540,
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: items[current].length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ItemPage(
                                    item: items[current][index],
                                    customer: customer,
                                  )),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.all(7),
                        color: ThinBlack,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.all(5),
                                padding: const EdgeInsets.only(left: 20),
                                child: Image.network(
                                  items[current][index].image,
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text(
                                items[current][index].name,
                                style: GoogleFonts.bebasNeue(
                                    color: BlackC,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w300),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "\$${items[current][index].price}0",
                                    style: GoogleFonts.bebasNeue(
                                        color: BlackC,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w300),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        createOrder(Order(
                                            id,
                                            DateTime.now(),
                                            customer.CustomerID,
                                            items[current][index],
                                            1));
                                      });
                                    },
                                    child: Container(
                                      width: 25,
                                      height: 25,
                                      color: YColor,
                                      child: const Icon(
                                        Icons.add,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
