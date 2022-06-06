import 'package:flutter/material.dart';

import '../dummy_data.dart';

class MealsDetails extends StatelessWidget {
  static const routeName = '/meals-details';

  final Function favouriteMeals;
  final Function isFavourite;
  MealsDetails(this.favouriteMeals, this.isFavourite);

  Widget sectionTitleBuilder(BuildContext context, String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget containerBuilder(BuildContext context, Widget child) {
    return Container(
      height: 150,
      width: 300,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final String mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //...........THE IMAGE................................................//
            Container(
              width: double.infinity,
              height: 300,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            //..............INGREDIANTS TITLE.....................................
            sectionTitleBuilder(context, 'INGREDIANTS'),
            //.....................INGREDIANTS CARD.................................
            containerBuilder(
              context,
              ListView.builder(
                itemBuilder: (context, index) => Card(
                  color: Theme.of(context).colorScheme.secondary,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    ),
                    child: Text(
                      selectedMeal.ingredients[index],
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ),
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            //..............STEPS TITLE.............................................
            sectionTitleBuilder(context, 'STEPS'),
            containerBuilder(
                context,
                ListView.builder(
                  itemBuilder: (context, index) => Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text('#${index + 1}'),
                        ),
                        title: Text(selectedMeal.steps[index]),
                      ),
                      Divider(),
                    ],
                  ),
                  itemCount: selectedMeal.steps.length,
                )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: isFavourite(mealId) ? Icon(Icons.star) : Icon(Icons.star_border),
        onPressed: () => favouriteMeals(mealId),
      ),
    );
  }
}
