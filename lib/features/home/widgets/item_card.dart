import 'package:flutter/material.dart';
import 'package:greenmark/core/styles/colors.dart';
import 'package:greenmark/core/styles/text_style.dart';
import 'package:greenmark/features/home/data/product_model.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({super.key, required this.model});

  final ProductModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.background),
        boxShadow: [
          BoxShadow(
            color: Color(0xff555E58).withValues(alpha: .1),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 17),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: Center(child: Image.asset(model.image))),
            SizedBox(height: 10),

            Text(
              model.name,
              style: TextStyles.body.copyWith(fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 7),

            Text(
              model.weight,
              style: TextStyles.body.copyWith(color: AppColors.gray),
            ),
            SizedBox(height: 17),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$${model.price}",
                  style: TextStyles.body.copyWith(fontWeight: FontWeight.w600),
                ),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(Icons.add, color: AppColors.background),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
