import 'package:flutter/material.dart';

class Ingredient_Chooser extends StatefulWidget {
  const Ingredient_Chooser({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Ingredient_Chooser> {
  String searchText = '';

  List<String> items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
    'Item 6',
    'Item 7',
    'Item 8',
    'Item 9',
    'Item 10',
    'Item 11',
    'Item 12',
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
          title: const Text('재료 검색'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              // 뒤로가기 버튼이 눌렸을 때 수행할 동작을 추가합니다.
              Navigator.pop(context);
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: const InputDecoration(
                        labelText: '재료를 입력해주세요',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        setState(() {
                          searchText = value;
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {},
                    style:
                        ElevatedButton.styleFrom(fixedSize: const Size(1, 55)),
                    child: const Icon(Icons.menu),
                  )
                ],
              ),
              const SizedBox(height: 10),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
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
                              child: Image.asset(
                                imagePaths[ind], // 여기에 이미지 파일의 경로를 지정해주세요.
                                fit: BoxFit.fill,
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
                                  alignment: const Alignment(1, 1),
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
                                child: Checkbox(
                                    value: isSelected,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        toggleSelection(items[index]);
                                      });
                                    }))
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => 11,
                child: const Text("레시피 찾기!"),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
