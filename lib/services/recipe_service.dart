


import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/recipe.dart';

class RecipeService {
  static const String url = 'https://hf-android-app.s3-eu-west-1.amazonaws.com/android-test/recipes.json';

  static Future<List<Recipe>> fetchRecipes() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<Recipe> recipes = body.map((dynamic item) => Recipe.fromJson(item)).toList();
      return recipes;
    } else {
      throw Exception('Failed to load recipes');
    }
  }
}