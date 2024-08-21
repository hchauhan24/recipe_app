// ignore_for_file: unused_import

import 'package:recipe/src/constants/text.dart';
import 'package:share_plus/share_plus.dart';

class ShareRecipe {
  static shareRecipe(String recipeLink) async {
    await Share.share(recipeLink);
  }
  // static shareRecipe(String recipeLink) {
  //   print(recipeLink);
  // }
}
