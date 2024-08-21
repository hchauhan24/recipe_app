import 'package:flutter/material.dart';
import 'package:recipe/src/features/core/screens/detailscreen/ingredients_items.dart';

class IngredientsList extends StatelessWidget {
  final List<dynamic> ingredients;
  const IngredientsList({super.key, required this.ingredients});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: ingredients.length,
        itemBuilder: (context, index) {
          int quantity = ingredients[index]['quantity'].toInt();
          return IngredientItem(
              quantity: quantity.toString(),
              food: ingredients[index]['food'] as String? ??'',
              measure: ingredients[index]['measure']as String? ??'',
              imageUrl: ingredients[index]['image']as String? ??'');
        });
  }
}
