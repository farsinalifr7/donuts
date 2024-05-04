import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IngredientTile extends StatelessWidget {
  final Color color;
  final String ingredientname;
  final String ingredientQuantity;
  final String ingredientpers;
  const IngredientTile(
      {super.key,
      required this.color,
      required this.ingredientname,
      required this.ingredientQuantity,
      required this.ingredientpers});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
          width: 70,
          height: 120,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 2),
            // color: Colors.amber,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(
                height: 2,
              ),
              Text(
                ingredientname,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text("${ingredientQuantity}gram"),
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(shape: BoxShape.circle, color: color),
                child: Center(
                    child: Text(
                  "$ingredientpers %",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                )),
              )
            ],
          )),
    );
  }
}
