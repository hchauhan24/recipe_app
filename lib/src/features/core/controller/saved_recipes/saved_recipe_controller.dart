import 'package:get/get.dart';
import 'package:hive/hive.dart';
import '../../model/saved_recipes/recipe_model.dart';

class SaveRecipeController extends GetxController {
  late Box box;
  var savedRecipes = <Recipe>[].obs;
  var savedStatus = <String, bool>{}.obs;

  @override
  void onInit() {
    super.onInit();
    box = Hive.box('saved_recipes');

    loadSavedRecipes();
  }

  void loadSavedRecipes() {
    try {
      // final v = savedRecipes;
      final values = box.values;
      // for (var value in values) {
      //   print("Value: $value, Type: ${value.runtimeType}");
      // }
      // for (var val in v) {
      //   print("Saved Recipe : $val");
      // }

//everytime app restarts the savedRecipe list gets empty thats why we shoudl fill it with values from box and then give them savedStatus
      savedRecipes.value = values.map((e) {
        if (e is Map<dynamic, dynamic>) {
          return Recipe.fromMap(Map<String, dynamic>.from(e));
        } else {
          throw Exception("Data format is not correct: ${e.runtimeType}");
        }
      }).toList();

//now give them savedStatus
      for (var recipe in savedRecipes) {
        savedStatus[recipe.id] = true;
      }
    } catch (e) {
      print("Error occurred: $e");
    }
  }

  void saveRecipe(Recipe recipe) {
    try {
      if (recipe.id.isEmpty) {
        recipe.id = generateUniqueId();
      }
      box.put(recipe.id, recipe.toMap());
      loadSavedRecipes();
      savedStatus[recipe.id] = true;
    } catch (e) {
      print("Error saving recipe: $e");
    }
  }

  void removeRecipe(String id) {
    try {
      box.delete(id);
      loadSavedRecipes();
      savedStatus[id] = false;
    } catch (e) {
      print("Error removing recipe: $e");
    }
  }

  bool isRecipeSaved(String id) {
    try {
      return box.containsKey(id);
    } catch (e) {
      print("Error checking if recipe is saved: $e");
      return false;
    }
  }

  String generateUniqueId() {
    return DateTime.now().millisecondsSinceEpoch.toString();
  }

  bool hasSavedRecipes() {
    return savedRecipes.isNotEmpty;
  }

  // Method to check if any saved recipe contains the given URL
  bool isRecipeSavedByUrl(String url) {
    return savedRecipes.any((recipe) => recipe.url == url);
  }

  // Method to get the ID of a recipe by its URL
  String? getRecipeIdByUrl(String url) {
    try {
      return savedRecipes.firstWhere((recipe) => recipe.url == url).id;
    } catch (e) {
      return null;
    }
  }

  void clearBox() {
    box.clear();
  }
}
