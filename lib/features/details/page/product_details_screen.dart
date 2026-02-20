import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:greenmark/core/functions/navigations.dart';
import 'package:greenmark/core/styles/text_style.dart';
import 'package:greenmark/core/widgets/main_button.dart';
import 'package:greenmark/features/cart/screens/cart_screen.dart';
import 'package:greenmark/features/home/data/product_model.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.model});
  final ProductModel model;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  bool isFavorite = false;
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffF2F3F2),
        surfaceTintColor: Colors.transparent,

        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/icons/Vector.svg',
              width: 20,
              height: 20,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.sizeOf(context).height * .3,
              decoration: BoxDecoration(
                color: Color(0xffF2F3F2),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Hero(
                tag: widget.model.name,
                child: Image.asset(
                  widget.model.image,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.model.name, style: TextStyles.title),
                      const SizedBox(height: 4),
                      Text(
                        widget.model.weight,
                        style: TextStyles.subtitle.copyWith(
                          color: Colors.grey,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isFavorite = !isFavorite;
                      });
                    },
                    icon: Icon(
                      Icons.favorite,
                      size: 30,
                      color: isFavorite ? Colors.red : Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  // remove
                  GestureDetector(
                    onTap: () {
                      if (quantity > 1) {
                        setState(() {
                          quantity--;
                        });
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(Icons.remove, size: 30),
                    ),
                  ),

                  const SizedBox(width: 15),

                  Text(
                    quantity.toString(),
                    style: TextStyles.title.copyWith(fontSize: 20),
                  ),

                  const SizedBox(width: 15),

                  // add
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        quantity++;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(
                        Icons.add,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    widget.model.price,
                    style: TextStyles.title.copyWith(fontSize: 30),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            Divider(thickness: 2),
            ExpansionTile(
              title: Text("Description", style: TextStyles.body),
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    widget.model.description,
                    style: TextStyles.caption2,
                  ),
                ),
              ],
            ),
            Divider(thickness: 2),
            ExpansionTile(
              title: Text("Nutritions", style: TextStyles.body),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      "100gr",
                      style: TextStyles.caption1.copyWith(color: Colors.grey),
                    ),
                  ),
                  SizedBox(width: 5),
                  Icon(Icons.keyboard_arrow_down),
                ],
              ),

              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    widget.model.description,
                    style: TextStyles.caption2,
                  ),
                ),
              ],
            ),
            Divider(thickness: 2),
            ExpansionTile(
              title: Text("Review", style: TextStyles.body),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: List.generate(
                      5,
                      (index) =>
                          Icon(Icons.star, color: Colors.orange, size: 20),
                    ),
                  ),
                  SizedBox(width: 5),
                  Icon(Icons.keyboard_arrow_down),
                ],
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("User Reviews", style: TextStyles.subtitle),
                      SizedBox(height: 5),
                      Text(
                        "This product is amazing! I loved it and would recommend to everyone.",
                        style: TextStyles.caption2,
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Another review example goes here...",
                        style: TextStyles.caption2,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Divider(thickness: 2),
            Padding(
              padding: const EdgeInsets.all(15),
              child: MainButton(
                text: "Add to cart",
                onpress: () {
                  setState(() {
                    pushTo(context, CartScreen());
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
