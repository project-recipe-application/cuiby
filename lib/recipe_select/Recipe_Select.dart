import 'package:flutter/material.dart';
import 'package:recipe_application/recipe_select/widgets/recipe.dart';

class Recipe_Select extends StatefulWidget {
  const Recipe_Select({super.key});

  @override
  State<Recipe_Select> createState() => _AppState();
}

class _AppState extends State<Recipe_Select> {
  var searchText = '';
  var items = [
    [
      "jump.gif",
      "토마토 파스타",
    ],
    [
      "log.gif",
      "샐러드",
    ],
    [
      "jump copy.gif",
      "불고기",
    ],
    [
      "log copy.gif",
      "김치찌개",
    ],
    [
      "jump copy 2.gif",
      "햄버거",
    ],
    [
      "log copy 2.gif",
      "초밥",
    ],
    [
      "jump copy 3.gif",
      "김치 볶음밥",
    ],
    [
      "log copy 3.gif",
      "양상추 찜",
    ],
  ];
  List<List<String>> getFilteredItems() {
    if (searchText.isEmpty) {
      return items;
    } else {
      return items.where((item) => item[1].contains(searchText)).toList();
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var filteredItems = getFilteredItems();
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          title: const Text(
            '커비 레시피',
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w800,
                color: Color.fromARGB(255, 2, 155, 51)),
          ),
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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  cursorColor: const Color.fromARGB(255, 2, 155, 51),
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 187, 196, 187),
                        width: 2,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 2, 155, 51),
                        width: 2,
                      ),
                    ),
                    labelText: '레시피 검색',
                    labelStyle: TextStyle(
                      color: Color.fromARGB(255, 187, 196, 187),
                    ),
                    floatingLabelStyle: TextStyle(
                      color: Color.fromARGB(255, 2, 155, 51),
                    ),
                  ),
                  onChanged: (text) {
                    setState(() {
                      searchText = text;
                      filteredItems = getFilteredItems();
                    });
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: filteredItems.length,
                  itemBuilder: (context, index) {
                    return Recipe(
                      img: filteredItems[index][0],
                      name: filteredItems[index][1],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
