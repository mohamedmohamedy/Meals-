import 'package:flutter/material.dart';

import './categories_screen.dart';
import './favourites_screen.dart';
import '../widgets/main_drawer.dart';
import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  List<Meal> favouriteMeals;
  TabsScreen(this.favouriteMeals);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _screens;

  int _screenIndex = 0;

  @override
  void initState() {
    super.initState();
    _screens = [
      {
        'screen': Categories(),
        'title': 'Categories',
      },
      {
        'screen': FavouritesScreen(widget.favouriteMeals),
        'title': 'Your Favourites',
      }
    ];
  }

  void _selectScreen(int index) {
    setState(() {
      _screenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screens[_screenIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _screens[_screenIndex]['screen'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Theme.of(context).colorScheme.secondary,
        unselectedLabelStyle:
            TextStyle(color: Theme.of(context).colorScheme.secondary),
        showUnselectedLabels: true,
        selectedItemColor: Colors.amber,
        currentIndex: _screenIndex,
        type: BottomNavigationBarType.shifting,
        onTap: _selectScreen,
        items: [
          BottomNavigationBarItem(
              //backgroundColor: Theme.of(context).colorScheme.primary,
              icon: Icon(
                Icons.category_rounded,
              ),
              label: 'Categoriess'),
          BottomNavigationBarItem(
              //backgroundColor: Theme.of(context).colorScheme.primary,
              icon: Icon(
                Icons.star,
              ),
              label: 'Favourites'),
        ],
      ),
    );
  }
}
