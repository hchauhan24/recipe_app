import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe/src/constants/categories_list.dart';
import 'package:recipe/src/widgets/chip/controller/chip_controller.dart';

class MyInputChipWidget extends StatelessWidget {
  MyInputChipWidget({super.key});

 
  @override
  Widget build(BuildContext context) {
     final MyChipController chipController = Get.find();
   
    List<String> categoryChips = categoryList;
    List<String> categoryChipsAvatar = categoryImages;

    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.start,
      spacing: 15,
      children: List.generate(categoryChips.length, (index) {
        return Obx(() {
          return InputChip(
            selected: chipController.selectedChipIndex.value ==
                index, //true if index is same .i.e. -1

            onPressed: () {
              chipController.onChipPressed(index);
              chipController.findRecipe.value = categoryChips[index];
            },
            selectedColor:
                Theme.of(context).colorScheme.primary.withOpacity(0.3),
            label: Text(
              categoryChips[index],
              style: Theme.of(context).textTheme.labelSmall,
            ),
            avatar: ClipOval(
              clipBehavior: Clip.hardEdge,
              child: Image.asset(
                categoryChipsAvatar[index],
                cacheHeight:
                    50, //DON'T REMOVE as it helps in optimizing images from assets
                cacheWidth:
                    50, //DON'T REMOVE as it helps in optimizing images from assets
              ),
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          );
        });
      }),
    );
  }
}
