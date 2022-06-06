import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../widgets/category_item.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      // WE USE "GRID" TO DEVIDE THE SCREEN OF SCROLLABLE LIST.
      padding: EdgeInsets.all(25),
      //..............*THE OVERALL CUSTOM SETTING OF THE GRID*................
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          // "SLIVER" ONLY BUILD THE ELEMENTS THAT ON THE SCREEN.
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),

      //...............*THE ELEMENTS*.........................................
      children: DUMMY_CATEGORIES
          .map((catData) =>
              CategoryItem(catData.id, catData.title, catData.color))
          .toList(),
    );
  }
}
