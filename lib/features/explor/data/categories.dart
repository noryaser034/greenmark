import 'package:flutter/material.dart';

class CategoryModel {
  final int id;
  final String name;
  final String image;
  final Color? backgroundColor;
  final Color? borderColor;

  const CategoryModel({
    required this.id,
    required this.name,
    required this.image,
    this.backgroundColor,
    this.borderColor,
  });
}

final List<CategoryModel> categories = [
  CategoryModel(
    id: 1,
    name: "Fresh Fruits & Vegetable",
    image: "assets/images/Frash_Fruits.png",
    backgroundColor: const Color(0xFF53B175).withAlpha(25),
    borderColor: const Color(0xFF53B175).withAlpha(180),
  ),
  CategoryModel(
    id: 2,
    name: "Cooking Oil & Ghee",
    image: "assets/images/Cooking_Oil.png",
    backgroundColor: const Color(0xFFF8A44C).withAlpha(25),
    borderColor: const Color(0xFFF8A44C).withAlpha(180),
  ),
  CategoryModel(
    id: 3,
    name: "Meat & Fish",
    image: "assets/images/Meat.png",
    backgroundColor: const Color(0xFFF7A593).withAlpha(25),
    borderColor: const Color(0xFFF7A593).withAlpha(180),
  ),
  CategoryModel(
    id: 4,
    name: "Bakery & Snacks",
    image: "assets/images/Bakery.png",
    backgroundColor: const Color(0xFFD3B0E0).withAlpha(25),
    borderColor: const Color(0xFFD3B0E0).withAlpha(180),
  ),
  CategoryModel(
    id: 5,
    name: "Dairy & Eggs",
    image: "assets/images/Dairy.png",
    backgroundColor: const Color(0xFFFDE598).withAlpha(25),
    borderColor: const Color(0xFFFDE598).withAlpha(180),
  ),
  CategoryModel(
    id: 6,
    name: "Beverages",
    image: "assets/images/Beverages.png",
    backgroundColor: const Color(0xFFB7DFF5).withAlpha(25),
    borderColor: const Color(0xFFB7DFF5).withAlpha(180),
  ),
];
