import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Map<String, bool> currentFiters;
  final Function setFilters;
  FiltersScreen(this.currentFiters, this.setFilters);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _isVegan = false;
  bool _isVegeterian = false;
  bool _isLactoseFree = false;
  bool _isGlutenFree = false;
  @override
  initState() {
    super.initState();
    _isGlutenFree = widget.currentFiters['gluten'];
    _isLactoseFree = widget.currentFiters['lactose'];
    _isVegeterian = widget.currentFiters['vegetrian'];
    _isVegan = widget.currentFiters['vegan'];
  }

  Widget _switchBuilder(String title, String description, bool currentValue,
      Function updateValue) {
    return ListView(
      children: [
        SwitchListTile(
          title: Text(title),
          subtitle: Text(description),
          value: currentValue,
          onChanged: updateValue,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: [
          IconButton(
            onPressed: () {
              final selectedFilters = {
                'gluten': _isGlutenFree,
                'lactose': _isLactoseFree,
                'vegetrian': _isVegeterian,
                'vegan': _isVegan,
              };
              widget.setFilters(selectedFilters);
            },
            icon: Icon(Icons.save),
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Select what do you prefer!',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
              child: _switchBuilder(
            'Gluten-free',
            'Only select Gluten-free meals',
            _isGlutenFree,
            (newValue) {
              setState(() {
                _isGlutenFree = newValue;
              });
            },
          )),
          Expanded(
              child: _switchBuilder(
            'Lactouse-free',
            'Only select Lactouse-free meals',
            _isLactoseFree,
            (newValue) {
              setState(() {
                _isLactoseFree = newValue;
              });
            },
          )),
          Expanded(
              child: _switchBuilder(
            'Vegeterian',
            'Only select Vegeterian meals',
            _isVegeterian,
            (newValue) {
              setState(() {
                _isVegeterian = newValue;
              });
            },
          )),
          Expanded(
              child: _switchBuilder(
            'Vegan',
            'Only select Vegan meals',
            _isVegan,
            (newValue) {
              setState(() {
                _isVegan = newValue;
              });
            },
          )),
        ],
      ),
    );
  }
}
