import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:store_app/helper/api.dart';
import 'package:store_app/helper/constant.dart';
import 'package:store_app/models/product_model.dart';

class GetCategoryService {
  Future<List<ProductModel>> getCategory({
    required String categoryName,
  }) async {
    try {
      http.Response response =
          await API().get(url: '$kBaseURL/products/category/$categoryName');
      List<dynamic> json = jsonDecode(response.body);
      List<ProductModel> products = [];
      for (var i = 0; i < json.length; i++) {
        products.add(
          ProductModel.fromJson(
            json[i],
          ),
        );
      }
      return products;
    } catch (e) {
      log('GetCategoryService $e');
      return [];
    }
  }
}
