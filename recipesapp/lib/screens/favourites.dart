import 'package:flutter/material.dart';
import 'package:recipesapp/screens/widgets/categories_bar.dart';
import 'package:recipesapp/models/recipe.dart';
import 'package:recipesapp/screens/widgets/recipe_card.dart';
import 'package:recipesapp/screens/home.dart';

class FavouritesScreen extends StatelessWidget {
  final List<Recipe> recipes;
  FavouritesScreen({super.key, required this.recipes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        elevation: 5.0,
        shadowColor: Colors.black,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.restaurant),
            SizedBox(width: 10),
            Text('Favourite'),
          ],
        ),
      ),
      body: Column(
        children: [
          RecipesColumn(
            recipes: recipes,
            startIndex: 0,
            endIndex: recipes.length,
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1, //_currentIndex,
        // onTap: (index) {
        //   // Handle navigation to different pages based on index
        //   setState(() {
        //     _currentIndex = index;
        //     // Add logic to navigate to different pages based on index
        //   });
        // },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Saved',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Shopping list',
          ),
        ],
      ),
    );
  }
}
