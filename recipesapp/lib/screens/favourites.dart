import 'package:flutter/material.dart';
import 'package:recipesapp/screens/widgets/categories_bar.dart';
import 'package:recipesapp/models/recipe.dart';
import 'package:recipesapp/screens/widgets/recipe_card.dart';
import 'package:recipesapp/screens/home.dart';
import 'package:recipesapp/screens/widgets/recipe_card_reduced.dart';

class FavouritesScreen extends StatefulWidget {
  FavouritesScreen({super.key, required this.recipes});
  List<Recipe> recipes;
  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  @override
  late int _currentIndex = 0;
  TextEditingController controller = TextEditingController();
  late List<Recipe> backupRecipes = widget.recipes;

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
          ? Column(
              children: [
                Container(
                    margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                    child: TextField(
                      controller: controller,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search),
                        hintText: 'Recipe name',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(color: Colors.green)),
                      ),
                      onChanged: searchRecipe,
                    )),
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.fromLTRB(15, 15, 0, 0),
                  child: Text(
                    "No recipes found",
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )
              ],
            )
          : Column(
              children: [
                Container(
                    margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                    child: TextField(
                      controller: controller,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search),
                        hintText: 'Recipe name',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(color: Colors.green)),
                      ),
                      onChanged: searchRecipe,
                    )),
                Expanded(
                  child: ListView.builder(
                    itemCount: widget.recipes.length,
                    itemBuilder: (context, index) {
                      final recipe = widget.recipes[index];

                      return RecipeCardReduced(
                          title: recipe.name,
                          cookTime: recipe.time,
                          rating: recipe.rating.toString(),
                          thumbnailUrl: recipe.images,
                          globalId: recipe.globalID,
                          description: recipe.description);
                    },
                  ),
                ),
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
                Navigator.pop(context);
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

  void searchRecipe(String query) {
    widget.recipes = backupRecipes;
    final results = widget.recipes.where((recipe) {
      final recipeName = recipe.name.toLowerCase();
      final input = query.toLowerCase();

      return recipeName.contains(input);
    }).toList();
    setState(() => widget.recipes = results);
  }
}
