import 'package:flutter/material.dart';
import 'package:recipesapp/models/cookingsteps.dart';
import 'package:recipesapp/models/recipeAPI.dart';
import 'package:recipesapp/screens/home.dart';

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
            Container(
              child: Text('hi: $steps'),
              height: 300,
              width: 300,
              color: Colors.black12,
            ),
          ]),
    );
  }
}