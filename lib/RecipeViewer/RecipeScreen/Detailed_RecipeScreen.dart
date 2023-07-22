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
        centerTitle: true,
        title: Text(
          recipeName,
          style: const TextStyle(),
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
              Image.network(thumb),
              Text(
                recipeName,
                style: const TextStyle(),
              )
            ],
          ),
        ],
      ),
    );
  }
}
