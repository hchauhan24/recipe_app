// ignore_for_file: unused_import
import 'package:flutter/material.dart';
import 'package:recipe/src/features/authentication/screens/signup/signup_screen.dart';

import 'package:recipe/src/features/core/screens/home/home.dart';

import 'package:get/get.dart';
import 'package:recipe/src/features/core/screens/settings/settings_screen.dart';
import 'package:recipe/src/features/core/screens/splashscreen/splash_screen.dart';
import 'package:recipe/src/utils/themes/theme.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'src/features/core/controller/saved_recipes/saved_recipe_controller.dart';
import 'src/features/core/model/saved_recipes/recipe_model.dart';
import 'src/features/core/screens/bottom_navigation/bottom_navigation.dart';
import 'src/utils/themes/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Hive.registerAdapter(RecipeAdapter());
  await Hive.initFlutter();
  await Hive.openBox('saved_recipes');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final ThemeController themeController = Get.put(ThemeController());
  final SaveRecipeController saveRecipeController =
      Get.put(SaveRecipeController());

  @override
  Widget build(BuildContext context) {

    return Obx(() {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: themeController.isDarkTheme.value ? darkMode : lightMode,
        //  home: const TestScreen(),
        home: const SplashScreen(),
      );
    });
  }
}
