import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:warranty_noty/models/product.dart';
import 'package:http/http.dart' as http;
import 'package:warranty_noty/models/response.dart';

class ProductsDataProvider {
  List<Product> productsInProvider = [];

  List<Product> get products => productsInProvider;

  Future<bool> fetchAllData() async {
      var url = Uri.parse('http://10.0.2.2:3000/product/');
      var response = await http.get(url, headers: {'Authorization': "Bearer ${dotenv.env['SECRET_KEY']!}"});
      if(response.statusCode == 200){
        ResponseData res = ResponseData.fromJson(jsonDecode(response.body));
        List<Product> products = [];
        for (Product item in res.data!) {
          products.add(item);
        }
        productsInProvider = products;
        return true;
      }else{
        return false;
      }
  }

  Future<bool> addProduct(Product product) async {
      var url = Uri.parse('http://10.0.2.2:3000/product/');
      var response = await http.post(url, body: jsonEncode(product.toJson()),headers: {'Content-Type': 'application/json', 'Authorization': "Bearer ${dotenv.env['SECRET_KEY']!}"});
      if(response.statusCode == 200){
        return true;
      }else{
        return false;
      }
  }

  Future<bool> updateProduct(Product product) async {
      var url = Uri.parse('http://10.0.2.2:3000/product/');
      var response = await http.put(url, body: jsonEncode(product.toJson()), headers: {'Content-Type': 'application/json', 'Authorization': "Bearer ${dotenv.env['SECRET_KEY']!}"});
      if(response.statusCode == 200){
        return true;
      }else{
        return false;
      }
  }

  Future<bool> delProduct(String delId) async {
      var url = Uri.parse('http://10.0.2.2:3000/product/$delId');
      var response = await http.delete(url, headers: {'Content-Type': 'application/json', 'Authorization': "Bearer ${dotenv.env['SECRET_KEY']!}"});
      if(response.statusCode == 200){
        return true;
      }else{
        return false;
      }
  }
}
