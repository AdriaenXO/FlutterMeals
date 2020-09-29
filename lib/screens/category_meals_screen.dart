import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/widgets/meal_item.dart';

import '../dummy_data.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';
  final List<Meal> availableMeals;
  CategoryMealsScreen(this.availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  List<Meal> displayedMeals;
  String categoryName;
  bool _loadedInitData = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      categoryName = routeArgs['title'];
      final categoryId = routeArgs['id'];
      final categoryMeals = widget.availableMeals
          .where((element) => element.categories.contains(categoryId))
          .toList();
      displayedMeals = categoryMeals;
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  void _removeMeal(Meal meal) {
    setState(() {
      displayedMeals.remove(meal);
    });
    print(meal);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(displayedMeals[index]);
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
