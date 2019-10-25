import 'package:flutter/material.dart';

class UnknowRouteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final settings = ModalRoute.of(context).settings;
    final route = settings.name;

    return Scaffold(
      appBar: AppBar(title: Text('Unknow route'),),
      body: Center(
        child: Text('A rota \'$route\' não encontrada!'),
      ),
    );
  }
}
