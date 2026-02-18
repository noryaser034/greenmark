import 'package:flutter/material.dart';
import 'package:greenmark/core/styles/colors.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    final favorites = [
      {
        "name": "Sprite Can",
        "size": "325ml",
        "price": "\$1.50",
        "image": "assets/images/Sprite_Can.png",
      },
      {
        "name": "Diet Coke",
        "size": "355ml",
        "price": "\$1.99",
        "image": "assets/images/DietCoke.png",
      },
      {
        "name": "Apple & Grape Juice",
        "size": "2L",
        "price": "\$16.50",
        "image": "assets/images/Apple _Grape_Juice.png",
      },
      {
        "name": "Coca Cola Can",
        "size": "325ml",
        "price": "\$4.99",
        "image": "assets/images/Coca_Cola_Can.png",
      },
      {
        "name": "Pepsi Can",
        "size": "330ml",
        "price": "\$4.99",
        "image": "assets/images/Pepsi_Can.png",
      },
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Favorites'), centerTitle: true),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: favorites.length,
              separatorBuilder: (_, _) => const Divider(),
              itemBuilder: (context, index) {
                final item = favorites[index];
                return ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 0,
                  ),
                  leading: Image.asset(
                    item["image"]!,
                    width: 50,
                    height: 50,
                    fit: BoxFit.contain,
                  ),
                  title: Text(item["name"]!),
                  subtitle: Text(item["size"]!),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        item["price"]!,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 5),
                      const Icon(Icons.arrow_forward_ios, size: 16),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  "Add All To Cart",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
