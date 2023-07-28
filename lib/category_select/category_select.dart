import 'package:flutter/material.dart';
import 'package:recipe_application/category_select/category_card/category_card.dart';

class Category_select extends StatefulWidget {
  const Category_select({super.key});

  @override
  State<Category_select> createState() => AppState();
}

class AppState extends State<Category_select> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          title: const Text(
            '레시피 카테고리',
            style: TextStyle(
                fontFamily: 'Maplestory',
                fontSize: 28,
                fontWeight: FontWeight.w100,
                color: Color.fromARGB(255, 2, 155, 51)),
          ),
          toolbarHeight: 60,
          elevation: 2,
          shadowColor: const Color.fromARGB(255, 2, 155, 51),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Color.fromARGB(255, 2, 155, 51),
            ),
            onPressed: () {
              // 뒤로가기 버튼이 눌렸을 때 수행할 동작을 추가합니다.
              Navigator.pop(context);
            },
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        body: const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Category_card(
                    category: "밥",
                    img: "rice.png",
                  ),
                  Category_card(
                    category: "반찬",
                    img: "side.png",
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Category_card(
                    category: "국",
                    img: "soup.png",
                  ),
                  Category_card(
                    category: "면",
                    img: "noodle.png",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
