import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:store_app/helper/api.dart';
import 'package:store_app/helper/constant.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/models/rating_model.dart';

class UpdateProductService {
  Future<ProductModel?> updateProduct({
    required int id,
    required String title,
    required String price,
    required String description,
    required String image,
    required String category,
    required RatingModel rating,
  }) async {
    try {
      http.Response response = await API().put(
        url: '$kBaseURL/products/$id',
        body: {
          'title': title,
          'price': price,
          'description': description,
          'image': image,
          'category': category,
        },
      );
      Map<String, dynamic> product = jsonDecode(response.body);
      product.addAll({
        'rating': {'rate': rating.rate, 'count': rating.count}
      });
      return ProductModel.fromJson(product);
    } catch (e) {
      log('UpdateProductService $e');
      return null;
    }
  }
}
