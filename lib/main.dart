import 'package:flutter/material.dart';
import 'package:recipe_app/home_screen/home_screen.dart';
import 'RecipeScreen/Recipe_Viewer.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: homeScreen(),
    );
  }
}
