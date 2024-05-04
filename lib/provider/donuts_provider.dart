import 'package:donut/modal/donut.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DonutProvider extends ChangeNotifier {
  List<Donut> DonutList = [
    Donut(
        description:
            "Doughnuts are a kind of ring-shaped snack food popular in many countries, which are usually deep fried from flour doughs",
        name: "Redvelvet",
        color: Colors.blue,
        price: "58",
        image: "asset/images/donut (3).png"),
    Donut(
        description:
            "Doughnuts are a kind of ring-shaped snack food popular in many countries, which are usually deep fried from flour doughs",
        name: "strawberry",
        color: Colors.red,
        price: "66",
        image: "asset/images/donut (5).png"),
    Donut(
        description:
            "Doughnuts are a kind of ring-shaped snack food popular in many countries, which are usually deep fried from flour doughs",
        name: "Nuts Caramel",
        color: Colors.pink,
        price: "79",
        image: "asset/images/donut (2).png"),
    Donut(
        description:
            "Doughnuts are a kind of ring-shaped snack food popular in many countries, which are usually deep fried from flour doughs",
        name: "choko",
        color: Colors.brown,
        price: "90",
        image: "asset/images/donut (4).png"),
  ];

  List<Donut> cartList = [];

  // get the list of donut
  List<Donut> getDonutList() {
    return DonutList;
  }

  // get the list of cart
  List<Donut> getCartList() {
    return cartList;
  }

  // add the donut to cart
  void addToCart(Donut donut) {
    cartList.add(donut);
    notifyListeners();
  }

  // remove the donut from cart
  void removeFromCart(Donut donut) {
    cartList.remove(donut);
    notifyListeners();
  }

  // update the donut in cart
  void updateCart(Donut donut) {
    int index = cartList.indexOf(donut);
    cartList[index] = donut;
    notifyListeners();
  }

// find the total amount of cart
  int getTotalAmount() {
    int total = 0;
    for (int i = 0; i < cartList.length; i++) {
      total += int.parse(cartList[i].price);
    }
    return total;
  }
}
