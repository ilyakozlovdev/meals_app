import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import '../services/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  Card buildCardOfItems(
      {@required String title,
      @required List<String> items,
      Color itemColor = Colors.teal,
      @required context}) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            Container(
                child:
                    Text(title, style: Theme.of(context).textTheme.headline5)),
            ...items.map((item) => Card(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  color: Theme.of(context).primaryColor,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    child: Container(
                      width: double.infinity,
                      child: Text(
                        item,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context).settings.arguments;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == id);
    final mediaQuery = MediaQuery.of(context);
    final deviceHeight = mediaQuery.size.height;

    return Scaffold(
        appBar: AppBar(
          title: Text(selectedMeal.title),
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
              buildCardOfItems(
                  context: context,
                  items: selectedMeal.ingredients,
                  title: 'Ingredients')
            ],
          ),
        ]));
  }
}
