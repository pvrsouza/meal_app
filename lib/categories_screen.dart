import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/cetegory_item.dart';

import './dummy-data.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      children: DUMMY_CATEGORIES
          .map((category) => CategoryItem(
                title: category.title,
                color: category.color,
              ))
          .toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        //A proporção do eixo cruzado com a extensão do eixo principal de cada filho.
        childAspectRatio: 3 / 2, //poderia ter sido 1.5
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
    );
  }
}
