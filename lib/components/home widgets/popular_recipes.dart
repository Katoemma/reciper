import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reciper/models/recipe.dart';
import 'package:reciper/providers/recipes.dart';
import 'package:reciper/screens/single_recipe.dart';
import 'package:skeletonizer/skeletonizer.dart';
// Assuming your PopularRecipeCard is in a separate file

class PopularRecipes extends ConsumerWidget {
  const PopularRecipes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<List<Recipe>> recipesAsyncValue =
        ref.watch(recipesProvider); // Adjust provider name as per your setup

    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Popular Recipes',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text('See All'),
              ],
            ),
          ),
          SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: recipesAsyncValue.when(
              data: (recipes) {
                return Row(
                  children: recipes
                      .map((recipe) => PopularRecipeCard(recipe: recipe))
                      .toList(),
                );
              },
              loading: () => Row(
                children: List.generate(
                  5,
                  (index) => CircularProgressIndicator(),
                ),
              ),
              error: (error, stack) => Text('Error loading recipes: $error'),
            ),
          ),
        ],
      ),
    );
  }
}

class PopularRecipeCard extends StatelessWidget {
  final Recipe recipe;

  const PopularRecipeCard({Key? key, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => HealthyTacoSaladScreen()));
      },
      child: Container(
        width: 200,
        margin: const EdgeInsets.only(left: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.network(
                    recipe.image,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: IconButton(
                    icon:
                        const Icon(Icons.favorite_border, color: Colors.white),
                    onPressed: () {
                      // Handle favorite button press
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              recipe.name,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              '${recipe.cookTimeMinutes + recipe.prepTimeMinutes} mins',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.orange, size: 16),
                    const SizedBox(width: 4),
                    Text('${recipe.rating}',
                        style: const TextStyle(fontSize: 14)),
                    const SizedBox(width: 4),
                    Text(
                      '(${recipe.reviewCount} reviews)',
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
                Text(
                  '${recipe.caloriesPerServing} cal',
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
