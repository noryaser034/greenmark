import 'package:flutter/material.dart';
import 'package:greenmark/features/explor/data/categories.dart';

class FreashFruits extends StatelessWidget {
  const FreashFruits({super.key, required this.model});
  final CategoryModel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(model.name)),
      body: Center(child: Image.asset(model.image)),
    );
  }
}
