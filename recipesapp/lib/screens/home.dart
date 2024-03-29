import 'package:flutter/material.dart';
import 'package:recipesapp/models/category.dart';
import 'package:recipesapp/models/recipe.dart';
import 'package:recipesapp/models/recipeAPI.dart';
import 'package:recipesapp/screens/favourites.dart';
import 'package:recipesapp/screens/widgets/recipe_card.dart';
import 'package:recipesapp/screens/widgets/recipe_card_reduced.dart';

//Variable global para lista de favoritos
List<Recipe> favouriteRecipes = [];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Recipe> _recipes;
  late List<Categories> _categories;
  late int _currentIndex = 1;

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    await Future.wait([getRecipes(), getCategory()]);
    setState(() {
      _isLoading = false;
    });
  }

  Future<void> getRecipes() async {
    _recipes = await RecipeApi.getRecipe();
  }

  Future<void> getCategory() async {
    _categories = await RecipeApi.getCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TitleBar(),
      bottomNavigationBar: NavigationBar(context),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              children: [
                RecipesCategory(
                  categories: _categories,
                  categoryId: 0,
                ),
                RecipesRow(
                  recipes: _recipes,
                  startIndex: 0,
                  endIndex: 5,
                ),
                RecipesCategory(
                  categories: _categories,
                  categoryId: 1,
                ),
                RecipesRow(
                  recipes: _recipes,
                  startIndex: 5,
                  endIndex: 10,
                ),
                RecipesCategory(
                  categories: _categories,
                  categoryId: 3,
                ),
                RecipesColumn(
                  recipes: _recipes,
                  startIndex: 10,
                  endIndex: 18,
                )
              ],
            ),
    );
  }


//------------------------------------------------


  AppBar TitleBar() {
    return AppBar(
      backgroundColor: const Color.fromRGBO(105, 240, 174, 1),
      elevation: 5.0,
      shadowColor: Colors.black,
      title: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.restaurant),
          SizedBox(width: 10),
          Text('Food Recipes'),
        ],
      ),
    );
  }

  BottomNavigationBar NavigationBar(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (index) {
        // Handle navigation to different pages based on index
        setState(() {
          _currentIndex = index;
          // Add logic to navigate to different pages based on index
          switch (index) {
            case 0:
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          FavouritesScreen(recipes: favouriteRecipes)));
              break;
            case 1:
              break;
            case 2:
              break;
          }
        });
      },
      items: const [
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
    );
  }
}


//------------------------------------------------


class RecipesCategory extends StatelessWidget {
  const RecipesCategory({
    Key? key,
    required this.categories,
    required this.categoryId,
  }) : super(key: key);

  final List<Categories> categories;
  final int categoryId;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.fromLTRB(15, 15, 0, 0),
      child: Text(
        categories[categoryId].category,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
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
            globalId: recipes[recipeIndex].globalID,
            description: recipes[recipeIndex].description,
          );
        },
      ),
    );
  }
}



class RecipesColumn extends StatelessWidget {
  RecipesColumn({
    Key? key,
    required this.recipes,
    required this.startIndex,
    required this.endIndex,
  }) : super(key: key);

  List<Recipe> recipes;
  final int startIndex;
  final int endIndex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: List.generate(
          endIndex - startIndex,
          (index) {
            final recipeIndex = startIndex + index;
            return RecipeCardReduced(
              title: recipes[recipeIndex].name,
              cookTime: recipes[recipeIndex].time,
              rating: recipes[recipeIndex].rating.toString(),
              thumbnailUrl: recipes[recipeIndex].images,
              globalId: recipes[recipeIndex].globalID,
              description: recipes[recipeIndex].description,
            );
          },
        ),
      ),
    );
  }
}
