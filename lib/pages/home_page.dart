import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/pages/add_product_page.dart';
import 'package:store_app/pages/cart_shopping_page.dart';
import 'package:store_app/widgets/display_all_categories.dart';
import 'package:store_app/widgets/display_products.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const id = 'HomePage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: const Icon(
          Icons.add_rounded,
          color: Colors.green,
          size: 35,
        ),
        onPressed: () {
          Navigator.pushNamed(context, AddProductPage.id);
        },
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "New Trend",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, CartShoppingPage.id);
            },
            icon: const Icon(
              FontAwesomeIcons.cartShopping,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: const CustomScrollView(
        scrollDirection: Axis.vertical,
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 5,
                vertical: 10,
              ),
              child: Text(
                'Categories',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: DisplayAllCategories(),
          ),
          SliverToBoxAdapter(
            child: Divider(
              indent: 10,
              endIndent: 10,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 5,
                vertical: 10,
              ),
              child: Center(
                child: Text(
                  'Popular',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ),
            ),
          ),
          DisplayProducts()
        ],
      ),
    );
  }
}
