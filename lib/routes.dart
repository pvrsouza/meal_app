import './screens/category_meals_screen.dart';
import './screens/categories_screen.dart';

final ROUTES = {
  CategoriesScreen.routeName: (ctx) => CategoriesScreen(), // '/'
  CategoryMealsScreen.routeName: (ctx) =>
      CategoryMealsScreen(), // '/categories-meals'
};
