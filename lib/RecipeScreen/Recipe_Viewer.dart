import 'package:flutter/material.dart';
import 'package:recipe_application/RecipeScreen/Recipe.dart';

final List<Recipe> totalrecipe = [
  Recipe(
    recipeName: '토마토 파스타',
    thumb: 'assets/images/jump.gif',
    ingredientList: const ['토마토', '양파', '치즈'],
  ),
  Recipe(
    recipeName: '샐러드',
    thumb: 'assets/images/log.gif',
    ingredientList: const ['양상추', '토마토', '오이'],
  ),
  Recipe(
    recipeName: '불고기',
    thumb: 'assets/images/jump copy.gif',
    ingredientList: const ['소고기', '양파', '소스'],
  ),
  Recipe(
    recipeName: '김치찌개',
    thumb: 'assets/images/log copy.gif',
    ingredientList: const ['김치', '소고기', '양파'],
  ),
  Recipe(
    recipeName: '햄버거',
    thumb: 'assets/images/jump copy 2.gif',
    ingredientList: const ['빵', '소고기', '양상추', '토마토'],
  ),
  Recipe(
    recipeName: '초밥',
    thumb: 'assets/images/log copy 2.gif',
    ingredientList: const ['생선', '소스', '밥'],
  ),
  Recipe(
    recipeName: '김치 볶음밥',
    thumb: 'assets/images/jump copy 3.gif',
    ingredientList: const ['김치', '밥', '김'],
  ),
  Recipe(
    recipeName: '양상추 찜',
    thumb: 'assets/images/log copy 3.gif',
    ingredientList: const ['양상추'],
  ),
];

List<Recipe> searchResults = [];

class RecipeViewer extends StatelessWidget {
  final List<String> recipes;
  const RecipeViewer({super.key, required this.recipes});

  void searchRecipes(List<String> recipe) {
    if (recipes.isEmpty) {
      searchResults = totalrecipe;
    } else {
      searchResults.clear();
      for (Recipe recipe in totalrecipe) {
        bool exist = true;
        for (var ingredients in recipes) {
          if (!recipe.ingredientList.contains(ingredients)) {
            exist = false;
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
    searchRecipes(recipes);
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
