import 'package:flutter/material.dart';
import 'package:recipe_app/RecipeScreen/Detailed_RecipeScreen.dart';

class Recipe extends StatelessWidget {
  final String recipeName, thumb;
  const Recipe({
    super.key,
    required this.recipeName,
    required this.thumb,
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.network(thumb),
          Column(
            children: [
              Text(
                recipeName,
                style: const TextStyle(),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'About Recipe...',
                style: TextStyle(),
              )
            ],
          ),
        ],
      ),
    );
  }
}
