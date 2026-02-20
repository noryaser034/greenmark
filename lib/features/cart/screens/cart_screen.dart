import 'package:flutter/material.dart';
import 'package:greenmark/core/styles/text_style.dart';
import 'package:greenmark/core/widgets/main_button.dart';
import 'package:greenmark/features/cart/data/cart_item_model.dart';
import 'package:greenmark/features/cart/screens/order_screen.dart';
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

  void _showCheckoutSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Checkout", style: TextStyles.title),
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.close, size: 24),
                      ),
                    ],
                  ),
                ),
                const Divider(thickness: 2),
                _buildExpansionTile("Delivery", "Select Method"),
                const Divider(thickness: 2),
                _buildExpansionTile(
                  "Payment",
                  "Pay Method",
                  icon: Icons.payment,
                ),
                const Divider(thickness: 2),
                _buildExpansionTile("Promo Code", "Pick discount"),
                const Divider(thickness: 2),
                _buildExpansionTile(
                  "Total Cost",
                  "\$${totalPrice.toStringAsFixed(2)}",
                ),
                const Divider(thickness: 2),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "By placing an order you agree to our Terms And Conditions",
                    style: TextStyles.subtitle,
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 20,
                  ),
                  child: MainButton(
                    text: "Place Order",
                    onpress: () {
                      Navigator.pop(context); // يغلق الـ BottomSheet
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const OrderScreen(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildExpansionTile(String title, String content, {IconData? icon}) {
    return ExpansionTile(
      title: Text(title, style: TextStyles.subtitle),
      childrenPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(8),
          ),
          child: icon != null ? Icon(icon) : Text(content),
        ),
      ],
    );
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
                  onAdd: () => setState(() => item.quantity++),
                  onRemove: () {
                    setState(() {
                      if (item.quantity > 1) item.quantity--;
                    });
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
              ),
              onPressed: _showCheckoutSheet,
              child: Text("Checkout \$${totalPrice.toStringAsFixed(2)}"),
            ),
          ),
        ],
      ),
    );
  }
}
