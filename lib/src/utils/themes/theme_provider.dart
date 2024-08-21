import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ThemeController extends GetxController {
  RxBool isDarkTheme = false.obs;

  void changeTheme() {
    isDarkTheme.value = !isDarkTheme.value;
    Get.changeTheme(isDarkTheme.value ? ThemeData.light() : ThemeData.dark());
  }
}

// class ThemeController extends GetxController {
//   // Rx<ThemeData> is a reactive variable
//   // final _themeData = lightMode.obs;

//   ThemeData get themeData => _themeData.value;
//   bool get isDarkMode => _themeData.value == darkMode;

//   // Update the themeData
//   set themeData(ThemeData themeData) {
//     _themeData.value = themeData;
//   }

//   // Toggle between light and dark mode
//   void toggleTheme() {
//     if (_themeData.value == lightMode) {
//       themeData = darkMode;
//     } else {
//       themeData = lightMode;
//     }
//   }
// }


// class ThemeProvider with ChangeNotifier {
//   ThemeData _themeData = lightMode;
//   ThemeData get themeData => _themeData;
//   bool get isDarkMode => _themeData == darkMode;

//   set themeData(ThemeData themeData) {
//     _themeData = themeData;
//     notifyListeners();
//   }

//   void toggleTheme() {
//     if (_themeData == lightMode) {
//       themeData = darkMode;
//     } else {
//       themeData = lightMode;
//     }
//   }
// }
