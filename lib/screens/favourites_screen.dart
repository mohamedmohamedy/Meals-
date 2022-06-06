import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meals_item.dart';

class FavouritesScreen extends StatelessWidget {
  final List<Meal> favouriteMeals;
  FavouritesScreen(this.favouriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favouriteMeals.isEmpty) {
      return Center(
        child: Text('YOU HAVN\'T ANY FAVOURITES YET - TRY TO ADD SOME!'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            complexity: favouriteMeals[index].complexity,
            duration: favouriteMeals[index].duration,
            imageUrl: favouriteMeals[index].imageUrl,
            title: favouriteMeals[index].title,
            affordability: favouriteMeals[index].affordability,
            id: favouriteMeals[index].id,
          );
        },
        itemCount: favouriteMeals.length,
      );
    }
  }
}
