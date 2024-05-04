import 'package:donut/components/ingredient_tile.dart';
import 'package:donut/modal/donut.dart';
import 'package:donut/pages/home_page.dart';
import 'package:donut/provider/donuts_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DonutMoreDetails extends StatelessWidget {
  final Donut donut;
  const DonutMoreDetails({super.key, required this.donut});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: donut.color.withOpacity(0.4),
      appBar: AppBar(
        backgroundColor: donut.color.withOpacity(0.4),
        title: Text(donut.name),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ),
            );
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 2.2,
              decoration: BoxDecoration(color: donut.color.withOpacity(0.4)),
              child: SizedBox(
                child: Image.asset(
                  donut.image,
                  width: 300,
                  height: 300,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 2.4,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  )),
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Ingredients",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Row(
                      children: [
                        IngredientTile(
                            color: Colors.blue,
                            ingredientname: "Sugar",
                            ingredientQuantity: "8",
                            ingredientpers: "61"),
                        IngredientTile(
                            color: Colors.pink,
                            ingredientname: "Salt",
                            ingredientQuantity: "3",
                            ingredientpers: "42"),
                        IngredientTile(
                            color: Colors.orange,
                            ingredientname: "Fat",
                            ingredientQuantity: "5",
                            ingredientpers: "29"),
                        IngredientTile(
                            color: Colors.amber,
                            ingredientname: "Energy",
                            ingredientQuantity: "8",
                            ingredientpers: "30")
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Description",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(donut.description,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5, right: 15),
                      child: GestureDetector(
                        onTap: () {
                          context.read<DonutProvider>().addToCart(donut);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("${donut.name} added to cart"),
                              duration: const Duration(milliseconds: 800),
                            ),
                          );
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const HomePage(),
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: donut.color.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(30)),
                          height: 40,
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Add to Cart",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: donut.color),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Icon(
                                Icons.arrow_forward,
                                size: 18,
                                color: donut.color,
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
