import './screens/tabs_screen.dart';

import './screens/meal_detail_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/filters_screen.dart';

final ROUTES = {
  // '/'
  TabsScreen.routeName: (ctx) => TabsScreen(),

  // '/categories-meals'
  CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(),

  // '/meal-detail'
  MealDetailScreen.routeName: (ctx) => MealDetailScreen(),

  // '/filters'
  FiltersScreen.routeName: (ctx) => FiltersScreen(),
};
