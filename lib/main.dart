import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/meal_detail_screen.dart';

import './screens/categories_screen.dart';
import './routes.dart';
import './screens/unknow-route-screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
      routes: ROUTES,

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
