import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe/src/features/core/controller/detailscreen/start_cooking.dart';
import 'package:recipe/src/features/core/controller/saved_recipes/saved_recipe_controller.dart';
import 'package:recipe/src/features/core/model/saved_recipes/recipe_model.dart';
// import 'package:flutter/widgets.dart';

class DetailsBottomNavigation extends StatelessWidget {
  final Recipe recipe;
  final String recipeUrl;
  const DetailsBottomNavigation(
      {super.key, required this.recipeUrl, required this.recipe});

  @override
  Widget build(BuildContext context) {
    final SaveRecipeController saveRecipeController = Get.find();

    var w = MediaQuery.of(context).size.width;
    // var h = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          boxShadow: const [
            BoxShadow(color: Colors.black, blurRadius: 10, spreadRadius: -8)
          ],
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              width: w * .15,
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(5)),
              child: Obx(() {
                bool isSaved =
                    saveRecipeController.savedStatus[recipe.id] ?? false;
                return IconButton(
                  icon: Icon(
                    isSaved ? Icons.bookmark : Icons.bookmark_border,
                  ),
                  onPressed: () {
                    if (isSaved) {
                      saveRecipeController.removeRecipe(recipe.id);
                    } else {
                      saveRecipeController.saveRecipe(recipe);
                    }
                  },
                );
              }),
            ),
            SizedBox(
              width: w * .04,
            ),
            Expanded(
              flex: 2,
              child: ElevatedButton(
                  style: ButtonStyle(
                    foregroundColor: WidgetStateProperty.all(
                        Theme.of(context).colorScheme.inversePrimary),
                    backgroundColor: WidgetStateProperty.all(
                        Theme.of(context).colorScheme.primary),
                    shape: WidgetStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5))),
                  ),
                  onPressed: () {
                    StartCooking.startCooking(recipeUrl);
                  },
                  child: Text(
                    'Start Coooking',
                    style: Theme.of(context).textTheme.headlineSmall,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
