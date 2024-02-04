import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  State<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;

  // final List<Meal> _favoriteMeals = [];

  List<Meal> favoriteMeals = allFavMeals;

  // void _toggleMealFavouriteStatus(Meal meal) {
  //   final isExisting = favoriteMeals.contains(meal);
  //   print('is existing -- ${isExisting}');

  //   if (isExisting) {
  //     favoriteMeals.remove(meal);
  //   } else {
  //     favoriteMeals.add(meal);
  //   }

  //   addFavMeals = favoriteMeals;
  // }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = const CategoriesScreen(
        // onToggleFavorite: _toggleMealFavouriteStatus,
        );
    var activePageTitle = 'Categories';

    if (_selectedPageIndex == 1) {
      activePage = MealsSceen(
        meals: favoriteMeals,
        // onToggleFavorite: _toggleMealFavouriteStatus,
      );
      activePageTitle = 'Your Favorites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: const MainDrawer(),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favorites"),
        ],
      ),
    );
  }
}
