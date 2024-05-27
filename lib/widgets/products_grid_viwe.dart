import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/widgets/product_card.dart';

class ProductsSliverGrid extends StatelessWidget {
  const ProductsSliverGrid({
    super.key,
    required this.products,
  });
  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        // crossAxisSpacing: 5,
        // childAspectRatio: 2 / 1.5,
      ),
      itemCount: products.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
            top: 50,
          ),
          child: ProductCard(
            productModel: products[index],
          ),
        );
      },
    );
    // return Padding(
    //   padding: const EdgeInsets.only(
    //     left: 10,
    //     right: 10,
    //     top: 50,
    //   ),
    //   child: GridView.builder(
    //     clipBehavior: Clip.none,
    //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //       crossAxisCount: 2,
    //       mainAxisSpacing: 50,
    //       crossAxisSpacing: 10,
    //       childAspectRatio: 2 / 1.5,
    //     ),
    //     itemCount: products.length,
    //     itemBuilder: (BuildContext context, int index) {
    //       return ProductCard(
    //         productModel: products[index],
    //       );
    //     },
    //   ),
    // );
  }
}
