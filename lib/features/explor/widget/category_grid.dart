import 'package:flutter/material.dart';
import 'package:greenmark/features/explor/data/categories.dart';
import 'package:greenmark/features/explor/widget/category_card.dart';

class CategoryGridView extends StatelessWidget {
  const CategoryGridView({super.key, required this.categories});

  final List<CategoryModel> categories;

  @override
  Widget build(BuildContext context) {
    if (categories.isEmpty) {
      return const Center(
        child: Text("No categories found", style: TextStyle(fontSize: 18)),
      );
    }

    return GridView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: categories.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        mainAxisExtent: 200,
      ),
      itemBuilder: (context, index) {
        return CategoryCard(model: categories[index]);
      },
    );
  }
}
