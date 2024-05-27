import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:store_app/helper/api.dart';
import 'package:store_app/helper/constant.dart';

class GetAllCategories {
  Future<List<dynamic>> getAllCategories() async {
    try {
      http.Response response =
          await API().get(url: '$kBaseURL/products/categories');
      List<dynamic> categories = jsonDecode(response.body);
      return categories;
    } catch (e) {
      log('GetAllCategoriesService $e');
      return [];
    }
  }
}
