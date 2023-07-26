import 'package:flutter/material.dart';

class Detailed_Recipe extends StatelessWidget {
  final String recipeName, thumb;
  const Detailed_Recipe({
    super.key,
    required this.recipeName,
    required this.thumb,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        elevation: 2,
        shadowColor: const Color.fromARGB(255, 2, 155, 51),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            size: 22,
          ),
          color: const Color.fromARGB(255, 2, 155, 51),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          recipeName,
          style: const TextStyle(
              fontFamily: 'Maplestory', color: Color.fromARGB(255, 2, 155, 51)),
        ),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              Image.asset(thumb),
              Text(
                recipeName,
                style: const TextStyle(
                  fontFamily: 'Maplestory',
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
