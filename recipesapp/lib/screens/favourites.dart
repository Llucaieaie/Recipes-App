import 'package:flutter/material.dart';
import 'package:recipesapp/screens/widgets/categories_bar.dart';
import 'package:recipesapp/models/recipe.dart';
import 'package:recipesapp/screens/widgets/recipe_card.dart';
import 'package:recipesapp/screens/home.dart';

class FavouritesScreen extends StatefulWidget {
  FavouritesScreen({super.key, required this.recipes});
  final List<Recipe> recipes;
  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  @override
  late int _currentIndex = 0;
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
      body: widget.recipes.isEmpty
          ? Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.fromLTRB(15, 15, 0, 0),
              child: Text(
                "No recipes found yet",
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
          : Column(
              children: [
                RecipesColumn(
                  recipes: widget.recipes,
                  startIndex: 0,
                  endIndex: widget.recipes.length,
                )
              ],
            ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          // Handle navigation to different pages based on index
          setState(() {
            _currentIndex = index;
            // Add logic to navigate to different pages based on index
            switch (index) {
              case 0:
                break;
              case 1:
                break;
              case 2:
                break;
            }
          });
        },
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
