import 'package:flutter/material.dart';
import 'package:recipe_application/recipe_select/Recipe_Select.dart';
import 'package:recipe_application/ingredient_chooser/ingredient_chooser.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
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
                        builder: (context) => const Recipe_Select(),
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
}
