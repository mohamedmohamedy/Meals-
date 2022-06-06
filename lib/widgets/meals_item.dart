import 'package:flutter/material.dart';

import '../screens/meals_details.dart';
import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final String id;

  MealItem({
    @required this.complexity,
    @required this.duration,
    @required this.imageUrl,
    @required this.title,
    @required this.id,
    @required this.affordability,
  });
//............................................................................//
  String get complexityText {
    switch (complexity) {
      case Complexity.Challenging:
        return 'Challenging';
        break;

      case Complexity.Hard:
        return 'Hard';
        break;

      case Complexity.Simple:
        return 'Simple';
        break;

      default:
        return 'Unknown';
    }
  }

//............................................................................//
  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Cheap';
        break;
      case Affordability.Luxurious:
        return 'Expensive';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      default:
        return 'Unknown';
    }
  }

//..............................Navigator.....................................//
  void selectMeal(BuildContext context) {
    Navigator.of(context)
        .pushNamed(
      MealsDetails.routeName,
      arguments: id,
    )
        .then((value) {
      if (value != null) {
        //removeItem(value);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        elevation: 5,
        margin: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    width: 300,
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: Text(
                      title,
                      style: TextStyle(fontSize: 20, color: Colors.white),
                      overflow: TextOverflow.fade,
                      softWrap: true,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(width: 6),
                      Text('$duration min'),
                    ],
                  ),
                  //............................................................//
                  Row(
                    children: [
                      Icon(Icons.work_rounded),
                      SizedBox(width: 6),
                      Text(complexityText),
                    ],
                  ),
                  //............................................................//
                  Row(
                    children: [
                      Icon(Icons.attach_money_sharp),
                      SizedBox(width: 6),
                      Text(affordabilityText),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
