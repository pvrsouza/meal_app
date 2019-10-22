import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryItem({
    @required this.id,
    @required this.title,
    @required this.color,
  });

  void selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed(
      '/categories-meals',
      arguments: {
        'id': id,
        'title': title,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    //Aqui poderiamos usar o GestureDetector normal, mas para ter um feedback visual usamo o InkWell
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(
          15), //melhor que seja o mesmo do BoxDecoration abaixo para que fique coerente
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Text(
          title,
          style: Theme.of(context).textTheme.title,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
