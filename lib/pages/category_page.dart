import 'package:flutter/material.dart';
import 'package:store_app/widgets/display_products.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({
    super.key,
    required this.category,
  });
  static const String id = 'CategoryPage';
  final String category;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          category,
        ),
      ),
      body: CustomScrollView(
        scrollDirection: Axis.vertical,
        slivers: [
          DisplayProducts(
            category: category,
          ),
        ],
      ),
    );
  }
}
