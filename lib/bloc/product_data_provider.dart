import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:warranty_noty/models/product.dart';
import 'package:http/http.dart' as http;
import 'package:warranty_noty/models/response.dart';

class ProductsDataProvider {
  // List<Product> productsInProvider = [
  //   Product(
  //     id: "1",
  //     name: "คีย์บอร์ด Logitech G512",
  //     serial: "2022LZ06ELL8",
  //     date: DateTime.parse("2021-04-20"),
  //     expTime: 3,
  //     expType: "Year",
  //     insurer: "SYNNEX",
  //   ),
  //   Product(
  //     id: "2",
  //     name: "คีย์บอร์ด KeyChron K1",
  //     serial: "2022RBCD087D",
  //     date: DateTime.parse("2022-07-20"),
  //     expTime: 2,
  //     expType: "Year",
  //     insurer: "SYNNEX",
  //   ),
  //   Product(
  //     id: "3",
  //     name: "หูฟัง Sennheiser HD560s",
  //     serial: "2021SF09SSD",
  //     date: DateTime.parse("2021-06-19"),
  //     expTime: 2,
  //     expType: "Year",
  //     insurer: "SYNNEX",
  //   ),
  //   Product(
  //     id: "4",
  //     name: "เมาส์ Logitech G PRO",
  //     serial: "2021LZ12EZZ8",
  //     date: DateTime.parse("2021-07-20"),
  //     expTime: 3,
  //     expType: "Month",
  //     insurer: "SYNNEX",
  //   ),
  //   Product(
  //     id: "5",
  //     name: "จอมอนิเตอร์ MIS OPTIC G24",
  //     serial: "0038PLZ09SFGX",
  //     date: DateTime.parse("2019-07-20"),
  //     expTime: 2,
  //     expType: "Day",
  //     insurer: "SYNNEX",
  //   ),
  //   Product(
  //     id: "6",
  //     name: "คีย์บอร์ด Logitech G312",
  //     serial: "2022LZ06ELL8",
  //     date: DateTime.parse("2021-01-20"),
  //     expTime: 3,
  //     expType: "Year",
  //     insurer: "SYNNEX",
  //   ),
  // ];
  List<Product> productsInProvider = [];

  List<Product> get products => productsInProvider;

  Future<void> fetchAllData() async {
    var url = Uri.parse('http://10.0.2.2:3000/product/');
    try {
      var response = await http.get(url, headers: {'Authorization': "Bearer ${dotenv.env['SECRET_KEY']!}"});
      // print('Response status: ${response.statusCode}');
      print('Response body: ${jsonDecode(response.body)['data'][0]}');
      ResponseData res = ResponseData.fromJson(jsonDecode(response.body));
      print(res);
      List<Product> products = [];
      for (Product item in res.data!) {
        print(item.exptime);
        products.add(item);
      }
      productsInProvider = products;
    } catch (err) {
      print(err);
    }
  }

  void addProduct(Product product) async {
    print(product.toJson());
    var url = Uri.parse('http://10.0.2.2:3000/product/');
    try {
      var response = await http.post(url,
          body: jsonEncode(product.toJson()),
          headers: {'Content-Type': 'application/json', 'Authorization': "Bearer ${dotenv.env['SECRET_KEY']!}"});
      // int index =
      //     productsInProvider.indexWhere((element) => element.id == product.id);
      // productsInProvider[index] = product;
      print('Response body: ${response.body}');
    } catch (err) {
      print(err);
    }
  }

  void updateProduct(Product product) async {
    print(product.toJson());
    var url = Uri.parse('http://10.0.2.2:3000/product/');
    try {
      var response = await http.put(url,
          body: jsonEncode(product.toJson()),
          headers: {'Content-Type': 'application/json', 'Authorization': "Bearer ${dotenv.env['SECRET_KEY']!}"});
      // int index =
      //     productsInProvider.indexWhere((element) => element.id == product.id);
      // productsInProvider[index] = product;
      print('Response body: ${response.body}');
    } catch (err) {
      print(err);
    }
  }

  Future delProduct(String delId) async {
    var url = Uri.parse('http://10.0.2.2:3000/product/$delId');
    try {
      var response = await http.delete(url,
          headers: {'Content-Type': 'application/json', 'Authorization': "Bearer ${dotenv.env['SECRET_KEY']!}"});
      // int index =
      //     productsInProvider.indexWhere((element) => element.id == product.id);
      // productsInProvider[index] = product;
      print('Response body: ${response.body}');
    } catch (err) {
      print(err);
    }
  }
}
