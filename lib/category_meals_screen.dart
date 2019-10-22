import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Category Name'),
      ),
      body: Center(
        child: const Text('The recipes for the category!'),
      ),
    );
  }
}
