import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/get_all_products_service.dart';
import 'package:store_app/services/get_category_service.dart';
import 'package:store_app/widgets/products_grid_viwe.dart';

class DisplayProducts extends StatefulWidget {
  const DisplayProducts({
    super.key,
    this.category,
  });
  final String? category;

  @override
  State<DisplayProducts> createState() => _DisplayProductsState();
}

class _DisplayProductsState extends State<DisplayProducts> {
  var future;
  @override
  void initState() {
    if (widget.category != null) {
      future = GetCategoryService().getCategory(
        categoryName: widget.category!,
      );
    } else {
      future = GetAllProductsService().getAllProducts();
    }
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ProductModel>>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ProductsSliverGrid(
            products: snapshot.data!,
          );
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const SliverFillRemaining(
            child: Center(
              child: CircularProgressIndicator(
                color: Colors.green,
              ),
            ),
          );
        } else {
          // log("${snapshot.data}");
          return const SliverFillRemaining(
            child: Center(
              child: Text(
                "No Data",
              ),
            ),
          );
        }
      },
    );
  }
}
