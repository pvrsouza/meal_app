import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/categories-meals';
  final List<Meal> avaliableMeals;

  CategoryMealsScreen({this.avaliableMeals});

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  List<Meal> displayedMeals;
  bool _loadInitData = false;

  @override
  void initState() {
    //...
    super.initState();
  }

  ///Estamos usando didChangeDependencies() ao inves do initState() porque ModalRoute.of(context) dentro do initState ainda não tem o contexto inicializado
  @override
  void didChangeDependencies() {
    if (!_loadInitData) {
      //como passamos o objeto na rota como um map temos que fazer o Cast
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;

      categoryTitle = routeArgs['title'];
      final categoryId = routeArgs['id'];

      displayedMeals = widget.avaliableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();

      _loadInitData = true;
    }

    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            id: displayedMeals[index].id,
            affordability: displayedMeals[index].affordability,
            complexity: displayedMeals[index].complexity,
            imageUrl: displayedMeals[index].imageUrl,
            duration: displayedMeals[index].duration,
            title: displayedMeals[index].title,
            removeItem: _removeMeal,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
