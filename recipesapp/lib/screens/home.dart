import 'package:flutter/material.dart';
import 'package:recipesapp/models/category.dart';
import 'package:recipesapp/models/recipe.dart';
import 'package:recipesapp/models/recipeAPI.dart';
import 'package:recipesapp/screens/widgets/recipe_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Recipe> _recipes;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getRecipes();
  }

  Future<void> getRecipes() async {
    _recipes = await RecipeApi.getRecipe();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.greenAccent,
          elevation: 5.0,
          shadowColor: Colors.black,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.restaurant),
              SizedBox(width: 10),
              Text('Food Recipes'),
            ],
          ),
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
        body: _isLoading
            ? Center(child: CircularProgressIndicator())
            : Column(
              children: [
                RecipesRow(recipes: _recipes, startIndex: 0, endIndex: 5,),
                RecipesRow(recipes: _recipes, startIndex: 5, endIndex: 10,),
              ],
            ));
  }
}

class RecipesCategory extends StatelessWidget {
  const RecipesCategory({
    Key? key,
    required this.categories,
  }) : super(key: key);

  final List<Categories> categories;

  @override
  Widget build(BuildContext context) {
    return const Text(categories.category);
  }
}

class RecipesRow extends StatelessWidget {
  const RecipesRow({
    Key? key,
    required this.recipes,
    required this.startIndex,
    required this.endIndex,
  }) : super(key: key);

  final List<Recipe> recipes;
  final int startIndex;
  final int endIndex;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: endIndex - startIndex,
        itemBuilder: (context, index) {
          final recipeIndex = startIndex + index;
          return RecipeCard(
            title: recipes[recipeIndex].name,
            cookTime: recipes[recipeIndex].time,
            rating: recipes[recipeIndex].rating.toString(),
            thumbnailUrl: recipes[recipeIndex].images,
          );
        },
      ),
    );
  }
}
