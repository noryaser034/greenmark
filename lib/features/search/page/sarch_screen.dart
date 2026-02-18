import 'package:flutter/material.dart';
import 'package:greenmark/core/widgets/custom_text_form_field.dart';
import 'package:greenmark/features/home/data/product_model.dart';
import 'package:greenmark/features/search/widget/filter_grid_view.dart';

class SarchScreen extends StatefulWidget {
  const SarchScreen({super.key});

  @override
  State<SarchScreen> createState() => _SarchScreenState();
}

class _SarchScreenState extends State<SarchScreen> {
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
              hintText: 'Search Store',
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
      body: FilterGridView(products: getProductByName(searchKey)),
    );
  }
}

List<ProductModel> getProductByName(String searchKey) {
  if (searchKey.isEmpty) {
    return allproduct;
  }

  return allproduct.where((product) {
    return product.name.toLowerCase().contains(searchKey.toLowerCase());
  }).toList();
}
