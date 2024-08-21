import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe/src/features/core/controller/saved_recipes/saved_recipe_controller.dart';
import 'package:recipe/src/features/core/model/saved_recipes/recipe_model.dart';
import 'package:recipe/src/features/core/screens/detailscreen/detail_screen.dart';
import 'package:recipe/src/services/image_handling/image_handler.dart';

class CustomGridTile extends StatelessWidget {
  final Recipe? recipe;
  const CustomGridTile({
    super.key,
    required this.recipe,
  });

  @override
  Widget build(BuildContext context) {
    final SaveRecipeController saveRecipeController = Get.find();
    bool isSaved = saveRecipeController.savedStatus[recipe!.id] ?? false;

    return GestureDetector(
      onTap: () => Get.to(DetailScreen(item: recipe!.toMap())),
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary.withOpacity(.3),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment
              .start, // Aligns the column contents to the left
          children: [
            Expanded(
              flex: 2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                    5.0), // Adds border radius to the image
                child: ImageHandler.loadImage(
                  url: recipe!.image,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                  placeholder: const Center(child: CircularProgressIndicator()),
                  errorWidget: const Icon(Icons.error),
                ),
              ),
            ),
            const SizedBox(
              height: 1,
            ),
            Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start, // Aligns the text to the left
              children: [
                Text(
                  recipe!.label,
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  '${recipe!.time} min',
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    if (isSaved) {
                      saveRecipeController.removeRecipe(recipe!.id);
                    } else {
                      saveRecipeController.saveRecipe(recipe!);
                    }
                  },
                  icon: Icon(
                    isSaved ? Icons.bookmark : Icons.bookmark_border,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
