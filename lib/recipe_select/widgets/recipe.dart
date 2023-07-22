import 'package:flutter/material.dart';

class Recipe extends StatelessWidget {
  final String img, name;
  const Recipe({super.key, required this.img, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
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
    );
  }
}
