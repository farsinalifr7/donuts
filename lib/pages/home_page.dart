import 'package:donut/components/donut_tile.dart';
import 'package:donut/modal/donut.dart';
import 'package:donut/modal/item_group.dart';
import 'package:donut/pages/cart_page.dart';
import 'package:donut/provider/donuts_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<ItemGroup> ItemGrop = [
      ItemGroup(name: "Donut", imagePath: "asset/images/donut (1).png"),
      ItemGroup(name: "Ice Cream", imagePath: "asset/images/ice-cream-cup.png"),
      ItemGroup(name: "Pizza", imagePath: "asset/images/pizza.png"),
      ItemGroup(name: "Juice", imagePath: "asset/images/orange-juice.png"),
      ItemGroup(name: "Burger", imagePath: "asset/images/burger (1).png"),
    ];

    return Scaffold(
      floatingActionButton: FloatingActionButton(
          //shape: ShapeBorder.lerp(a, b, t),
          backgroundColor: Colors.black,
          child: const Icon(
            Icons.shopify_rounded,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(
              context,
              CupertinoPageRoute(builder: (context) {
                return const CartPage();
              }),
            );
          }),
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) {
                    return const CartPage();
                  }),
                );
              },
              icon: const Icon(Icons.shopify_rounded)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: [
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    "I want to ",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Text(
                  "Eat",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: double.infinity,
              height: 70,
              child: ListView.builder(
                  itemCount: ItemGrop.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 25),
                      child: Container(
                        child: Column(
                          children: [
                            SizedBox(
                                width: 50,
                                height: 50,
                                child: Image.asset(ItemGrop[index].imagePath)),
                            const SizedBox(
                              height: 1,
                            ),
                            Text(ItemGrop[index].name,
                                style: const TextStyle(
                                  // color: Colors.white,
                                  fontSize: 12,
                                )),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: double.infinity,
              height: 380,
              child: Consumer(builder: (_, value, __) {
                var list = context.read<DonutProvider>().getDonutList();

                return GridView.builder(
                    itemCount: 4,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 1 / 1.1),
                    itemBuilder: (context, index) {
                      return DonutTile(donut: list[index]);
                    });
              }),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 5, right: 5),
              child: Container(
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(

                    // border: Border.all(
                    //   width: 1,

                    // ),
                    borderRadius: BorderRadius.circular(8)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 60,
                          width: 70,
                          child: Image.asset("asset/images/donut (6).png"),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text("₹ 216"),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 60,
                          width: 70,
                          child: Image.asset("asset/images/gogosi.png"),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text("₹ 180"),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 60,
                          width: 70,
                          child: Image.asset("asset/images/donut (7).png"),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text("₹ 200"),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 60,
                          width: 70,
                          child: Image.asset("asset/images/doughnut.png"),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text("₹ 215"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
