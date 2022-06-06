import 'package:flutter/material.dart';

import './screens/tabs_screen.dart';
import './screens/meals_details.dart';
import '/screens/categories_recipes_screen.dart';
import './screens/categories_screen.dart';
import './screens/filters_screen.dart';
import 'dummy_data.dart';
import './models/meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegetrian': false,
    'vegan': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favouriteMeals = [];

  void _setfilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }

        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }

        if (_filters['vegetrian'] && !meal.isVegetarian) {
          return false;
        }

        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }

        return true;
      }).toList();
    });
  }

  void _toggleMeals(String mealId) {
    final existingIndex =
        _favouriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favouriteMeals.removeAt(existingIndex);
      });
    }
    if (existingIndex < 0) {
      setState(() {
        _favouriteMeals
            .add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool _isFavouriteMeal(String id) {
    return _favouriteMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          accentColor: Colors.blueGrey,
          primarySwatch: Colors.teal,
        ),
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 1, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 1, 1),
              ),
              headline6: TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold),
            ),
      ),
      // home: Categories(),
      initialRoute: '/',
      routes: {
        '/': (context) => TabsScreen(_favouriteMeals),
        CategoriesRecipesScreen.routeName: (context) =>
            CategoriesRecipesScreen(_availableMeals),
        MealsDetails.routeName: (context) =>
            MealsDetails(_toggleMeals, _isFavouriteMeal),
        FiltersScreen.routeName: (context) =>
            FiltersScreen(_filters, _setfilters),
      },
      //onGenerateRoute: => intialize when we try to reach a named route that's not on the route table.
      onUnknownRoute: (settings) =>
          MaterialPageRoute(builder: (context) => Categories()),
      // it intialiezed as a last option before error, when on generate find no route.
    );
  }
}
