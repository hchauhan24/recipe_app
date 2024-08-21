import 'package:flutter/material.dart';

// import 'package:recipe/src/features/core/model/saved_recipes/recipe_model.dart';
// import 'package:recipe/src/features/core/model/saved_recipes/recipe_model.dart';

import '../../../../services/image_handling/image_handler.dart';

class ExplorePageGridTile extends StatelessWidget {
  final Map<String, dynamic> data;
  const ExplorePageGridTile({super.key, required this.data});

  @override
  Widget build(BuildContext context) {


    final time = data['totalTime'];
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment:
            CrossAxisAlignment.start, // Aligns the column contents to the left
        children: [
          Expanded(
            flex: 2,
            child: ClipRRect(
              borderRadius:
                  BorderRadius.circular(5.0), // Adds border radius to the image
              child: ImageHandler.loadImage(
                url: data['image'],
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
                data['label'],
                style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                '$time min',
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ],
          ),
        ],
      ),
    );
  }

}
