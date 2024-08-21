import 'package:flutter/material.dart';

import 'package:recipe/src/widgets/tabbar/tab_item.dart';
import 'package:recipe/src/widgets/tabbar/tab_items_view.dart';

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Theme.of(context).colorScheme.surface,
            height: h * .05,
            child: TabBar(
              dividerColor: Colors.transparent,
              unselectedLabelColor:
                  Theme.of(context).colorScheme.inversePrimary,
              labelColor: Theme.of(context).colorScheme.inversePrimary,
              indicator: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(20)),
              labelPadding: EdgeInsets.symmetric(horizontal: w * .012),
              tabs: const [
                TabItem(title: 'Breakfast'),
                TabItem(title: 'Lunch'),
                TabItem(title: 'Dinner'),
                TabItem(title: 'Quick'),
              ],
            ),
          ),
          SizedBox(
            height: h * .02,
          ),
          const Expanded(
            child: TabBarView(
              children: [
                TabItemsView(recipe: 'breakfast'),
                TabItemsView(recipe: 'lunch'),
                TabItemsView(recipe: 'dinner'),
                TabItemsView(recipe: 'quick'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
