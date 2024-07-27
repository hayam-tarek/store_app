import 'package:flutter/material.dart';
import 'package:store_app/pages/favo_page.dart';
import 'package:store_app/pages/new_home_page.dart';
import 'package:store_app/pages/profile_page.dart';

class BottomNavigationBarPage extends StatefulWidget {
  const BottomNavigationBarPage({super.key});
  static const id = 'BottomNavigationBarPage';

  @override
  State<BottomNavigationBarPage> createState() =>
      _BottomNavigationBarPageState();
}

class _BottomNavigationBarPageState extends State<BottomNavigationBarPage> {
  int currentIndex = 1;
  List<Widget> screens = [
    const FavePage(),
    const NewHomePage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
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
          currentIndex: currentIndex,
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          items: const [
            BottomNavigationBarItem(
                label: "Favorite", icon: Icon(Icons.favorite_rounded)),
            BottomNavigationBarItem(
                label: "Home", icon: Icon(Icons.home_rounded)),
            BottomNavigationBarItem(
                label: "Profile", icon: Icon(Icons.person_2)),
          ]),
      body: screens[currentIndex],
    ));
  }
}
