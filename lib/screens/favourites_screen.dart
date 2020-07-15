import 'package:flutter/material.dart';
import 'package:meals_app/widgets/meal_item.dart';
import '../models/meal.dart';

class FavouritesScreen extends StatelessWidget {
  final List<Meal> favouriteMeals;

  FavouritesScreen({this.favouriteMeals});

  @override
  Widget build(BuildContext context) {
    return favouriteMeals.isEmpty
        ? Center(
            child: Text('No favourites'),
          )
        : ListView.builder(
            itemBuilder: (ctx, index) => MealItem(
              title: favouriteMeals[index].title,
              id: favouriteMeals[index].id,
              complexity: favouriteMeals[index].complexity,
              duration: favouriteMeals[index].duration,
              imageUrl: favouriteMeals[index].imageUrl,
              rating: favouriteMeals[index].rating,
            ),
            itemCount: favouriteMeals.length,
          );
  }
}
