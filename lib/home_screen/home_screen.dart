import 'package:flutter/material.dart';
import 'package:recipe_application/ingredient_chooser/ingredient_chooser.dart';
import 'package:recipe_application/category_select/category_select.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:recipe_application/RecipeScreen/Detailed_RecipeScreen.dart';
import 'package:recipe_application/RecipeScreen/Recipe.dart';
import 'package:recipe_application/RecipeScreen/Recipe_Viewer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ParseRecipe();
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          title: const Text(
            '루루카의 비밀 레시피★',
            style: TextStyle(
                fontFamily: 'Maplestory',
                fontSize: 28,
                fontWeight: FontWeight.w100,
                color: Color.fromARGB(255, 2, 155, 51)),
          ),
          toolbarHeight: 60,
          elevation: 2,
          shadowColor: const Color.fromARGB(255, 2, 155, 51),
        ),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
            child: Column(
              children: [
                Container(
                  height: 200,
                  width: 200,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/kerby.gif'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const IngredientChooser(),
                        fullscreenDialog: true,
                      ),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: const Color.fromARGB(255, 187, 196, 187),
                            width: 2,
                          ),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 10,
                              offset: const Offset(10, 10),
                              color: Colors.black.withOpacity(0.2),
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 70,
                        ),
                        child: const Column(
                          children: [
                            Image(
                                width: 150,
                                height: 150,
                                image:
                                    AssetImage('assets/images/vegetable.png')),
                            Text(
                              '루루카의 냉장고 속',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'Maplestory',
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 22,
                                  fontWeight: FontWeight.w100),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Category_select(),
                        fullscreenDialog: true,
                      ),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: const Color.fromARGB(255, 187, 196, 187),
                            width: 2,
                          ),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 10,
                              offset: const Offset(10, 10),
                              color: Colors.black.withOpacity(0.2),
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 60,
                        ),
                        child: const Column(
                          children: [
                            Image(
                                width: 150,
                                height: 150,
                                image: AssetImage('assets/images/cooking.png')),
                            Text(
                              '루루카의 요리 레시피',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'Maplestory',
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 22,
                                  fontWeight: FontWeight.w100),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }

  Future<void> ParseRecipe() async {
    List<Recipe> recipes = [];

    // 에셋 폴더에 있는 텍스트 파일 경로
    String assetPath = 'assets/Recipes.txt';

    // 에셋 파일 읽기
    String fileContents = await rootBundle.loadString(assetPath);

    // 텍스트 파일을 라인별로 분리하여 리스트로 변환
    List<String> SplitedRecipes = fileContents.split('_');

    int index = 1;

    for (var tempRecipe in SplitedRecipes) {
      List<String> lines = tempRecipe.split('\n');

      // 데이터 파싱
      String title = lines[0];
      List<String> ingredients = [];
      List<String> instructions = [];
      String link = "";

      bool isIngredientsSection = false;
      bool isInstructionsSection = false;
      bool isLink = false;

      for (var line in lines.sublist(1)) {
        if (line.startsWith("[재료]")) {
          isIngredientsSection = true;
          continue;
        } else if (line.startsWith("[만드는 법]")) {
          isIngredientsSection = false;
          isInstructionsSection = true;
          continue;
        } else if (line.startsWith("[링크]")) {
          isInstructionsSection = false;
          isLink = true;
          continue;
        }

        if (isIngredientsSection) {
          ingredients.add(line.trim());
        } else if (isInstructionsSection) {
          instructions.add(line.trim());
        } else if (isLink) {
          link = line.trim();
          isLink = false;
        }
      }

      String thumb = "assets/images/recipe/$index.png";

      Recipe recipe = Recipe.parsed(
        recipeName: title,
        ingredientList: ingredients,
        instructions: instructions,
        link: link,
        thumb: thumb,
      );

      if (link != "") {
        recipes.add(recipe);
        index++;
      }
    }

    Detailed_Recipe.Recipes = recipes;
    RecipeViewer.Recipes = recipes;
  }
}
