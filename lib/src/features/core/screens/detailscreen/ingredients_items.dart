import 'package:flutter/material.dart';

class IngredientItem extends StatelessWidget {
  final String quantity, food, measure, imageUrl;
  const IngredientItem(
      {super.key,
      required this.quantity,
      required this.food,
      required this.measure,
      required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        padding: const EdgeInsets.all(7.0),
        height: h * 0.07,
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              width: 2,
              color: Theme.of(context).colorScheme.secondary,
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.network(
                imageUrl,
                width: w * .2,
                height: h * .1,
                fit: BoxFit.cover,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  food.toLowerCase(),
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Text(
                  '$quantity $measure',
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall!
                      .copyWith(fontWeight: FontWeight.w200),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
