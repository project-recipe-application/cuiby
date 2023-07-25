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
    '토마토',
    '양파',
    '치즈',
    '양상추',
    '오이',
    '소고기',
    '김치',
    '빵',
    '생선',
    '소스',
    '밥',
    '김',
  ];

  List<String> imagePaths = [
    'assets/images/image_1.JPG',
    'assets/images/image_2.JPG',
    'assets/images/image_3.JPG',
    'assets/images/image_4.JPG',
    'assets/images/image_5.JPG',
    'assets/images/image_6.JPG',
    'assets/images/image_7.JPG',
    'assets/images/image_8.JPG',
    'assets/images/image_9.JPG',
    'assets/images/image_10.JPG',
    'assets/images/image_11.JPG',
    'assets/images/image_12.JPG',
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

  @override
  Widget build(BuildContext context) {
    List<String> filteredItems = getFilteredItems();

    return MaterialApp(
      title: 'searching',
      home: Scaffold(
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: const Color.fromARGB(255, 255, 255, 255),
            title: const Text(
              '재료 검색',
              style: TextStyle(
                  fontSize: 22,
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
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 56,
                      child: TextField(
                        decoration: const InputDecoration(
                          hintText: '재료를 입력해주세요',
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value) {
                          setState(() {
                            searchText = value;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(1, 55),
                      backgroundColor: Colors.white,
                    ),
                    child: const Icon(
                      Icons.menu,
                      color: Color.fromARGB(255, 2, 155, 51),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
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
                            SizedBox(
                              width: double.infinity,
                              height: double.infinity,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(
                                  imagePaths[ind], // 여기에 이미지 파일의 경로를 지정해주세요.
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
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
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
                                      onChanged: (bool? value) {
                                        setState(() {
                                          toggleSelection(items[index]);
                                        });
                                      }),
                                )),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(5.0), // 원하는 테두리 반지름 값을 지정합니다.
                    side: const BorderSide(
                        color: Color.fromARGB(255, 2, 155, 51),
                        width: 1.0), // 원하는 테두리 색상과 두께 값을 지정합니다.
                  ), // 예시로 파란색을 사용합니다. 원하는 색상으로 변경 가능합니다.
                ),
                onPressed: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RecipeViewer(
                        recipes: selectedItems,
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
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
