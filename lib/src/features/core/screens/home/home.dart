import 'package:flutter/material.dart';
// import 'package:get/get.dart';
import 'package:recipe/src/widgets/tabbar/tab_bar_widget.dart';
import 'package:recipe/src/constants/sizes.dart';

// import '../categories/categories_screen.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        // height: double.infinity,
        decoration: BoxDecoration(color: Theme.of(context).colorScheme.surface
            //          gradient: LinearGradient(
            // colors:[
            //             Color(0xffFFF3D8),
            //             Color(0xffFEBD2F),
            //           ],
            //           begin :const FractionalOffset(0,0),
            //           end :const FractionalOffset(1,0),
            //           stops: [0,1]
            //           )
            ),
        width: w,
        padding: const EdgeInsets.symmetric(horizontal: dashboardPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Text(RExplore,style: Theme.of(context).textTheme.headlineLarge,)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Categories',
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),

                ///Future Purpose
                // GestureDetector(
                //   onTap: ()=> Get.to(()=>const AllCategoriesPage()),
                //   child: const Text(
                //     'See all',
                //   ),
                // ),
              ],
            ),
            SizedBox(
              height: h * .045,
            ),
            const Expanded(child: TabBarWidget()),
          ],
        ),
      ),
    );
  }
}
