import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/services/add_product_service.dart';
import 'package:store_app/widgets/custom_button.dart';
import 'package:store_app/widgets/custom_text_field.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});
  static const id = "AddProductPage";

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  GlobalKey<FormState> formKey = GlobalKey();

  String? title;

  String? description;

  String? price;

  String? image;

  String? category;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
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
            "Add Product",
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
                        label: 'title',
                        hintText: 'title',
                        onChanged: (value) {
                          title = value;
                        },
                      ),
                      CustomTextField(
                        label: 'price',
                        hintText: 'price',
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          price = value;
                        },
                      ),
                      CustomTextField(
                        label: 'description',
                        hintText: 'description',
                        onChanged: (value) {
                          description = value;
                        },
                      ),
                      CustomTextField(
                        label: 'image',
                        hintText: 'image',
                        onChanged: (value) {
                          image = value;
                        },
                      ),
                      CustomTextField(
                        label: 'category',
                        hintText: 'category',
                        onChanged: (value) {
                          category = value;
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                CustomButton(
                  text: "Add",
                  onPressed: () async {
                    setState(() {
                      isLoading = true;
                    });
                    // formKey.currentState!.validate();
                    try {
                      if (formKey.currentState!.validate()) {
                        await AddProductService().addProduct(
                          title: title!,
                          price: price!,
                          description: description!,
                          image: image!,
                          category: category!,
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
                                Text(' Add done successfully'),
                              ],
                            ),
                          ),
                        );
                        Navigator.of(context).pop();
                      }
                    } catch (e) {
                      log('AddProductPage $e');
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
