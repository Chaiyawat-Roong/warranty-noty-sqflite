import 'package:warranty_noty/models/product.dart';

class ProductsDataProvider {
  final List<Product> _products = [
    Product(
        name: "คีย์บอร์ด Logitech G512",
        serial: "2022LZ06ELL8",
        date: DateTime.parse("2022-07-20"),
        expDate: DateTime.parse("2025-07-20"),
        expTime: 3,
        expType: "Year",
        insurer: "SYNNEX",
        isExp: false),
    Product(
        name: "คีย์บอร์ด KeyChron K1",
        serial: "2022RBCD087D",
        date: DateTime.parse("2022-07-20"),
        expDate: DateTime.parse("2024-07-20"),
        expTime: 2,
        expType: "Year",
        insurer: "SYNNEX",
        isExp: false),
    Product(
        name: "หูฟัง Sennheiser HD560s",
        serial: "2021SF09SSD",
        date: DateTime.parse("2021-06-19"),
        expDate: DateTime.parse("2023-06-19"),
        expTime: 2,
        expType: "Year",
        insurer: "SYNNEX",
        isExp: false),
    Product(
        name: "เมาส์ Logitech G PRO",
        serial: "2021LZ12EZZ8",
        date:  DateTime.parse("2021-07-20"),
        expDate: DateTime.parse("2021-10-20"),
        expTime: 3,
        expType: "Month",
        insurer: "SYNNEX",
        isExp: true),
    Product(
        name: "จอมอนิเตอร์ MIS OPTIC G24",
        serial: "0038PLZ09SFGX",
        date:  DateTime.parse("2019-07-20"),
        expDate: DateTime.parse("2019-07-22"),
        expTime: 2,
        expType: "Day",
        insurer: "SYNNEX",
        isExp: true),
  ];

  List<Product> get products => _products;
}
