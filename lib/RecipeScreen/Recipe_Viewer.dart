import 'package:flutter/material.dart';
import 'package:recipe_application/RecipeScreen/Recipe.dart';

class RecipeViewer extends StatelessWidget {
  final List<String> selectedIngredients;
  RecipeViewer({
    super.key,
    required this.selectedIngredients,
  });

  static List<Recipe> Recipes = [];
  List<Recipe> searchResults = [];

  void searchRecipes(List<String> recipe) {
    if (selectedIngredients.isEmpty) {
      searchResults = Recipes;
    } else {
      searchResults.clear();
      for (Recipe recipe in Recipes) {
        bool exist = false;
        for (var ingredients in selectedIngredients) {
          for (var requiredIng in recipe.ingredientList) {
            if (requiredIng.contains(ingredients)) {
              exist = true;
            }
          }
        }
        if (exist) {
          searchResults.add(recipe);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    searchRecipes(selectedIngredients);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        elevation: 2,
        shadowColor: const Color.fromARGB(255, 2, 155, 51),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            size: 22,
          ),
          color: const Color.fromARGB(255, 2, 155, 51),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Recommende Recipes",
          style: TextStyle(
            color: Color.fromARGB(255, 2, 155, 51),
            fontSize: 22,
            fontFamily: 'Maplestory',
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 20),
              scrollDirection: Axis.vertical,
              itemCount: searchResults.length,
              itemBuilder: (context, index) {
                var searchedRecipe = searchResults[index];
                return searchedRecipe;
              },
              separatorBuilder: (context, index) => const Divider(),
            ),
          ),
        ],
      ),
    );
  }
}
