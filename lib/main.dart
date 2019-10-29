import 'package:flutter/material.dart';

import './models/meal.dart';
import './dummy-data.dart';
import './screens/category_meals_screen.dart';
import './screens/filters_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/tabs_screen.dart';
import './screens/categories_screen.dart';
import './screens/unknow-route-screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> _avaliableMeals = DUMMY_MEALS;

  Map<String, bool> _filters = {
    'gluten': false,
    'vegan': false,
    'vegeterian': false,
    'lactose': false,
  };

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _avaliableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (_filters['vegeterian'] && !meal.isVegetarian) {
          return false;
        }
        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }

        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1), //background
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              body2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              title: TextStyle(
                fontFamily: 'RobotoCondensed',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      //home: CategoriesScreen(),
      initialRoute: CategoriesScreen.routeName, // '/'
      routes: {
        // '/'
        TabsScreen.routeName: (ctx) => TabsScreen(),

        // '/categories-meals'
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(
              avaliableMeals: _avaliableMeals,
            ),

        // '/meal-detail'
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),

        // '/filters'
        FiltersScreen.routeName: (ctx) => FiltersScreen(
              currentFilters: _filters,
              saveFilters: _setFilters,
            ),
      },

      /// Quando,por exemplo, uma rota não é mapeada ou não existe. Resumindo quando ROTA NÃO É ENCONTRADA.
      /// VANTAGEM: da acesso ao argumento de settings
      onGenerateRoute: (settings) {
        print('onGenerateRoute ${settings.name}');
        //por exemplo poderia ter um controle por rota para redirecionar para outras screens
        /* if(settings.name === MealDetailScreen.routeName){
          return ...;
        }
        if(settings.name === CategoriesScreen.routeName){
          return ...;
        } */
        return MaterialPageRoute(
          builder: (ctx) => UnknowRouteScreen(),
          settings: settings,
        );
      },

      /// Esse método é usado DEPOIS do onGenerateRoute com o ULTIMO recurso.
      /// Seria equivalente ao erro 404 da web.
      /// DEFINIÇÃO + COMPLETA: onGenerateRoute executes for any unregistered named route, onUnknownRoute executes if onGenerateRoute isn't defined or doesn't return a valid navigation action.
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (ctx) => UnknowRouteScreen(),
          settings: settings,
        );
      },
    );
  }
}
