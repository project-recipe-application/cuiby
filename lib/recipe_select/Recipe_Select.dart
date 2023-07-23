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
      "점프하는 커비 볶음",
    ],
    [
      "log.gif",
      "통나무드는 커비 찌개",
    ],
    [
      "jump copy.gif",
      "점프하는 커비 볶음",
    ],
    [
      "log copy.gif",
      "통나무드는 커비 찌개",
    ],
    [
      "jump copy 2.gif",
      "점프하는 커비 볶음",
    ],
    [
      "log copy 2.gif",
      "통나무드는 커비 찌개",
    ],
    [
      "jump copy 3.gif",
      "점프하는 커비 볶음",
    ],
    [
      "log copy 3.gif",
      "통나무드는 커비 찌개",
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
        backgroundColor: const Color(0XFFFFDEFB),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color(0XFFFFDEFB),
          title: const Text(
            '커비 레시피',
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
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
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '레시피 검색',
                  ),
                  onChanged: (text) {
                    setState(() {
                      searchText = text;
                      filteredItems = getFilteredItems();
                    });
                  },
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
