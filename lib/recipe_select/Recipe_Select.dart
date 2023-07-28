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
      "5.png",
      "오징어뭇국",
      "국",
    ],
    [
      "6.png",
      "들기름 달걀프라이",
      "반찬",
    ],
    [
      "7.png",
      "꽃게 해장국",
      "국",
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
      "10.png",
      "도토리묵사발",
      "국",
    ],
    [
      "11.png",
      "참치 김치찌개",
      "국",
    ],
    [
      "12.png",
      "맑은 미역국",
      "국",
    ],
    [
      "13.png",
      "차돌된장찌개",
      "국",
    ],
    [
      "14.png",
      "콩나물국",
      "국",
    ],
    [
      "15.png",
      "카레 라면",
      "면",
    ],
    [
      "16.png",
      "고구마 스틱",
      "반찬",
    ],
    [
      "17.png",
      "홍합밥",
      "밥",
    ],
    [
      "18.png",
      "비지찌개",
      "국",
    ],
    [
      "19.png",
      "라볶이",
      "면",
    ],
    [
      "20.png",
      "단무지무침",
      "반찬",
    ],
    [
      "21.png",
      "고추장찌개",
      "국",
    ],
    [
      "22.png",
      "전복구이",
      "반찬",
    ],
    [
      "23.png",
      "돼지고기 스테이크",
      "반찬",
    ],
    [
      "24.png",
      "사골북엇국",
      "국",
    ],
    [
      "25.png",
      "감자조림",
      "반찬",
    ],
    [
      "26.png",
      "닭개장",
      "국",
    ],
    [
      "27.png",
      "콩국수",
      "면",
    ],
    [
      "28.png",
      "순대볶음",
      "반찬",
    ],
    [
      "29.png",
      "깻잎무침",
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
      "32.png",
      "콩나물찜",
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
      "35.png",
      "대파제육볶음",
      "반찬",
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
      "반찬",
    ],
    [
      "40.png",
      "김치전",
      "반찬",
    ],
    [
      "41.png",
      "소고기뭇국",
      "국",
    ],
    [
      "42.png",
      "콩나물불고기",
      "반찬",
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
      "45.png",
      "진미채 볶음",
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
      "반찬",
    ],
    [
      "48.png",
      "닭 볶음탕",
      "국",
    ],
  ];
  List<List<String>> getFilteredItems() {
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
                  style: const TextStyle(
                    fontFamily: 'Maplestory',
                  ),
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
