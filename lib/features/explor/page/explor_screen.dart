import 'package:flutter/material.dart';
import 'package:greenmark/core/widgets/custom_text_form_field.dart';
import 'package:greenmark/features/explor/data/categories.dart';
import 'package:greenmark/features/explor/widget/category_grid.dart';

class ExplorScreen extends StatefulWidget {
  const ExplorScreen({super.key});

  @override
  State<ExplorScreen> createState() => _ExplorScreenState();
}

class _ExplorScreenState extends State<ExplorScreen> {
  final FocusNode focusNode = FocusNode();
  String searchKey = '';

  @override
  void initState() {
    super.initState();
    focusNode.requestFocus();
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  List<CategoryModel> getCategoryByName(String searchKey) {
    if (searchKey.isEmpty) return categories;

    return categories.where((categories) {
      return categories.name.toLowerCase().contains(searchKey.toLowerCase());
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        surfaceTintColor: Colors.transparent,
        title: Hero(
          tag: 'search',
          child: Material(
            color: Colors.transparent,
            child: CustomTextFormField(
              prefixIcon: const Icon(Icons.search),
              hintText: 'Search Category',
              focusNode: focusNode,
              onChange: (value) {
                setState(() {
                  searchKey = value;
                });
              },
            ),
          ),
        ),
      ),
      body: CategoryGridView(categories: getCategoryByName(searchKey)),
    );
  }
}
