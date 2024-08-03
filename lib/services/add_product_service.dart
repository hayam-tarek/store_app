import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:store_app/helper/api.dart';
import 'package:store_app/helper/constant.dart';
import 'package:store_app/models/product_model.dart';

class AddProductService {
  Future<ProductModel?> addProduct({
    required String title,
    required String price,
    required String description,
    required String image,
    required String category,
  }) async {
    try {
      http.Response response = await API().post(
        url: '$kBaseURL/products',
        body: {
          'title': title,
          'price': price,
          'description': description,
          'image': image,
          'category': category,
        },
      );
      Map<String, dynamic> product = jsonDecode(response.body);
      return ProductModel.fromJson(product);
    } catch (e) {
      log('AddProductService $e');
      return null;
    }
  }
}
