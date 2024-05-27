import 'package:flutter/material.dart';
import 'package:store_app/services/get_all_categories_service.dart';
import 'package:store_app/widgets/categories_list.dart';

class DisplayAllCategories extends StatefulWidget {
  const DisplayAllCategories({
    super.key,
  });

  @override
  State<DisplayAllCategories> createState() => _DisplayAllCategoriesState();
}

class _DisplayAllCategoriesState extends State<DisplayAllCategories> {
  var future;
  @override
  void initState() {
    future = GetAllCategories().getAllCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return CategoriesListView(
            categories: snapshot.data!,
          );
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: LinearProgressIndicator(
              color: Colors.green,
            ),
          );
        } else {
          // log("${snapshot.data}");
          return const Center(
            child: Text(
              "No Categories",
            ),
          );
        }
      },
    );
  }
}
