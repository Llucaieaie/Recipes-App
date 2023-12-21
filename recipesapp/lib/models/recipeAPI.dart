import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:recipesapp/models/recipe.dart';
import 'package:recipesapp/models/category.dart';
import 'package:http/http.dart' as http;

class RecipeApi {
  static Future<List<Recipe>> getRecipe() async {
    var uri = Uri.https('yummly2.p.rapidapi.com', '/feeds/list',
        {"limit": "18", "start": "0", "tag": "list.recipe.popular"});

    final response = await http.get(uri, headers: {
      "x-rapidapi-key": "119ce3ec6fmsh14cb9fa090032e3p1643dcjsnd91aeef1a5ef",
      "x-rapidapi-host": "yummly2.p.rapidapi.com",
      "useQueryString": "true"
    });

    Map data = jsonDecode(response.body);
    List _temp = [];

    for (var i in data['feed']) {
      _temp.add(i['content']['details']);
    }

    return Recipe.recipesFromSnapshot(_temp);
  }

  static Future<List<Categories>> getCategory() async {
    var uri = Uri.https('yummly2.p.rapidapi.com', '/categories/list');

    final response = await http.get(uri, headers: {
      "x-rapidapi-key": "119ce3ec6fmsh14cb9fa090032e3p1643dcjsnd91aeef1a5ef",
      "x-rapidapi-host": "yummly2.p.rapidapi.com",
      "useQueryString": "true"
    });

    Map data = jsonDecode(response.body);
    List _temp = [];

    for (var i in data['browse-categories']) {
      _temp.add(i['display']);
    }

    return Categories.categoriesFromSnapshot(_temp);
  }
}
