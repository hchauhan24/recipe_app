import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motion_tab_bar/MotionTabBar.dart';
import 'package:recipe/src/features/core/controller/bottomnavigation/bottom_navigation_controller.dart';
import '../../../../widgets/drawer/drawer.dart';
import '../../../../constants/text.dart';
import '../explore/explore_screen.dart';
import '../home/home.dart';
import '../saved_recipes/saved_screen.dart';

// ignore: must_be_immutable
class BottomNavigationTab extends StatelessWidget {
 BottomNavigationTab({super.key});

  BottomNavigationController bottomNavigationController =
      Get.put(BottomNavigationController());

  final screens = [const Home(), const ExplorePage(), const SavedRecipesPage()];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const MyDrawer(),
        appBar: AppBar(
          scrolledUnderElevation: 0,   //AS little bit color of app bar changes on scroll (Standard material 3 behaviour)
          backgroundColor: Theme.of(context).colorScheme.surface,
          centerTitle: true,
          // leading: Icon(Icons.menu, color: Theme.of(context).iconTheme.color),
          title: Text(
            appName,
            // style: Theme.of(context).textTheme.headlineMedium,
            style: GoogleFonts.cookie(fontSize: 40),
          ),
        ),
        body: Obx(() => IndexedStack(
              index: bottomNavigationController.selectedIndex.value,
              children: screens,
            )),
        bottomNavigationBar: MotionTabBar(

          initialSelectedTab: "HOME",
          labels: const ["HOME", "EXPLORE", "SAVED"],
          tabBarColor: Theme.of(context).colorScheme.surface,
          tabIconColor: Theme.of(context).colorScheme.inversePrimary,
          tabSelectedColor: Theme.of(context).colorScheme.primary,
          textStyle: Theme.of(context).textTheme.labelSmall,
          icons: const [
            Icons.home_filled,
            Icons.explore_rounded,
            Icons.bookmark
          ],
          onTabItemSelected: (index) {
            bottomNavigationController.changeIndex(index);
          },
        ),
      ),
    );
  }
}
