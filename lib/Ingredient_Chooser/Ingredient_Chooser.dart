import 'package:flutter/material.dart';
import 'package:recipe_application/RecipeScreen/Recipe_Viewer.dart';

class IngredientChooser extends StatefulWidget {
  const IngredientChooser({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<IngredientChooser> {
  String searchText = '';

  List<String> items = [
    '칼국수면',
    '케첩',
    '콩나물',
    '콩비지',
    '통깨',
    '통마늘',
    '파슬리가루',
    '파프리카',
    '표고버섯',
    '홍고추',
    '홍합살',
    '후추',
    '훈연멸치가루',
    'MSG',
    '각얼음',
    '간마늘',
    '간생강',
    '갈치',
    '감자',
    '고구마',
    '고운 고추가루',
    '고추장',
    '국간장',
    '굵은 고추가루',
    '김가루',
    '김치',
    '깨소금',
    '깻잎',
    '꽃게',
    '꽃소금',
    '꽈리고추',
    '느타리버섯',
    '다시마',
    '단무지',
    '달걀',
    '닭가슴살',
    '닭고기',
    '닭다리살',
    '당근',
    '대파',
    '대패삼겹살',
    '도토리묵',
    '돼지고기',
    '된장',
    '두부',
    '들기름',
    '들깨가루',
    '땅콩버터',
    '떡국',
    '라면',
    '마요네즈',
    '맛소금',
    '맛술',
    '메추리알',
    '멸치액젓',
    '무',
    '물',
    '물엿',
    '미림',
    '미역',
    '밀가루',
    '밀가루떡',
    '밥',
    '방울토마토',
    '버터',
    '베이크드 빈스',
    '부추',
    '부침가루',
    '북어채',
    '비엔나 소시지',
    '빵가루',
    '사골국물',
    '삼겹살',
    '새우젓',
    '설탕',
    '소고기 다시다',
    '소고기',
    '소면',
    '소시지',
    '숙주',
    '순대',
    '식용유',
    '식초',
    '쌀',
    '쌀떡',
    '애호박',
    '양념장',
    '양배추',
    '양파',
    '어묵',
    '연근',
    '오이',
    '오징어',
    '오징어채',
    '우스터 소스',
    '전복',
    '전분가루',
    '주키니호박',
    '진간장',
    '차돌박이',
    '참기름',
    '참치캔',
    '청양고추',
    '체다슬라이스 치즈',
    '카레',
  ];

  List<String> imagePaths = [
    'assets/images/item (1).png',
    'assets/images/item (2).png',
    'assets/images/item (3).png',
    'assets/images/item (4).png',
    'assets/images/item (5).png',
    'assets/images/item (6).png',
    'assets/images/item (7).png',
    'assets/images/item (8).png',
    'assets/images/item (9).png',
    'assets/images/item (10).png',
    'assets/images/item (11).png',
    'assets/images/item (12).png',
    'assets/images/item (13).png',
    'assets/images/item (14).png',
    'assets/images/item (15).png',
    'assets/images/item (16).png',
    'assets/images/item (17).png',
    'assets/images/item (18).png',
    'assets/images/item (19).png',
    'assets/images/item (20).png',
    'assets/images/item (21).png',
    'assets/images/item (22).png',
    'assets/images/item (23).png',
    'assets/images/item (24).png',
    'assets/images/item (25).png',
    'assets/images/item (26).png',
    'assets/images/item (27).png',
    'assets/images/item (28).png',
    'assets/images/item (29).png',
    'assets/images/item (30).png',
    'assets/images/item (31).png',
    'assets/images/item (32).png',
    'assets/images/item (33).png',
    'assets/images/item (34).png',
    'assets/images/item (35).png',
    'assets/images/item (36).png',
    'assets/images/item (37).png',
    'assets/images/item (38).png',
    'assets/images/item (39).png',
    'assets/images/item (40).png',
    'assets/images/item (41).png',
    'assets/images/item (42).png',
    'assets/images/item (43).png',
    'assets/images/item (44).png',
    'assets/images/item (45).png',
    'assets/images/item (46).png',
    'assets/images/item (47).png',
    'assets/images/item (48).png',
    'assets/images/item (49).png',
    'assets/images/item (50).png',
    'assets/images/item (51).png',
    'assets/images/item (52).png',
    'assets/images/item (53).png',
    'assets/images/item (54).png',
    'assets/images/item (55).png',
    'assets/images/item (56).png',
    'assets/images/item (57).png',
    'assets/images/item (58).png',
    'assets/images/item (59).png',
    'assets/images/item (60).png',
    'assets/images/item (61).png',
    'assets/images/item (62).png',
    'assets/images/item (63).png',
    'assets/images/item (64).png',
    'assets/images/item (65).png',
    'assets/images/item (66).png',
    'assets/images/item (67).png',
    'assets/images/item (68).png',
    'assets/images/item (69).png',
    'assets/images/item (70).png',
    'assets/images/item (71).png',
    'assets/images/item (72).png',
    'assets/images/item (73).png',
    'assets/images/item (74).png',
    'assets/images/item (75).png',
    'assets/images/item (76).png',
    'assets/images/item (77).png',
    'assets/images/item (78).png',
    'assets/images/item (79).png',
    'assets/images/item (80).png',
    'assets/images/item (81).png',
    'assets/images/item (82).png',
    'assets/images/item (83).png',
    'assets/images/item (84).png',
    'assets/images/item (85).png',
    'assets/images/item (86).png',
    'assets/images/item (87).png',
    'assets/images/item (88).png',
    'assets/images/item (89).png',
    'assets/images/item (90).png',
    'assets/images/item (91).png',
    'assets/images/item (92).png',
    'assets/images/item (93).png',
    'assets/images/item (94).png',
    'assets/images/item (95).png',
    'assets/images/item (96).png',
    'assets/images/item (97).png',
    'assets/images/item (98).png',
    'assets/images/item (99).png',
    'assets/images/item (100).png',
    'assets/images/item (101).png',
    'assets/images/item (102).png',
    'assets/images/item (103).png',
    'assets/images/item (104).png',
    'assets/images/item (105).png',
  ];

  List<String> selectedItems = [];
  void toggleSelection(String item) {
    setState(() {
      if (selectedItems.contains(item)) {
        selectedItems.remove(item);
      } else {
        selectedItems.add(item);
      }
    });
  }

  List<String> getFilteredItems() {
    if (searchText.isEmpty) {
      return items;
    } else {
      return items
          .where(
              (item) => item.toLowerCase().contains(searchText.toLowerCase()))
          .toList();
    }
  }

  void _showSelectedItems() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    '선택한 재료',
                    style: TextStyle(
                        fontFamily: 'Maplestory',
                        fontSize: 28,
                        fontWeight: FontWeight.w800,
                        color: Color.fromARGB(255, 2, 155, 51)),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    // Use Expanded to let the ListView take available space
                    child: ListView.builder(
                      itemCount: selectedItems.length,
                      itemBuilder: (context, index) {
                        String item = selectedItems[index];
                        return ListTile(
                          title: Text(
                            item,
                            style: const TextStyle(
                              fontFamily: 'Maplestory',
                              fontSize: 15,
                              fontWeight: FontWeight.w800,
                              color: Colors.black,
                            ),
                          ),
                          trailing: IconButton(
                            icon: const Icon(Icons.close),
                            onPressed: () {
                              setState(() {
                                toggleSelection(item);
                              });
                            },
                          ),
                          // Add any other information about the item here
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        side: const BorderSide(
                            color: Color.fromARGB(255, 2, 155, 51), width: 1.0),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context); // Close the bottom sheet
                    },
                    child: const Text(
                      '닫기',
                      style: TextStyle(
                          fontFamily: 'Maplestory',
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                          color: Color.fromARGB(255, 2, 155, 51)),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    List<String> filteredItems = getFilteredItems();

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: const Color.fromARGB(255, 255, 255, 255),
            toolbarHeight: 60,
            elevation: 2,
            shadowColor: const Color.fromARGB(255, 2, 155, 51),
            title: const Text(
              '재료 검색',
              style: TextStyle(
                  fontFamily: 'Maplestory',
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  color: Color.fromARGB(255, 2, 155, 51)),
            ),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              color: const Color.fromARGB(255, 2, 155, 51),
              onPressed: () {
                Navigator.pop(context);
              },
            )),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: SizedBox(
                      width: 352,
                      height: 55,
                      child: TextField(
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
                        onChanged: (value) {
                          setState(() {
                            searchText = value;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                  ),
                  itemCount: filteredItems.length,
                  itemBuilder: (BuildContext context, int index) {
                    String item = filteredItems[index];
                    int ind = items.indexOf(item);
                    bool isSelected = selectedItems.contains(item);
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          toggleSelection(item);
                        });
                      },
                      child: Card(
                        elevation: 3,
                        shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.elliptical(20, 20)),
                        ),
                        child: Stack(
                          children: [
                            Container(
                              width: double.infinity,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color:
                                      const Color.fromARGB(255, 187, 196, 187),
                                  width: 2.0,
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(
                                  imagePaths[ind],
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Positioned.fill(
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.all(
                                      Radius.elliptical(20, 20)),
                                ),
                                child: Align(
                                  alignment: const Alignment(0, 1),
                                  child: Text(
                                    items[ind],
                                    style: const TextStyle(
                                      fontFamily: 'Maplestory',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w100,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: -7,
                              top: -7,
                              child: Transform.scale(
                                scale: 0.8,
                                child: Checkbox(
                                  value: isSelected,
                                  activeColor:
                                      const Color.fromARGB(255, 2, 155, 51),
                                  onChanged: (bool? value) {
                                    setState(() {
                                      toggleSelection(items[index]);
                                    });
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        side: const BorderSide(
                            color: Color.fromARGB(255, 2, 155, 51), width: 1.0),
                      ),
                    ),
                    onPressed: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RecipeViewer(
                            selectedIngredients: selectedItems,
                          ),
                          fullscreenDialog: true,
                        ),
                      ),
                    },
                    child: const Text(
                      "레시피 찾기!",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: Color.fromARGB(255, 2, 155, 51),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        side: const BorderSide(
                            color: Color.fromARGB(255, 2, 155, 51), width: 1.0),
                      ),
                    ),
                    onPressed: () => {
                      _showSelectedItems(),
                    },
                    child: const Text(
                      "장바구니",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: Color.fromARGB(255, 2, 155, 51),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
