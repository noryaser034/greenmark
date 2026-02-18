import 'package:flutter/material.dart';
import 'package:greenmark/core/functions/navigations.dart';
import 'package:greenmark/features/explor/data/categories.dart';
import 'package:greenmark/features/explor/page/freash_fruits.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.model});

  final CategoryModel model;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        pushTo(context, FreashFruits(model: model));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        decoration: BoxDecoration(
          color: model.backgroundColor,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: model.borderColor ?? Colors.transparent),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: Image.asset(model.image, fit: BoxFit.contain)),
            const SizedBox(height: 12),
            Text(
              model.name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xFF181725),
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
