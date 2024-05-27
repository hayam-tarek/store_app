import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/pages/product_data_page.dart';
import 'package:store_app/pages/update_product_page.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({
    super.key,
    required this.productModel,
  });
  final ProductModel productModel;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool fave = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        InkWell(
          onTap: () {
            Navigator.pushNamed(
              context,
              ProductDataPage.id,
              arguments: widget.productModel,
            );
          },
          child: Card(
            elevation: 7.5,
            color: Colors.white,
            shadowColor: Colors.grey,
            surfaceTintColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                5,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SizedBox(
                    height: 30,
                    width: 10,
                  ),
                  Text(
                    widget.productModel.title,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 17,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${widget.productModel.price}',
                        style: const TextStyle(
                          color: Colors.green,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            fave = !fave;
                          });
                        },
                        icon: Icon(
                          !fave
                              ? Icons.favorite_border_rounded
                              : Icons.favorite_rounded,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          right: 25,
          top: -30,
          child: Image.network(
            widget.productModel.image,
            height: 75,
            width: 75,
          ),
        ),
        Positioned(
            child: IconButton(
          onPressed: () {
            Navigator.pushNamed(
              context,
              UpdateProductPage.id,
              arguments: widget.productModel,
            );
          },
          icon: const Icon(
            FontAwesomeIcons.penToSquare,
            size: 20,
          ),
        ))
      ],
    );
  }
}
