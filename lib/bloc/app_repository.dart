import '../models/product.dart';
import 'product_data_provider.dart';

class AppRepository {
    final ProductsDataProvider provider;

    AppRepository(this.provider);

    List<Product> getAllProducts(){
        return provider.products;
    }

    Future<bool> getAllProductsWithAPI() async {
       return await provider.fetchAllData();
    }

    Future<bool> addProduct(Product product) async {
       return await provider.addProduct(product);
    }

    Future<bool> delProduct(String delId) async {
      return await provider.delProduct(delId);
    }

    Future<bool> editProduct(Product product) async {
      return await provider.updateProduct(product);
    }
}
