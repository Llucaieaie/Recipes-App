import 'package:flutter/material.dart';
import 'package:recipesapp/models/cookingsteps.dart';
import 'package:recipesapp/models/recipeAPI.dart';
import 'package:recipesapp/screens/home.dart';
import 'package:recipesapp/screens/widgets/ingredients.dart';
import 'package:recipesapp/screens/shopping.dart';

class Cooking extends StatelessWidget {
  //final List<Cook> totalIngredients;
  final int numIngredients;
  final int steps;

  Cooking({
    //required this.totalIngredients,
    required this.steps,
    required this.numIngredients,
  });
  
  @override
  Widget build(BuildContext context) {

     List<Widget> ingredientWidgets = [];

    for (int i = 0; i < numIngredients; i++) {
      String ingredientName = 'CHICKEN';
      String ingredientQuantity = '0.5 KG';

      ingredientWidgets.add(
        Ingredient(
          leftText: ingredientName,
          middleText: ingredientQuantity,
          startColor: Color.fromARGB(255, 140, 236, 111),
          endColor: const Color.fromARGB(255, 255, 255, 255),
          fontSize: 18,
            onAddPressed: () {
              
          },
        ),
      );
    }

    List<Widget> stepsWidgets = [];

    for (int i = 0; i < numIngredients; i++) {
      int j = i+1;
      String ingredientName = 'Step $j';
      String ingredientQuantity = 'Prepare the oven at 400 degrees';

      stepsWidgets.add(
        Ingredient(
          leftText: ingredientName,
          middleText: ingredientQuantity,
          startColor: Color.fromARGB(255, 140, 236, 111),
          endColor: const Color.fromARGB(255, 255, 255, 255),
          fontSize: 15,
        ),
      );
    }

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: 1,
                  onTap: (index) {
            switch (index) {
              case 0:
                break;
              case 1:;
                break;
              case 2:
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Shopping(name: 'h', quantity: 10)),
              );
              break;
            }
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
        appBar: AppBar(
        title: Text('Cooking ingredients'),
        backgroundColor: const Color.fromARGB(255, 123, 204, 126),
        centerTitle: true,
        ),
        body: Column(
          children: [
            ...ingredientWidgets,
            Container(
              height: 60,
              color: const Color.fromARGB(255, 123, 204, 126),
              child: Align(
                alignment: Alignment(0,0),
                child: Text(
                  'Steps to make it',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  )
                )
              )
            ),
            ...stepsWidgets,
          ]),
    );
  }
}