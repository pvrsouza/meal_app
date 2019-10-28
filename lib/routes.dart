import './screens/tabs_screen.dart';

import './screens/meal_detail_screen.dart';
import './screens/category_meals_screen.dart';

final ROUTES = {
  /// '/'
  '/': (ctx) => TabsScreen(),

  /// '/categories-meals'
  CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(),

  /// '/meal-detail'
  MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
};
