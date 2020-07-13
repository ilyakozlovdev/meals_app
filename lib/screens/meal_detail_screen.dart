import 'package:flutter/material.dart';
import '../services/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context).settings.arguments;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == id);
    final mediaQuery = MediaQuery.of(context);
    final deviceHeight = mediaQuery.size.height;
    final deviceWidth = mediaQuery.size.width;

    return Scaffold(
        appBar: AppBar(
          title: Text(selectedMeal.title),
        ),
        body: Column(
          children: <Widget>[
            Container(
              height: deviceHeight * 0.3,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Text('Ingredients',
                    style: Theme.of(context).textTheme.headline5)),
            Container(
              height: deviceHeight * 0.3,
              width: double.infinity,
              color: Colors.teal.withOpacity(0.1),
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: ListView(),
            )
          ],
        ));
  }
}
