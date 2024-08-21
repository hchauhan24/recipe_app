import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe/src/constants/sizes.dart';
import 'package:recipe/src/features/core/screens/explore/explore_recipes_grid.dart';
// import 'package:recipe/src/features/core/screens/explore/explore_recipes_grid.dart';
import 'package:recipe/src/services/recipe_api/fetch_recipe_from_url.dart';
import 'package:recipe/src/services/recipe_api/fetch_recipe_to_widgets.dart';
import 'package:recipe/src/widgets/chip/chip_tag.dart';

import '../../../../widgets/chip/controller/chip_controller.dart';
// import 'package:recipe/src/widgets/chip/chip_tag.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    final MyChipController chipController = Get.put(MyChipController());
   
    return Obx(() {
       final findRecipe = chipController.findRecipe.value; //always define observable variable isnide obx
      return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: FetchRecipeToWidgets<List<Map<String, dynamic>>>(
          future: FetchRecipe.getResponse(findRecipe),
          builder: (context, data) {
            if (data.isEmpty) {
              return const Center(child: Text('No recipes found.'));
            }

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: dashboardPadding),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  MyInputChipWidget(),
                  Expanded(child: ExplorePageGridView(data: data))
                ],
              ),
            );
          },
        ),
      );
    });
  }
}
