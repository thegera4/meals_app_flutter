import 'package:flutter/material.dart';
import './categories_screen.dart';
import './favorites_screen.dart';
//import 'package:meals_app/widgets/main_drawer.dart';


class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

  final List<Map<String, Object>> _pages = [
    {'page': const CategoriesScreen(), 'title': 'Categories',},
    {'page': const FavoritesScreen(), 'title': 'Your Favorites',},
  ];

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(_pages[_selectedPageIndex]['title'] as String),
        ),
        body: _pages[_selectedPageIndex]['page'] as Widget,
        bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          backgroundColor: Theme.of(context).colorScheme.primary,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).colorScheme.secondary,
          currentIndex: _selectedPageIndex,
          //type: BottomNavigationBarType.shifting,
          items: const [
            BottomNavigationBarItem(
              //backgroundColor: Theme.of(context).colorScheme.primary,
              icon: Icon(Icons.category),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              //backgroundColor: Theme.of(context).colorScheme.primary,
              icon: Icon(Icons.star),
              label: 'Favorites',
            ),
          ],
        ),
      ),
    );
    //to create tab bar navigation with tabs at the top
    /*return DefaultTabController(
      //initialIndex: 1,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Meals'),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.category), text: 'Categories',),
              Tab(icon: Icon(Icons.star), text: 'Favorites',),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
          CategoriesScreen(),
          FavoritesScreen(),
          ],
        ),
      //drawer: MainDrawer(),
    ),
    );*/
  }
}
