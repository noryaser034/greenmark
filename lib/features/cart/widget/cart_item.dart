import 'package:flutter/material.dart';
import 'package:greenmark/features/cart/data/cart_item_model.dart';
import 'package:greenmark/features/cart/widget/quantity.dart';

class CartItemWidget extends StatelessWidget {
  final CartItem item;
  final VoidCallback onAdd;
  final VoidCallback onRemove;

  const CartItemWidget({
    super.key,
    required this.item,
    required this.onAdd,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFFF7F8FA),
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),

      child: Padding(
        padding: const EdgeInsets.all(12),

        child: Row(
          children: [
            Image.asset(item.image, width: 50, height: 50, fit: BoxFit.cover),

            const SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    item.weight,
                    style: const TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                ],
              ),
            ),

            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                QuantityButton(
                  icon: Icons.remove_circle_outline,
                  onPressed: onRemove,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: Text("${item.quantity}"),
                ),

                QuantityButton(
                  icon: Icons.add_circle_outline,
                  onPressed: onAdd,
                ),

                const SizedBox(width: 10),

                Text(
                  "\$${(item.price * item.quantity).toStringAsFixed(2)}",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
