import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe/src/features/core/screens/detailscreen/detail_screen.dart';
import 'package:recipe/src/services/recipe_api/fetch_recipe_from_url.dart';
import 'package:recipe/src/services/recipe_api/fetch_recipe_to_widgets.dart';

import '../../services/image_handling/image_handler.dart';


class TabItemsView extends StatelessWidget {
  final String recipe;
  const TabItemsView({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return FetchRecipeToWidgets<List<Map<String, dynamic>>>(
      future: FetchRecipe.getResponse(recipe),
      builder: (context, data) {
        return ListView.separated(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.zero,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            Map<String, dynamic> snap = data[index];
            int time = snap['totalTime'].toInt();
            int calories = snap['calories'].toInt();
            return Container(
              margin: EdgeInsets.symmetric(horizontal: w * .06),
              width: w * .5,
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.to(() => DetailScreen(item: snap));
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: SizedBox(
                            width: w,
                            height: h * .22,                         
                                                 child  : ImageHandler.loadImage(
                                          url:snap['image'],
                                          width: double.infinity,
                                          height: double.infinity,
                                          fit: BoxFit.cover,
                                          placeholder: const Center(child: CircularProgressIndicator()),
                                          errorWidget: const Icon(Icons.error),
                                        ),
                       
                          ),
                        ),
                      ),
                      SizedBox(
                        height: h * .01,
                      ),
                      Text(
                        snap['label'],
                        style: Theme.of(context)
                            .textTheme
                            .labelSmall!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: h * .001,
                      ),
                      Text(
                        '${calories.toString()} calories - ${time.toString()} minutes',
                        style: Theme.of(context).textTheme.labelSmall,
                      )
                    ],
                  )
                ],
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 25,
            );
          },
          itemCount: data.length,
        );
      },
    );
  }
}
