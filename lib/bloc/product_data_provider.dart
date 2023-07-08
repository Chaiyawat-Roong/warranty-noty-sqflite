import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:warranty_noty/models/product.dart';
import 'package:warranty_noty/models/productDb.dart';

class ProductsDataProvider {
  List<Product> productsInProvider = [];
  static const String TableName = "products";

  List<Product> get products => productsInProvider;

  Future<Database> database() async{
    return await openDatabase(
      join(await getDatabasesPath(), 'products.db'),
      version: 1,
      onCreate: (db, version) async{
        await db.execute("CREATE TABLE ${TableName} (id TEXT PRIMARY KEY,name TEXT,serial TEXT,date TEXT,expTime INTEGER,expType TEXT,insurer TEXT);");
      }
      );
  }

  Future<bool> fetchAllData() async {
    try{
      Database db = await database();
      List<Map<dynamic, dynamic>> products = await db.query(TableName);
      List<ProductDB> productsDb = products.map((e) => ProductDB.fromMap(e)).toList();

      for(ProductDB item in productsDb){
        productsInProvider.add(Product(id: item.id, name: item.name, serial: item.serial, date: DateTime.parse(item.date!), exptime: item.expTime, exptype: item.expType, insurer: item.insurer));
      }

      return true;
    }catch(err){
      return false;
    }
      
  }

  Future<bool> addProduct(Product product) async {
    try{
      Database db = await database();
      ProductDB productToAdd = ProductDB(product.id, product.name, product.serial, product.date!.toString(), product.exptime, product.exptype, product.insurer);
      db.insert(TableName, productToAdd.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);   

      productsInProvider.insert(0, product);

      return true;
    }catch(err){
      return false;
    }
  }

  Future<bool> updateProduct(Product product) async {
    try{
      Database db = await database();
      ProductDB productToUp = ProductDB(product.id, product.name, product.serial, product.date!.toIso8601String(), product.exptime, product.exptype, product.insurer);
      db.update(TableName, productToUp.toMap(), where: "id = ?", whereArgs: [productToUp.id], conflictAlgorithm: ConflictAlgorithm.replace);     

      int index = productsInProvider.indexWhere((element) => element.id == product.id);
      productsInProvider[index] = product;

      return true;
    }catch(err){
      return false;
    } 
  }

  Future<bool> delProduct(String delId) async {
    try{
      Database db = await database();
      db.delete(TableName, where: "id = ?", whereArgs: [delId]);

      productsInProvider.removeWhere((element) => element.id == delId);

      return true;
    }catch(err){
      return false;
    } 
  }
}
