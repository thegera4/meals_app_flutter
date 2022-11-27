import 'package:flutter/material.dart';
import '../screens/categories_screen.dart';
import '../screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  Widget _buildListTile(String title, IconData icon, Function tapHandler){
    return ListTile(
      leading: Icon(icon, size: 26),
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () => tapHandler(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).colorScheme.secondary,
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          _buildListTile(
            'Meals',
            Icons.restaurant,
            //pushReplacementNamed replaces the current screen with the new one
            //better for efficiency. No back button to go back
            () => Navigator.of(context).pushReplacementNamed('/'),
          ),
          _buildListTile(
            'Filters',
            Icons.settings,
            () => Navigator.of(context).pushReplacementNamed(
                FilterScreen.routeName),
          ),
        ],
      ),
    );
  }
}
