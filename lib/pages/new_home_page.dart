import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/pages/cart_shopping_page.dart';
import 'package:store_app/widgets/display_all_categories.dart';
import 'package:store_app/widgets/display_products.dart';

class NewHomePage extends StatefulWidget {
  NewHomePage({super.key});
  static const id = 'NewHomePage';
  int currentIndex = 1;

  @override
  State<NewHomePage> createState() => _NewHomePageState();
}

class _NewHomePageState extends State<NewHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
          selectedIconTheme: const IconThemeData(size: 35),
          selectedItemColor: Colors.green,
          selectedFontSize: 15,
          iconSize: 30,
          unselectedFontSize: 10,
          unselectedItemColor: Colors.white,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          onTap: (value) {
            setState(() {
              widget.currentIndex = value;
              // if (widget.currentIndex == 0) {
              //   Navigator.pushNamed(context, FavePage.id);
              // }
              // if (widget.currentIndex == 2) {
              //   Navigator.pushNamed(context, ProfilePage.id);
              // }
              // widget.currentIndex = 1;
            });
          },
          currentIndex: widget.currentIndex,
          items: const [
            BottomNavigationBarItem(
                label: "Favorite", icon: Icon(Icons.favorite_rounded)),
            BottomNavigationBarItem(
                label: "Home", icon: Icon(Icons.home_rounded)),
            BottomNavigationBarItem(
                label: "Profile", icon: Icon(Icons.person_2)),
          ]),
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
      body: CustomScrollView(
        scrollDirection: Axis.vertical,
        slivers: [
          const SliverToBoxAdapter(
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
          const SliverToBoxAdapter(
            child: DisplayAllCategories(),
          ),
          const SliverToBoxAdapter(
            child: Divider(
              indent: 10,
              endIndent: 10,
            ),
          ),
          const SliverToBoxAdapter(
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
