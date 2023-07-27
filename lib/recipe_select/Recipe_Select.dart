import 'package:flutter/material.dart';
import 'package:recipe_application/recipe_select/widgets/recipe.dart';

class Recipe_Select extends StatefulWidget {
  final String category;
  const Recipe_Select({super.key, required this.category});

  @override
  State<Recipe_Select> createState() => _AppState();
}

class _AppState extends State<Recipe_Select> {
  var searchText = '';
  var category = '';
  var items = [
    [
      "1.png",
      "김치볶음밥",
      "밥",
    ],
    [
      "2.png",
      "햄 계란밥",
      "밥",
    ],
    [
      "3.png",
      "어묵탕",
      "국",
    ],
    [
      "4.png",
      "부대찌개",
      "국",
    ],
    [
      "6.png",
      "들기름 계란 프라이",
      "반찬",
    ],
    [
      "8.png",
      "들기름 두부구이",
      "반찬",
    ],
    [
      "9.png",
      "메추리알 장조림",
      "반찬",
    ],
    [
      "11.png",
      "참치 김치찌개",
      "찌개",
    ],
    [
      "15.png",
      "카레 라면",
      "면",
    ],
    [
      "16.png",
      "고구마 스틱",
      "간식",
    ],
    [
      "18.png",
      "비지찌개",
      "찌개",
    ],
    [
      "23.png",
      "돼지고기 스테이크",
      "반찬",
    ],
    [
      "30.png",
      "들깨 칼국수",
      "면",
    ],
    [
      "31.png",
      "경양식 돈까스",
      "반찬",
    ],
    [
      "33.png",
      "감자탕",
      "국",
    ],
    [
      "34.png",
      "뒷다리살 카레",
      "밥",
    ],
    [
      "36.png",
      "오므라이스",
      "밥",
    ],
    [
      "37.png",
      "닭고기 덮밥",
      "밥",
    ],
    [
      "38.png",
      "소시지 케첩볶음",
      "반찬",
    ],
    [
      "39.png",
      "떡볶이",
      "간식",
    ],
    [
      "41.png",
      "소고기뭇국",
      "국",
    ],
    [
      "43.png",
      "소불고기",
      "반찬",
    ],
    [
      "44.png",
      "갈치조림",
      "반찬",
    ],
    [
      "46.png",
      "마파두부",
      "반찬",
    ],
    [
      "47.png",
      "고구마 맛탕",
      "간식",
    ],
    [
      "48.png",
      "닭 볶음탕",
      "국",
    ],
  ];
  List<List<String>> getFilteredItems() {
    print(items[1][2]);
    if (searchText.isEmpty) {
      return items.where((item) => (item[2] == category)).toList();
    } else {
      return items
          .where(
              (item) => (item[1].contains(searchText) && item[2] == category))
          .toList();
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    category = widget.category;
    var filteredItems = getFilteredItems();
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          toolbarHeight: 60,
          elevation: 2,
          shadowColor: const Color.fromARGB(255, 2, 155, 51),
          title: const Text(
            '요리 레시피',
            style: TextStyle(
                fontFamily: 'Maplestory',
                fontSize: 28,
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
                      fontFamily: 'Maplestory',
                      color: Color.fromARGB(255, 187, 196, 187),
                    ),
                    floatingLabelStyle: TextStyle(
                      fontFamily: 'Maplestory',
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
