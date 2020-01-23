import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  FavoritesScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (this.favoriteMeals.isEmpty) {
      return Center(
        child: Text('You have no favorites yet - start add some.'),
      );
    }

    return ListView.builder(
      itemBuilder: (ctx, idx) {
        final meal = this.favoriteMeals[idx];
        return MealItem(
          id: meal.id,
          title: meal.title,
          imageUrl: meal.imageUrl,
          duration: meal.duration,
          affordability: meal.affordability,
          complexity: meal.complexity,
        );
      },
      itemCount: this.favoriteMeals.length,
    );
  }
}
