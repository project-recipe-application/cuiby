import 'dart:math';

import 'package:flutter/material.dart';
import 'package:recipe_application/RecipeScreen/Recipe.dart';

class RecipeViewer extends StatelessWidget {
  final List<Recipe> recipes = [];

  RecipeViewer({super.key});

  void initList() {
    int index = Random().nextInt(100);
    for (int i = 0; i < 7; i++) {
      recipes.add(Recipe(
        recipeName: 'RecipeName',
        thumb: 'https://picsum.photos/id/${index++}/200/200',
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    initList();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue.withOpacity(0.7),
        title: const Text(
          "Recommende Recipes",
          style: TextStyle(fontSize: 13),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              scrollDirection: Axis.vertical,
              itemCount: recipes.length,
              itemBuilder: (context, index) {
                var recipe = recipes[index];
                return recipe;
              },
              separatorBuilder: (context, index) => const Divider(),
            ),
          ),
        ],
      ),
    );
  }
}
