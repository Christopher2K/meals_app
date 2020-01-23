import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  final List<Meal> availableMeal;

  CategoryMealsScreen(this.availableMeal);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  List<Meal> displayedMeals;
  bool _loadedInitData = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!this._loadedInitData) {
      final routeArgs =
        ModalRoute.of(this.context).settings.arguments as Map<String, String>;
      this.categoryTitle = routeArgs['title'];
      final categoryId = routeArgs['id'];
      this.displayedMeals = this.widget.availableMeal
        .where((meal) => meal.categories.contains(categoryId))
        .toList();

      this._loadedInitData = true;
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, idx) {
          final meal = this.displayedMeals[idx];
          return MealItem(
            id: meal.id,
            title: meal.title,
            imageUrl: meal.imageUrl,
            duration: meal.duration,
            affordability: meal.affordability,
            complexity: meal.complexity
          );
        },
        itemCount: this.displayedMeals.length,
      ),
    );
  }
}
