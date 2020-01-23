import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  void initState () {
    this._glutenFree = this.widget.currentFilters['gluten'];
    this._vegetarian = this.widget.currentFilters['vegetarian'];
    this._vegan = this.widget.currentFilters['vegan'];
    this._lactoseFree = this.widget.currentFilters['lactose'];
    super.initState();
  }

  Widget _buildSwitchListTile (String titleText, String descriptionText, bool currentValue, Function updateValue) {
   return  SwitchListTile(
      title: Text(titleText),
      value: currentValue,
      subtitle: Text(descriptionText),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.save), onPressed: () {
            widget.saveFilters({
              'vegan': this._vegan,
              'vegetarian': this._vegetarian,
              'lactose': this._lactoseFree,
              'gluten': this._glutenFree,
            });
          },),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjusty your meal selection',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchListTile(
                  'Gluten free',
                  'Only include gluten free meals',
                  this._glutenFree,
                  (newValue) {
                    setState(() {
                      this._glutenFree = newValue;
                    });
                  },
                ),
                _buildSwitchListTile(
                  'Lactose free',
                  'Only include lactose free meals',
                  this._lactoseFree,
                  (newValue) {
                    setState(() {
                      this._lactoseFree = newValue;
                    });
                  },
                ),
                _buildSwitchListTile(
                  'Vegetarian',
                  'Only include vegeterial meals',
                  this._vegetarian,
                  (newValue) {
                    setState(() {
                      this._vegetarian = newValue;
                    });
                  },
                ),
                _buildSwitchListTile(
                  'Vegan',
                  'Only include vegan meals',
                  this._vegan,
                  (newValue) {
                    setState(() {
                      this._vegan = newValue;
                    });
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
