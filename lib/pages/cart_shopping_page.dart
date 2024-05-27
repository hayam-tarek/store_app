import 'package:flutter/material.dart';

class CartShoppingPage extends StatefulWidget {
  const CartShoppingPage({super.key});
  static const String id = 'CartShoppingPage';

  @override
  State<CartShoppingPage> createState() => _CartShoppingPageState();
}

class _CartShoppingPageState extends State<CartShoppingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Cart Shopping",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
    );
  }
}
