import 'package:flutter/material.dart';
import 'package:recipe_application/recipe_select/Recipe_Select.dart';

class Category_card extends StatelessWidget {
  final String category;
  final String img;
  const Category_card({super.key, required this.category, required this.img});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Recipe_Select(
              category: category,
            ),
            fullscreenDialog: true,
          ),
        );
      },
      child: Container(
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
              offset: const Offset(7, 7),
              color: Colors.black.withOpacity(0.2),
            ),
          ],
        ),
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Image(
                width: 150,
                height: 150,
                image: AssetImage('assets/images/$img')),
            Text(
              category,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontFamily: 'Maplestory',
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 22,
                  fontWeight: FontWeight.w100),
            ),
          ],
        ),
      ),
    );
  }
}
