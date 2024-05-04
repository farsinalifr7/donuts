import 'package:donut/pages/home_page.dart';
import 'package:donut/provider/donuts_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My Cart",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Consumer<DonutProvider>(builder: (_, value, __) {
        return Column(
          children: [
            if (context.read<DonutProvider>().getCartList().isEmpty)
              Column(
                children: [
                  Image.asset("asset/images/shopping.png"),
                  const SizedBox(
                    height: 70,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => const HomePage()));
                    },
                    child: Container(
                      width: 150,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.deepPurple),
                      child: const Center(
                        child: Text(
                          "Show now",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            if (context.read<DonutProvider>().getCartList().isNotEmpty)
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 1.3,
                child: ListView.builder(
                    itemCount: value.getCartList().length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(value.getCartList()[index].name),
                        subtitle: Text("₹ ${value.getCartList()[index].price}"),
                        leading: Image.asset(value.getCartList()[index].image),
                        trailing: IconButton(
                          icon: const Icon(
                            Icons.remove_circle,
                            size: 20,
                          ),
                          onPressed: () {
                            value.removeFromCart(value.cartList[index]);
                          },
                        ),
                      );
                    }),
              ),
            if (value.getTotalAmount() != 0)
              Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    //borderRadius: BorderRadius.circular(8),
                    color: Colors.deepPurple.withOpacity(0.8),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Total Price',
                            style: TextStyle(
                              color: Colors.white,
                              // fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "₹ ${value.getTotalAmount()}",
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 45,
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: Colors.white,
                            )),
                        child: const Row(
                          children: [
                            Text(
                              "   Pay Now  ",
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                              size: 15,
                            ),
                          ],
                        ),
                      )
                    ],
                  ))
          ],
        );
      }),
    );
  }
}
