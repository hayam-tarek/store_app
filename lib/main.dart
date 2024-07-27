import 'package:flutter/material.dart';
import 'package:store_app/pages/bottom_navigation_bar_page.dart';
import 'package:store_app/pages/cart_shopping_page.dart';
import 'package:store_app/pages/favo_page.dart';
import 'package:store_app/pages/home_page.dart';
import 'package:store_app/pages/new_home_page.dart';
import 'package:store_app/pages/product_data_page.dart';
import 'package:store_app/pages/profile_page.dart';
import 'package:store_app/pages/update_product_page.dart';

void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'PoetsenOne',
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        HomePage.id: (context) => const HomePage(),
        UpdateProductPage.id: (context) => const UpdateProductPage(),
        ProductDataPage.id: (context) => const ProductDataPage(),
        // CategoryPage.id: (context) => CategoryPage(),
        NewHomePage.id: (context) => NewHomePage(),
        FavePage.id: (context) => const FavePage(),
        ProfilePage.id: (context) => const ProfilePage(),
        CartShoppingPage.id: (context) => const CartShoppingPage(),
        BottomNavigationBarPage.id: (context) =>
            const BottomNavigationBarPage(),
      },
      initialRoute: BottomNavigationBarPage.id,
    );
  }
}
