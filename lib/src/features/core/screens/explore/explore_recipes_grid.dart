import 'package:flutter/material.dart';
// import 'package:recipe/src/features/core/model/saved_recipes/recipe_model.dart';
import 'package:recipe/src/features/core/screens/explore/explore_custom_grid_tile.dart';

class ExplorePageGridView extends StatelessWidget {
  final List<Map<String, dynamic>> data;
  const ExplorePageGridView({super.key, required this.data});

// final SaveRecipeController saveRecipeController = Get.put(SaveRecipeController());
  @override
  Widget build(BuildContext context) {
    return customGrid(context);
  }

  Widget customGrid(context) {
    return GridView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // number of items in each row
          mainAxisSpacing: 12, // spacing between rows
          crossAxisSpacing: 10, // spacing between columns
        ),
        itemCount: data.length,
        itemBuilder: (context, index) {
          
          return ExplorePageGridTile(data: data[index]);
        });
  }
}
