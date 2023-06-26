import 'package:warranty_noty/models/product.dart';

class ProductsDataProvider {
  List<Product> productsInProvider =  [
    Product(
        name: "คีย์บอร์ด Logitech G512",
        serial: "2022LZ06ELL8",
        date: DateTime.parse("2021-04-20"),
        expTime: 3,
        expType: "Year",
        insurer: "SYNNEX",),
    Product(
        name: "คีย์บอร์ด KeyChron K1",
        serial: "2022RBCD087D",
        date: DateTime.parse("2022-07-20"),
        expTime: 2,
        expType: "Year",
        insurer: "SYNNEX",),
    Product(
        name: "หูฟัง Sennheiser HD560s",
        serial: "2021SF09SSD",
        date: DateTime.parse("2021-06-19"),
        expTime: 2,
        expType: "Year",
        insurer: "SYNNEX",),
    Product(
        name: "เมาส์ Logitech G PRO",
        serial: "2021LZ12EZZ8",
        date:  DateTime.parse("2021-07-20"),
        expTime: 3,
        expType: "Month",
        insurer: "SYNNEX",),
    Product(
        name: "จอมอนิเตอร์ MIS OPTIC G24",
        serial: "0038PLZ09SFGX",
        date:  DateTime.parse("2019-07-20"),
        expTime: 2,
        expType: "Day",
        insurer: "SYNNEX",),
    Product(
        name: "คีย์บอร์ด Logitech G312",
        serial: "2022LZ06ELL8",
        date: DateTime.parse("2021-01-20"),
        expTime: 3,
        expType: "Year",
        insurer: "SYNNEX",),
  ];
  // List<Product> productsInProvider = [];

  List<Product> get products => productsInProvider;

  void addProduct(Product product){
    productsInProvider.insert(0, product);
  }

  void delProduct(String delName){
    productsInProvider.removeWhere((element) => element.name == delName);
  }
}
