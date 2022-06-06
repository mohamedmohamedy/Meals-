import 'package:flutter/material.dart';

import '../widgets/meals_item.dart';
import '../models/meal.dart';

class CategoriesRecipesScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  final List<Meal> availableMeals;
  CategoriesRecipesScreen(this.availableMeals);

  @override
  State<CategoriesRecipesScreen> createState() =>
      _CategoriesRecipesScreenState();
}

class _CategoriesRecipesScreenState extends State<CategoriesRecipesScreen> {
  String categoryTitle;
  List<Meal> displayedMeals;
  bool _initDateChange = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_initDateChange) {
      final routeArg =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      categoryTitle = routeArg['title'];
      final categoryId = routeArg['id'];
      displayedMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
    }
    _initDateChange = true;
  }

  void _removeItem(String mealId) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return MealItem(
              complexity: displayedMeals[index].complexity,
              duration: displayedMeals[index].duration,
              imageUrl: displayedMeals[index].imageUrl,
              title: displayedMeals[index].title,
              affordability: displayedMeals[index].affordability,
              id: displayedMeals[index].id,
            );
          },
          itemCount: displayedMeals.length,
        ));
  }
}
