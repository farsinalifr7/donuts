import 'package:donut/components/donut_more_details.dart';
import 'package:donut/modal/donut.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DonutTile extends StatelessWidget {
  final Donut donut;
  const DonutTile({super.key, required this.donut});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(6),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DonutMoreDetails(donut: donut),
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: donut.color.withOpacity(0.4),
            ),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    height: 30,
                    width: 40,
                    decoration: BoxDecoration(
                        color: donut.color,
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(8),
                            bottomLeft: Radius.circular(8))),
                    child: Center(
                      child: Text(
                        "₹ ${donut.price}",
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                    width: 80, height: 70, child: Image.asset(donut.image)),
                Text(donut.name),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.add,
                          color: Colors.grey[800],
                        )),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
