import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/update_product_service.dart';
import 'package:store_app/widgets/custom_button.dart';
import 'package:store_app/widgets/custom_text_field.dart';

class UpdateProductPage extends StatefulWidget {
  const UpdateProductPage({super.key});
  static const id = "UpdateProductPage";

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  GlobalKey<FormState> formKey = GlobalKey();

  String? title;

  String? description;

  String? price;

  String? image;

  String? category;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      color: Colors.black,
      progressIndicator: const CircularProgressIndicator(
        color: Colors.green,
      ),
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            "Update Product",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 100,
                ),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        initialValue: product.title,
                        label: 'title',
                        hintText: 'title',
                        onChanged: (value) {
                          title = value;
                        },
                      ),
                      CustomTextField(
                        initialValue: product.price.toString(),
                        label: 'price',
                        hintText: 'price',
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          price = value;
                        },
                      ),
                      CustomTextField(
                        initialValue: product.description,
                        label: 'description',
                        hintText: 'description',
                        onChanged: (value) {
                          description = value;
                        },
                      ),
                      CustomTextField(
                        initialValue: product.image,
                        label: 'image',
                        hintText: 'image',
                        onChanged: (value) {
                          image = value;
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                CustomButton(
                  text: "Update",
                  onPressed: () async {
                    setState(() {
                      isLoading = true;
                    });
                    // formKey.currentState!.validate();
                    try {
                      await UpdateProductService().updateProduct(
                        id: product.id,
                        title: title ?? product.title,
                        price: price ?? product.price.toString(),
                        description: description ?? product.description,
                        image: image ?? product.image,
                        category: product.category,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Colors.black,
                          content: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.check,
                                color: Colors.green,
                              ),
                              Text(' Update done successfuly'),
                            ],
                          ),
                        ),
                      );
                      Navigator.of(context).pop();
                    } catch (e) {
                      log('UpdateProductPage $e');
                    }
                    setState(() {
                      isLoading = false;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
