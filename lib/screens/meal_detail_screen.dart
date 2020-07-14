import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import '../widgets/card_of_items.dart';
import '../services/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context).settings.arguments;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == id);
    final mediaQuery = MediaQuery.of(context);
    final deviceHeight = mediaQuery.size.height;

    return Scaffold(
        appBar: AppBar(
          title: Text(
            selectedMeal.title,
          ),
        ),
        body: ListView(children: [
          Column(
            children: <Widget>[
              Container(
                height: deviceHeight * 0.3,
                width: double.infinity,
                child: Image.network(
                  selectedMeal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              CardOfItems(
                  title: 'Ingredients',
                  items: selectedMeal.ingredients.map((item) {
                    return Card(
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      color: Colors.amber,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 8),
                        child: Container(
                          width: double.infinity,
                          child: Text(
                            '- $item',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    );
                  }).toList()),
              CardOfItems(
                  title: 'Steps',
                  items: selectedMeal.steps.map((item) {
                    final int stepCount = selectedMeal.steps.indexOf(item);
                    return Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 22,
                          backgroundColor: Colors.pink,
                          child: Text(
                            '# ${stepCount + 1}',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        title: Text(
                          '$item',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                    );
                  }).toList())
            ],
          ),
        ]));
  }
}
