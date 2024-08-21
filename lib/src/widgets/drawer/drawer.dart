import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe/src/widgets/drawer/drawer_tile.dart';
// ignore: unused_import
import 'package:recipe/src/features/core/screens/home/home.dart';

import '../../features/core/screens/settings/settings_screen.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          SizedBox(
            height: 64.0,
            child: DrawerHeader(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Let's Cook",
                style: GoogleFonts.cookie(fontSize: 40),
              ),
            ),
          ),
          MyDrawerTile(
            text: 'H O M E',
            icon: Icons.home,
            onTap: () {
              Get.back();
            },
          ),
          MyDrawerTile(
            text: 'S E T T I N G S',
            icon: Icons.settings,
            onTap: () {
              Get.to(()=>const SettingsScreen());
            },
          ),
          // MyDrawerTile(
          //   text: 'B E C O M E  A  C O O K',
          //   icon: Icons.restaurant,
          //   onTap: () {
          //     Get.to(()=>const SettingsScreen());
          //   },
          // ),
          // const Spacer(),
          // MyDrawerTile(
          //   text: 'L O G O U T',
          //   icon: Icons.logout,
          //   onTap: () {},
          // ),
        ],
      ),
    );
  }
}
