import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favorites;
  FavoritesScreen(this.favorites);
  static const title = 'Favorites';

  @override
  Widget build(BuildContext context) {
    if (favorites.isEmpty)
      return Center(
        child: Text('You have no favorites yet.'),
      );
    else
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(favorites[index]);
        },
        itemCount: favorites.length,
      );
  }
}
