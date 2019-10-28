import 'package:flutter/material.dart';
import '../widgets/cetegory_item.dart';

import '../dummy-data.dart';

class CategoriesScreen extends StatelessWidget {
  static const routeName = "/";

  @override
  Widget build(BuildContext context) {
    return _buildCategoriesGrid();
  }

  Widget _buildCategoriesGrid() {
    return GridView(
      padding: const EdgeInsets.all(15),
      children: DUMMY_CATEGORIES
          .map((category) => CategoryItem(
                id: category.id,
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
