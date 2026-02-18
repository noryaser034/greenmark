import 'package:flutter/material.dart';
import 'package:greenmark/core/styles/text_style.dart';
import 'package:greenmark/features/home/data/product_model.dart';
import 'item_card.dart';

class OfferBuilder extends StatelessWidget {
  const OfferBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Exclusive Offer", style: TextStyles.title),
            TextButton(
              onPressed: () {},
              child: Text("see All", style: TextStyles.caption1),
            ),
          ],
        ),
        SizedBox(height: 10),
        SizedBox(
          height: 255,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              var model = offers[index];
              return ItemCard(model: model);
            },

            separatorBuilder: (context, index) => const SizedBox(width: 10),
            itemCount: offers.length,
          ),
        ),
      ],
    );
  }
}
