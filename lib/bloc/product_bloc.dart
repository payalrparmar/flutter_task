import 'dart:async';
import 'dart:convert';

import 'package:flutter_task/apis.dart';
import 'package:flutter_task/model/categories.dart';
import 'package:flutter_task/model/product_details_response.dart';
import 'package:flutter_task/model/products.dart';
import 'package:flutter_task/model/sub_prod.dart';
import 'package:flutter_task/utils.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ProductBloc {
  final StreamController<ProductDetailsResponse> allEnquiryController =
      StreamController();

  ProductBloc() {
    getAllProduct();
  }

  void getAllProduct() async {
    if (await Utils.checkConnection()) {
      Map<String, String> headers = Map();
      headers["Content-Type"] = 'application/json';
      final response =
          await http.get(Uri.parse(API.BASE_URL), headers: headers);
      print(response.body);

      if (response.statusCode == 200) {
        var finalResp = jsonDecode(response.body);
        var resp = ProductDetailsResponse.fromJson(finalResp);
        allEnquiryController.sink.add(resp);
      } else {
        print('some went wrong');
      }
    } else {
      print('No connection');
    }
  }

  void dispose() {
    allEnquiryController.close();
  }
}
