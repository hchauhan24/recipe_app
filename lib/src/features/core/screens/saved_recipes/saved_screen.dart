import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe/src/features/core/controller/saved_recipes/saved_recipe_controller.dart';

import 'package:recipe/src/features/core/screens/saved_recipes/saved_recipes_grid.dart';
// import 'package:recipe/src/widgets/custom_sliver/sliver_one.dart';

class SavedRecipesPage extends StatelessWidget {
   const SavedRecipesPage({super.key});

  @override
  Widget build(BuildContext context) {
 final SaveRecipeController saveRecipeController = Get.find();
    saveRecipeController.loadSavedRecipes();
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
          centerTitle: true,
          title: Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Saved Recipes",
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          )),
      body: const MyGridView(),
    );
  }
}
