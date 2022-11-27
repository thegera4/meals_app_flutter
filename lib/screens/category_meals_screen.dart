import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  const CategoryMealsScreen({
    Key? key,
    required categoryTitle,
    required categoryId,
  }) : super(key: key);

  static const routeName = '/category-meals';

  @override
  Widget build(BuildContext context) {

    //to get the arguments passed from the previous screen
    final routeArgs = ModalRoute.of(context)!
        .settings.arguments as Map<String, String>;

    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];

    //to get the filtered meals that belong to the category id
    final categoryMeals = dummyMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList(); //where returns an iterable, so we need to convert it to a list

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
              id: categoryMeals[index].id,
              title: categoryMeals[index].title,
              imageUrl: categoryMeals[index].imageUrl,
              duration: categoryMeals[index].duration,
              complexity: categoryMeals[index].complexity,
              affordability: categoryMeals[index].affordability
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
