import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:todoapp/core/model/product.dart';

class ApiService {
  String _baseUrl;

  ApiService _instance = ApiService._privateContructor();
  ApiService._privateContructor() {
    _baseUrl = "https://flutter-todo-e70fb-default-rtdb.firebaseio.com/";
  }

  ApiService getInstance() {
    if (_instance == null) {
      return ApiService._privateContructor();
    }
    return _instance;
  }

  Future<List<Product>> getProducts() async {
    final response = await http.get("$_baseUrl/product.json");
    final jsonResponse = json.decode(response.body);

    switch (response.statusCode) {
      case HttpStatus.ok:
        final productList = ProductList.fromJsonList(jsonResponse);
        return productList.products;
        break;
      case HttpStatus.unauthorized:
        print("error");
        break;
    }
    return Future.error(jsonResponse);
  }
}
