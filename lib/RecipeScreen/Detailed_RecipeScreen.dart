import 'package:flutter/material.dart';
import 'Recipe.dart';

class Detailed_Recipe extends StatelessWidget {
  final String recipeName, thumb;
  late String link;
  late List<String> instruction = [];
  late List<String> ingredients = [];

  Detailed_Recipe({
    super.key,
    required this.recipeName,
    required this.thumb,
  });

  static List<Recipe> Recipes = [];

  final List<List<String>> items = [
    [
      "1.png",
      "김치볶음밥",
      "밥",
    ],
    [
      "2.png",
      "햄 계란밥",
      "밥",
    ],
    [
      "3.png",
      "어묵탕",
      "국",
    ],
    [
      "4.png",
      "부대찌개",
      "국",
    ],
    [
      "6.png",
      "들기름 계란 프라이",
      "반찬",
    ],
    [
      "8.png",
      "들기름 두부구이",
      "반찬",
    ],
    [
      "9.png",
      "메추리알 장조림",
      "반찬",
    ],
    [
      "11.png",
      "참치 김치찌개",
      "찌개",
    ],
    [
      "15.png",
      "카레 라면",
      "면",
    ],
    [
      "16.png",
      "고구마 스틱",
      "간식",
    ],
    [
      "18.png",
      "비지찌개",
      "찌개",
    ],
    [
      "23.png",
      "돼지고기 스테이크",
      "반찬",
    ],
    [
      "30.png",
      "들깨 칼국수",
      "면",
    ],
    [
      "31.png",
      "경양식 돈까스",
      "반찬",
    ],
    [
      "33.png",
      "감자탕",
      "국",
    ],
    [
      "34.png",
      "뒷다리살 카레",
      "밥",
    ],
    [
      "36.png",
      "오므라이스",
      "밥",
    ],
    [
      "37.png",
      "닭고기 덮밥",
      "밥",
    ],
    [
      "38.png",
      "소시지 케첩볶음",
      "반찬",
    ],
    [
      "39.png",
      "떡볶이",
      "간식",
    ],
    [
      "41.png",
      "소고기뭇국",
      "국",
    ],
    [
      "43.png",
      "소불고기",
      "반찬",
    ],
    [
      "44.png",
      "갈치조림",
      "반찬",
    ],
    [
      "46.png",
      "마파두부",
      "반찬",
    ],
    [
      "47.png",
      "고구마 맛탕",
      "간식",
    ],
    [
      "48.png",
      "닭 볶음탕",
      "국",
    ],
  ];

  @override
  Widget build(BuildContext context) {
    FindRecipe();
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
        title: Text(
          recipeName,
          style: const TextStyle(
              fontFamily: 'Maplestory', color: Color.fromARGB(255, 2, 155, 51)),
        ),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            //padding: const EdgeInsets.symmetric(horizontal: 0),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: Image.asset(thumb),
                    ),
                    Text(
                      recipeName,
                      style: const TextStyle(
                        fontFamily: 'Maplestory',
                        fontSize: 30,
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                      width: 300,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            "[재료]",
                            style: TextStyle(
                              fontFamily: 'Maplestory',
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          for (var line in ingredients)
                            Column(
                              children: [
                                Text(
                                  line,
                                  softWrap: true,
                                  style: const TextStyle(
                                    fontFamily: 'Maplestory',
                                    fontSize: 15,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                )
                              ],
                            ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "[만드는 방법]",
                      style: TextStyle(
                        fontFamily: 'Maplestory',
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: 300,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          for (var line in instruction)
                            Column(
                              children: [
                                Text(
                                  line,
                                  softWrap: true,
                                  style: const TextStyle(
                                    fontFamily: 'Maplestory',
                                    fontSize: 15,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                )
                              ],
                            ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void FindRecipe() {
    for (var recipe in Recipes) {
      //int isEqual = recipe.recipeName.compareTo(recipeName);
      if (recipe.recipeName.contains(recipeName)) {
        instruction = recipe.instructions;
        link = recipe.link;
        ingredients = recipe.ingredientList;
      }
    }
  }
}
