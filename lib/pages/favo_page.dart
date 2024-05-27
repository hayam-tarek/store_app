import 'package:flutter/material.dart';

class FavePage extends StatefulWidget {
  const FavePage({super.key});
  static const String id = 'FavePage';

  @override
  State<FavePage> createState() => _FavePageState();
}

class _FavePageState extends State<FavePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Favorite",
          // ignore: unnecessary_const
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
    );
  }
}
