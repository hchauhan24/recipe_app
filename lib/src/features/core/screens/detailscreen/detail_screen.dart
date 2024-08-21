import 'package:flutter/material.dart';
import 'package:get/get.dart';
// ignore: unused_import
import 'package:recipe/src/features/core/controller/detailscreen/share_recipe.dart';
import 'package:recipe/src/features/core/controller/saved_recipes/saved_recipe_controller.dart';
import 'package:recipe/src/features/core/screens/detailscreen/details_bottomnavigation.dart';
import 'package:recipe/src/features/core/screens/detailscreen/ingredients_list.dart';
import '../../../../widgets/button/circle_button.dart';

import '../../model/saved_recipes/recipe_model.dart';

class DetailScreen extends StatelessWidget {
  final Map<String, dynamic> item;
  const DetailScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final SaveRecipeController saveRecipeController = Get.find();

//SInce Recipe object is created everytime  DetailScreen is accessed , therefore checking for url in savedRecipes
 
 // Check if recipe is saved by URL
    String? savedRecipeID;
    if (saveRecipeController.isRecipeSavedByUrl(item['url'])) {
      savedRecipeID = saveRecipeController.getRecipeIdByUrl(item['url']);
    }
    final Recipe recipe = Recipe(
      id: savedRecipeID ?? item['id'] ?? '', // Use saved ID or original ID
      label: item['label'],
      image: item['image'],
      url: item['url'],
      time: item['totalTime'].toString(),
      ingredients: List<Map<String, dynamic>>.from(item['ingredients']),
    );





    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    var time = item['totalTime'];

    return SafeArea(
      child: Scaffold(
          bottomNavigationBar: DetailsBottomNavigation(
            recipeUrl: item['url'],
            recipe: recipe,
          ),
          backgroundColor: Theme.of(context).colorScheme.surface,
          body: _detailScreenBody(h, w, time, context)),
    );
  }

  //MAIN BODY
  Widget _detailScreenBody(h, w, time, context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: h * .44,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(item['image']), fit: BoxFit.cover),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleButton(
                  icon: Icons.arrow_back_ios_new_outlined,
                  onPress: () => Get.back(),
                ),
                const Spacer(),
                CircleButton(
                    icon: Icons.share,
                    onPress: () {
                      ShareRecipe.shareRecipe(item['url']);
                    }),
              ],
            ),
          ],
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: w * .04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    item['label'],
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge!
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                ),
                Text("$time min"),
                SizedBox(height: h * .02),
                Container(
                  height: h * .06,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(5)),
                  child: Text('Ingredients',
                      style: Theme.of(context).textTheme.headlineLarge),
                ),
                SizedBox(height: h * .01),
                Expanded(
                    child: IngredientsList(ingredients: item['ingredients']))
              ],
            ),
          ),
        )
      ],
    );
  }
}
