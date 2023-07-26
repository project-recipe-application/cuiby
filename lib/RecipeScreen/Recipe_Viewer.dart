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

class RecipeViewer extends StatelessWidget {
  final List<String> recipes;
  RecipeViewer({super.key, required this.recipes});

  List<Recipe> searchResults = [];

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
