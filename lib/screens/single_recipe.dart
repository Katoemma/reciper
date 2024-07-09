import 'package:flutter/material.dart';

class HealthyTacoSaladScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Healthy Taco Salad"),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Image.network(
              'https://cdn.dummyjson.com/recipe-images/30.webp'), // Replace with your image asset
          const SizedBox(height: 16),
          const Text(
            "Healthy Taco Salad",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Row(
            children: [
              Icon(Icons.access_time),
              SizedBox(width: 4),
              Text("15 Min"),
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            "This Healthy Taco Salad is the universal delight of taco night",
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 16),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text("65g carbs"),
                ],
              ),
              Column(
                children: [
                  Text("27g proteins"),
                ],
              ),
              Column(
                children: [
                  Text("120 Kcal"),
                ],
              ),
              Column(
                children: [
                  Text("91g fats"),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          ToggleButtons(
            children: [const Text('Ingredients'), const Text('Instructions')],
            isSelected: [true, false],
            onPressed: (int index) {},
          ),
          const SizedBox(height: 16),
          const Text(
            "Ingredients",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          ListTile(
            leading: Image.network(
                'https://cdn.dummyjson.com/recipe-images/30.webp'), // Replace with your image asset
            title: const Text('Tortilla Chips'),
            trailing: const Text('2'),
          ),
          ListTile(
            leading: Image.network(
                'https://cdn.dummyjson.com/recipe-images/30.webp'), // Replace with your image asset
            title: const Text('Avocado'),
            trailing: const Text('1'),
          ),
          ListTile(
            leading: Image.network(
                'https://cdn.dummyjson.com/recipe-images/30.webp'), // Replace with your image asset
            title: const Text('Red Cabbage'),
            trailing: const Text('9'),
          ),
          ListTile(
            leading: Image.network(
                'https://cdn.dummyjson.com/recipe-images/30.webp'), // Replace with your image asset
            title: const Text('Peanuts'),
            trailing: const Text('1'),
          ),
          ListTile(
            leading: Image.network(
                'https://cdn.dummyjson.com/recipe-images/30.webp'), // Replace with your image asset
            title: const Text('Red Onions'),
            trailing: const Text('1'),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Add To Cart'),
          ),
          const SizedBox(height: 16),
          const ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://cdn.dummyjson.com/recipe-images/30.webp'), // Replace with your image asset
            ),
            title: Text('Natalia Luca'),
            subtitle: Text("I'm the author and recipe developer."),
          ),
          const SizedBox(height: 16),
          const Text(
            "Related Recipes",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                RecipeCard(
                    image: 'https://cdn.dummyjson.com/recipe-images/30.webp',
                    title: 'Egg & Avocado'),
                RecipeCard(
                    image: 'https://cdn.dummyjson.com/recipe-images/30.webp',
                    title: 'Bowl of rice'),
                RecipeCard(
                    image: 'https://cdn.dummyjson.com/recipe-images/30.webp',
                    title: 'Chicken Salad'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RecipeCard extends StatelessWidget {
  final String image;
  final String title;

  RecipeCard({required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      margin: const EdgeInsets.only(right: 16),
      child: Column(
        children: [
          Image.network(image),
          const SizedBox(height: 8),
          Text(title),
        ],
      ),
    );
  }
}
