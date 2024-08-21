import 'package:get/get.dart';

class MyChipController extends GetxController {
  RxInt selectedChipIndex = (-1).obs;
  RxString findRecipe = 'breakfast'.obs;

  void onChipPressed(int index) {
    if (selectedChipIndex.value == index) {
      selectedChipIndex.value =
          -1; // Deselect if the same chip is pressed again
    } else {
      selectedChipIndex.value = index; // Select the new chip
    }
  }


}
