import 'package:flutter/material.dart';
import 'package:greenmark/features/cart/data/cart_item_model.dart';
import 'package:greenmark/features/cart/widget/cart_item.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<CartItem> cartItems = [
    CartItem(
      name: "Apple",
      image: "assets/images/apple.png",
      weight: "1kg",
      price: 4.99,
    ),
    CartItem(
      name: 'Banana',
      image: "assets/images/banana.png",
      weight: '1KG',
      price: 20.2,
    ),
  ];

  double get totalPrice {
    double total = 0;

    for (var item in cartItems) {
      total += item.price * item.quantity;
    }

    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Cart")),

      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemCount: cartItems.length,

              separatorBuilder: (context, index) => const Divider(),

              itemBuilder: (context, index) {
                final item = cartItems[index];

                return CartItemWidget(
                  item: item,

                  onAdd: () {
                    setState(() {
                      item.quantity++;
                    });
                  },

                  onRemove: () {
                    setState(() {
                      if (item.quantity > 1) {
                        item.quantity--;
                      }
                    });
                  },
                );
              },
            ),
          ),

          ElevatedButton(
            onPressed: () {},
            child: Text("Checkout \$${totalPrice.toStringAsFixed(2)}"),
          ),
        ],
      ),
    );
  }
}
