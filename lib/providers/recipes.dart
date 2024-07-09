//riverpod provider to fetch recipes from the api
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reciper/models/recipe.dart';
import 'package:reciper/services/recipe_api.dart';

// Provider for ApiService
final apiServiceProvider = Provider<ApiService>((ref) {
  return ApiService();
});

// FutureProvider for fetching all recipes
final recipesProvider = FutureProvider<List<Recipe>>((ref) async {
  final apiService = ref.read(apiServiceProvider);
  return apiService.getRecipes();
});

// FutureProvider for fetching a single recipe by ID
final recipeProvider = FutureProvider.family<Recipe, int>((ref, id) async {
  final apiService = ref.read(apiServiceProvider);
  return apiService.getRecipe(id);
});

// FutureProvider for searching recipes
final searchRecipesProvider =
    FutureProvider.family<List<Recipe>, String>((ref, query) async {
  final apiService = ref.read(apiServiceProvider);
  return apiService.searchRecipes(query);
});

// FutureProvider for fetching recipes by tag
final recipesByTagProvider =
    FutureProvider.family<List<Recipe>, String>((ref, tag) async {
  final apiService = ref.read(apiServiceProvider);
  return apiService.getRecipesByTag(tag);
});

// FutureProvider for fetching recipes by meal type
final recipesByMealProvider =
    FutureProvider.family<List<Recipe>, String>((ref, meal) async {
  final apiService = ref.read(apiServiceProvider);
  return apiService.getRecipesByMeal(meal);
});
