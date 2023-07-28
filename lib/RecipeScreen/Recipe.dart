import 'package:flutter/material.dart';
import 'package:recipe_application/RecipeScreen/Detailed_RecipeScreen.dart';

class Recipe extends StatelessWidget {
  final String recipeName, thumb;
  late List<String> ingredientList;
  late List<String> instructions = [];
  late String link;
  Recipe({
    super.key,
    required this.recipeName,
    required this.thumb,
    required this.ingredientList,
  });

  Recipe.parsed({
    super.key,
    required this.recipeName,
    required this.thumb,
    required this.ingredientList,
    required this.instructions,
    required this.link,
  });

  Recipe.fromJson(Map<String, dynamic> json, {super.key})
      : recipeName = json['recipeName'],
        thumb = json['thumb'];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Detailed_Recipe(
              thumb: thumb,
              recipeName: recipeName,
            ),
            fullscreenDialog: true,
          ),
        );
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              margin: const EdgeInsets.only(bottom: 0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: const Color.fromARGB(255, 187, 196, 187),
                  width: 2,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      thumb,
                      width: 50,
                      height: 50,
                      fit: BoxFit.fill,
                    ),
                    Column(
                      children: [
                        Text(
                          recipeName,
                          style: const TextStyle(
                            fontFamily: 'Maplestory',
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'About Recipe...',
                          style: TextStyle(
                            fontFamily: 'Maplestory',
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
