import 'dart:convert';
import 'package:recipesapp/models/recipe.dart';
import 'package:recipesapp/models/category.dart';
import 'package:http/http.dart' as http;
import 'package:recipesapp/models/review.dart';

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
      var details = i['content']['details'];
      details['text'] = i['content']['description']; // Añade la descripción al objeto details
      _temp.add(details);
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

  static Future<List<Review>> getReviews(String id) async {
    var uri = Uri.https('yummly2.p.rapidapi.com', '/reviews/list', {
      "limit": "10",
      "offset": "0",
      "globalId": id,
    });

    final response = await http.get(uri, headers: {
      "x-rapidapi-key": "87e6da0ff1msha62a3f9fc8d01fcp19cda6jsn40de3f0698a5",
      "x-rapidapi-host": "yummly2.p.rapidapi.com",
    });

    Map data = jsonDecode(response.body);
    List _temp = [];

    for (var i in data['reviews']) {
      _temp.add(i);
    }

    return Review.reviewsFromSnapshot(_temp);
  }
}
