import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static String routeName = "/filters";
  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FiltersScreen({this.currentFilters, this.saveFilters});

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegan = false;
  var _vegetarian = false;
  var _lactoseFree = false;

  @override
  initState() {
    _glutenFree = widget.currentFilters['gluten'];
    _vegan = widget.currentFilters['vegan'];
    _vegetarian = widget.currentFilters['vegeterian'];
    _lactoseFree = widget.currentFilters['lactose'];

    super.initState();
  }

  Widget _buildSwitchListTile(
    String label,
    String description,
    bool currentValue,
    Function updateValue,
  ) {
    return SwitchListTile(
      title: Text(label),
      subtitle: Text(description),
      onChanged: updateValue,
      value: currentValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your filters'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              widget.saveFilters({
                'gluten': _glutenFree,
                'vegan': _vegan,
                'vegeterian': _vegetarian,
                'lactose': _lactoseFree,
              });
            },
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchListTile(
                  'Gluten Free',
                  'Only includes Gluten Free results',
                  _glutenFree,
                  (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  },
                ),
                _buildSwitchListTile(
                  'Vegan',
                  'Only includes vegan results',
                  _vegan,
                  (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  },
                ),
                SwitchListTile(
                  title: Text('Vegeterian'),
                  subtitle: Text('Only includes Vegeterian results'),
                  onChanged: (newValue) {
                    setState(() {
                      _vegetarian = newValue;
                    });
                  },
                  value: _vegetarian,
                ),
                SwitchListTile(
                  title: Text('Lactose Free'),
                  subtitle: Text('Only includes Lactose Free results'),
                  onChanged: (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  },
                  value: _lactoseFree,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
