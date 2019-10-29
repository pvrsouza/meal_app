import 'package:flutter/material.dart';

import '../screens/tabs_screen.dart';
import '../screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String text, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        text,
        style: TextStyle(
          fontFamily: 'RobotCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              'Cooking up!',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile(
            'Meal',
            Icons.restaurant,
            () {
              /// usaremos o pushReplacementNamed porque ele não empilha na stack, simplesmente sobrescreve
              /// Isso é muito útil por exemplo numa tela de Login!
              Navigator.of(context).pushReplacementNamed(TabsScreen.routeName);
            },
          ),
          buildListTile(
            'Filters',
            Icons.settings,
            () {
              /// usaremos o pushReplacementNamed porque ele não empilha na stack, simplesmente sobrescreve
              /// Isso é muito útil por exemplo numa tela de Login!
              Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
