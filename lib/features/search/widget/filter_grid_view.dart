import 'package:flutter/material.dart';
import 'package:greenmark/features/home/data/product_model.dart';
import 'package:greenmark/features/home/widgets/item_card.dart';

class FilterGridView extends StatelessWidget {
  const FilterGridView({super.key, required this.products});

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    if (products.isEmpty) {
      return const Center(
        child: Text("No products found", style: TextStyle(fontSize: 18)),
      );
    }

    return GridView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        mainAxisExtent: 250,
      ),
      itemBuilder: (context, index) {
        return ItemCard(model: products[index]);
      },
    );
  }
}
