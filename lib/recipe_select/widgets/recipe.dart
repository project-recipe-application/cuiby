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
              thumb: "assets/images/recipe/$img",
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
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              offset: const Offset(5, 5),
              color: Colors.black.withOpacity(0.2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(
                "assets/images/recipe/$img",
                width: 100,
                height: 100,
                fit: BoxFit.fill,
              ),
              Text(
                "$name\n레시피 보러가기",
                style: const TextStyle(
                  fontFamily: 'Maplestory',
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
