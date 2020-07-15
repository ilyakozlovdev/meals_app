import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static String routeName = '/filters';
  final Function setFilters;
  final Map<String, bool> filters;

  FiltersScreen({this.setFilters, this.filters});

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _isGlutenFree = false;
  bool _isVegetarian = false;
  bool _isVegan = false;
  bool _isLactoseFree = false;

  @override
  initState() {
    _isGlutenFree = widget.filters['isGlutenFree'];
    _isVegetarian = widget.filters['isVegetarian'];
    _isVegan = widget.filters['isVegan'];
    _isLactoseFree = widget.filters['isLactoseFree'];
    super.initState();
  }

  Widget _buildSwitchListTile(
      {String title,
      String description,
      bool currentValue,
      Function updateValue}) {
    return SwitchListTile(
      title: Text(title),
      activeTrackColor: Theme.of(context).primaryColor,
      value: currentValue,
      onChanged: updateValue,
      subtitle: Text(description),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: [
          IconButton(
            icon: Icon(
              Icons.save,
              color: Colors.black,
            ),
            onPressed: () => widget.setFilters({
              'isGlutenFree': _isGlutenFree,
              'isVegetarian': _isVegetarian,
              'isVegan': _isVegan,
              'isLactoseFree': _isLactoseFree
            }),
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection.',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchListTile(
                    title: 'Gluten Free',
                    currentValue: _isGlutenFree,
                    description: 'Only gluten free meals',
                    updateValue: (newValue) {
                      setState(() {
                        _isGlutenFree = newValue;
                      });
                    }),
                _buildSwitchListTile(
                    title: 'Vegetarian',
                    currentValue: _isVegetarian,
                    description: 'Only vegetarian meals',
                    updateValue: (newValue) {
                      setState(() {
                        _isVegetarian = newValue;
                      });
                    }),
                _buildSwitchListTile(
                    title: 'Vegan',
                    currentValue: _isVegan,
                    description: 'Only vegan meals',
                    updateValue: (newValue) {
                      setState(() {
                        _isVegan = newValue;
                      });
                    }),
                _buildSwitchListTile(
                    title: 'Lactose Free',
                    currentValue: _isLactoseFree,
                    description: 'Only lactose free meals',
                    updateValue: (newValue) {
                      setState(() {
                        _isLactoseFree = newValue;
                      });
                    })
              ],
            ),
          )
        ],
      ),
    );
  }
}
