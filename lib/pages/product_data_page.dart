import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/widgets/custom_button.dart';

class ProductDataPage extends StatefulWidget {
  const ProductDataPage({super.key});
  static const String id = 'ProductDataPage';

  @override
  State<ProductDataPage> createState() => _ProductDataPageState();
}

class _ProductDataPageState extends State<ProductDataPage> {
  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        // title: Text(
        //   "Details",
        //   style: TextStyle(
        //     fontWeight: FontWeight.bold,
        //     color: Colors.black,
        //   ),
        // ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: ListView(
          children: [
            Center(
              child: Image.network(
                product.image,
                scale: 3,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              product.title,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              product.description,
              style: const TextStyle(
                fontSize: 15,
                color: Colors.black54,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  alignment: Alignment.center,
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Text(
                    '\$${product.price}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                Text(
                  'Rating: ${product.rating?.rate}',
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            CustomButton(
              text: "Add to cart",
              onPressed: () {},
            ),
            const SizedBox(
              height: 25,
            )
          ],
        ),
      ),
    );
  }
}
