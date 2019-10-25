import './screens/meal_detail_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/categories_screen.dart';

final ROUTES = {
  /// '/'
  CategoriesScreen.routeName: (ctx) => CategoriesScreen(),

  /// '/categories-meals'
  CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(),

  /// '/meal-detail'
  MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
};
