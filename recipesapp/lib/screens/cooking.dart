import 'package:flutter/material.dart';
import 'package:recipesapp/models/cookingsteps.dart';
import 'package:recipesapp/models/recipeAPI.dart';

class Cooking extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cooking Steps'),
      ),
      body: Center(
        child: Text(
          'Display Cooking Steps Here', // Replace this with your cooking steps UI
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}