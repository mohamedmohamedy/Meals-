import 'package:flutter/material.dart';
import '../screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget listTileBuilder(IconData icon, String title, Function tabHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tabHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          //...............UPPER CONTAINER......................................//
          Container(
            height: 90,
            width: double.infinity,
            alignment: Alignment.center,
            padding: EdgeInsets.all(20),
            color: Theme.of(context).colorScheme.primary,
            child: Text(
              'Settings',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ),
          //....................................................................//
          SizedBox(
            height: 20,
          ),
          //..........................ITEMS....................................//
          listTileBuilder(
            Icons.restaurant,
            'Meals',
            () => Navigator.of(context).pushReplacementNamed('/'),
          ),
          listTileBuilder(
            Icons.settings,
            'Filters',
            () => Navigator.of(context).pushReplacementNamed(
              FiltersScreen.routeName,
            ),
          ),
        ],
      ),
    );
  }
}
