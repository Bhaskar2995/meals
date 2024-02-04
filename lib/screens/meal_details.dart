import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/meal.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({
    super.key,
    required this.meal,
    // required this.onToggleFavorite
  });

  final Meal meal;
  // final void Function(Meal meal) onToggleFavorite;

  @override
  Widget build(BuildContext context) {
    void _showInfoMessage(String message) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(message)));
    }

    return Scaffold(
      appBar: AppBar(title: Text(meal.title), actions: [
        IconButton(
            onPressed: () {
              List<Meal> favoriteMeals = allFavMeals;
              final isExisting = favoriteMeals.contains(meal);

              if (isExisting) {
                favoriteMeals.remove(meal);
                _showInfoMessage('Removed from favorites');
              } else {
                favoriteMeals.add(meal);
                _showInfoMessage('Added to favorites');
              }

              addFavMeals = favoriteMeals;

              // onToggleFavorite(meal);
            },
            icon: const Icon(Icons.star))
      ]),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(meal.imageUrl,
                height: 300, width: double.infinity, fit: BoxFit.cover),
            const SizedBox(
              height: 14,
            ),
            Text(
              'Ingredients',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
            for (final ingredient in meal.ingredients)
              Text(ingredient,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground)),
            const SizedBox(
              height: 24,
            ),
            Text(
              "Steps",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
            for (final step in meal.steps)
              Text(
                step,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              )
          ],
        ),
      ),
    );
  }
}
