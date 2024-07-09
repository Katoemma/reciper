import 'dart:convert';

import 'package:reciper/models/recipe.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String _baseUrl = "https://dummyjson.com/recipes";

  Future<List<Recipe>> getRecipes() async {
    final response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return (data['recipes'] as List)
          .map((recipe) => Recipe.fromJson(recipe))
          .toList();
    } else {
      throw Exception("Failed to load recipes");
    }
  }

  //get single recipe
  Future<Recipe> getRecipe(int id) async {
    final response = await http.get(Uri.parse("$_baseUrl/$id"));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return Recipe.fromJson(data);
    } else {
      throw Exception("Failed to load recipe");
    }
  }

  //search recipe
  Future<List<Recipe>> searchRecipes(String query) async {
    final response = await http.get(Uri.parse("$_baseUrl/search?q=$query"));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return (data['recipes'] as List)
          .map((recipe) => Recipe.fromJson(recipe))
          .toList();
    } else {
      throw Exception("Failed to load recipes");
    }
  }

  //get recipes by tag
  Future<List<Recipe>> getRecipesByTag(String tag) async {
    final response = await http.get(Uri.parse("$_baseUrl/tag/$tag"));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return (data['recipes'] as List)
          .map((recipe) => Recipe.fromJson(recipe))
          .toList();
    } else {
      throw Exception("Failed to load recipes");
    }
  }

  //recipe by meal
  Future<List<Recipe>> getRecipesByMeal(String meal) async {
    final response = await http.get(Uri.parse("$_baseUrl/meal-type/$meal"));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return (data['recipes'] as List)
          .map((recipe) => Recipe.fromJson(recipe))
          .toList();
    } else {
      throw Exception("Failed to load recipes");
    }
  }
}
