import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/recipe.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
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
          backgroundColor: const Color(0XFFFFDEFB),
          title: const Text(
            '커비 레시피',
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
