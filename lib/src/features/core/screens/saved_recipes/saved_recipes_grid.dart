import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe/src/constants/sizes.dart';
import 'package:recipe/src/features/core/controller/saved_recipes/saved_recipe_controller.dart';
import 'package:recipe/src/features/core/screens/saved_recipes/custom_grid_tile.dart';

// import 'package:recipe/src/features/core/screens/saved_recipes/custom_grid_tile.dart';

class MyGridView extends StatelessWidget {
  const MyGridView({super.key});

// final SaveRecipeController saveRecipeController = Get.put(SaveRecipeController());
  @override
  Widget build(BuildContext context) {
    return customGrid(context);
  }

  Widget customGrid(context) {
    final SaveRecipeController saveRecipeController = Get.find();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: dashboardPadding),
     child: 
     Obx(()
{  
      //        ----To show no data when no recipe is there in savedRecipes
        if (!saveRecipeController.hasSavedRecipes()) {
        return Center(
          child: Text(
            "N O     S A V E D     R E C I P E",
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        );
      }

      
        return GridView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // number of items in each row
              mainAxisSpacing: 8.0, // spacing between rows
              crossAxisSpacing: 8.0, // spacing between columns
            ),
            itemCount: saveRecipeController.savedRecipes.length,
            itemBuilder: (context, index) {
              final recipe = saveRecipeController.savedRecipes[index];
              return CustomGridTile(recipe: recipe);
            });
      }),
    );
  }
}
