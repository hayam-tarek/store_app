import 'package:flutter/material.dart';
import 'package:store_app/pages/category_page.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.category,
  });

  final String category;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryPage(
              category: category,
            ),
          ),
        );
      },
      child: Container(
        alignment: Alignment.center,
        width: 150,
        height: 80,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(
            15,
          ),
        ),
        child: Text(
          category,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 17.5,
          ),
        ),
      ),
    );
  }
}
