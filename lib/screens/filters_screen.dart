import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({
    Key? key,
    required this.saveFilters,
    required this.currentFilters
  }) : super(key: key);

  static const routeName = '/filters';

  final Function saveFilters;

  final Map<String, bool> currentFilters;

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {

  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  void initState() {
    super.initState();
    _glutenFree = widget.currentFilters['gluten']!;
    _lactoseFree = widget.currentFilters['lactose']!;
    _vegan = widget.currentFilters['vegan']!;
    _vegetarian = widget.currentFilters['vegetarian']!;
  }

  Widget _buildSwitchListTile(
      String title,
      String description,
      bool currentValue,
      Function updateValue) {
      return SwitchListTile(
        activeColor: Theme.of(context).colorScheme.secondary,
        title: Text(title),
        value: currentValue,
        subtitle: Text(description),
        onChanged: (newValue) {
          updateValue(newValue);
        },
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
        actions: [
          IconButton(
            onPressed: (){
              final selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              };
              widget.saveFilters(selectedFilters);
            },
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection.',
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          Expanded(
              child: ListView(
                children: [
                  _buildSwitchListTile(
                          'Gluten-Free',
                          'Only include gluten-free meals',
                          _glutenFree,
                          (newValue) => setState(() => _glutenFree = newValue)
                  ),
                  _buildSwitchListTile(
                          'Lactose-Free',
                          'Only include lactose-free meals',
                          _lactoseFree,
                          (newValue) => setState(() => _lactoseFree = newValue)
                  ),
                  _buildSwitchListTile(
                          'Vegetarian',
                          'Only include vegetarian meals',
                          _vegetarian,
                          (newValue) => setState(() => _vegetarian = newValue)
                  ),
                  _buildSwitchListTile(
                          'Vegan',
                          'Only include vegan meals',
                          _vegan,
                          (newValue) => setState(() => _vegan = newValue)
                  ),
                ],
              ),
          )
        ],
      ),
    );
  }
}
