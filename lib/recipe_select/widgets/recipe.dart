import 'package:flutter/material.dart';
import 'package:recipe_application/RecipeScreen/Detailed_RecipeScreen.dart';

class Recipe extends StatelessWidget {
  final String img, name;
  const Recipe({super.key, required this.img, required this.name});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Detailed_Recipe(
              recipeName: name,
              thumb: "assets/images/$img",
            ),
            fullscreenDialog: true,
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: const Color.fromARGB(255, 187, 196, 187),
            width: 2,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(
                "assets/images/$img",
                width: 50,
                height: 50,
                fit: BoxFit.fill,
              ),
              Text(name)
            ],
          ),
        ),
      ),
    );
  }
}
