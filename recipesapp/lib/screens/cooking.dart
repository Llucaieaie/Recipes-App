import 'package:flutter/material.dart';
import 'package:recipesapp/models/cookingsteps.dart';
import 'package:recipesapp/models/recipeAPI.dart';
import 'package:recipesapp/screens/home.dart';
import 'package:recipesapp/screens/widgets/ingredients.dart';

class Cooking extends StatelessWidget {
  //final List<Cook> totalIngredients;
  final int steps;

  Cooking({
    //required this.totalIngredients,
    required this.steps,
  });
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: 1,
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
        appBar: AppBar(
        title: Text('Cooking ingredients'),
        backgroundColor: const Color.fromARGB(255, 123, 204, 126),
        centerTitle: true,
        ),
        body: Column(
          children: [
            Ingredient(   
            leftText: 'CHICKEN BREASTS',
            middleText: '0.5 KG',
            startColor: Color.fromARGB(255, 140, 236, 111),
            endColor: const Color.fromARGB(255, 255, 255, 255),
            ),
            Ingredient(   
            leftText: 'OLIVE OIL',
            middleText: '3 SPOONS',
            startColor: Color.fromARGB(255, 255, 255, 255),
            endColor: const Color.fromARGB(255, 140, 236, 111),
            ),       
            Ingredient(   
            leftText: 'SEASONINGS',
            middleText: '10-25 GRAMS',
            startColor: Color.fromARGB(255, 140, 236, 111),
            endColor: const Color.fromARGB(255, 255, 255, 255),
            ),
            Container(
              height: 60,
              
            ),
          ]),
    );
  }
}