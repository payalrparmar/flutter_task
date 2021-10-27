import 'dart:async';
import 'dart:convert';

import 'package:flutter_task/apis.dart';
import 'package:flutter_task/model/prodoo.dart';
import 'package:flutter_task/model/sub_prod.dart';
import 'package:flutter_task/utils.dart';
import 'package:http/http.dart' as http;

class ProdBloc {
  final StreamController<Prodoo> allEnquiryController = StreamController();

  ProductBloc() {
    selectProduct();
  }

  void selectProduct() async {
    if (await Utils.checkConnection()) {
      Map<String, String> headers = Map();
      headers["Content-Type"] = 'application/json';
      final response =
          await http.get(Uri.parse(API.BASE_URL), headers: headers);
      print(response.body);

      if (response.statusCode == 200) {
        var finalRespp = jsonDecode(response.body);
        var respo = Prodoo.fromJson(finalRespp);
        allEnquiryController.sink.add(respo);
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
