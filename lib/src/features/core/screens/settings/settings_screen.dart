import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../constants/sizes.dart';
import '../../../../utils/themes/theme_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find<ThemeController>();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('S E T T I N G S'),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios_new_outlined)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(settingPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(8)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Dark Mode',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  Obx(() => Switch(
                      hoverColor: Colors.transparent,
                      activeColor: Theme.of(context).iconTheme.color,
                      value: themeController.isDarkTheme.value,
                      onChanged: (s) {
                        themeController.changeTheme();
                      }))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
