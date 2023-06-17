import 'package:warranty_noty/models/product.dart';

class ProductsDataProvider {
  final List<Product> _products = [
    Product(
        name: "คีย์บอร์ด Logitech G512",
        serial: "2022LZ06ELL8",
        date: DateTime.parse("2022-07-20"),
        expTime: 3,
        expType: "Year",
        insurer: "SYNNEX"),
    Product(
        name: "เมาส์ Logitech G PRO",
        serial: "2021LZ12EZZ8",
        date:  DateTime.parse("2021-07-20"),
        expTime: 3,
        expType: "Month",
        insurer: "SYNNEX"),
    Product(
        name: "จอมอนิเตอร์ MIS OPTIC G24",
        serial: "0038PLZ09SFGX",
        date:  DateTime.parse("2019-07-20"),
        expTime: 2,
        expType: "Day",
        insurer: "SYNNEX"),
  ];

  List<Product> get products => _products;
}
