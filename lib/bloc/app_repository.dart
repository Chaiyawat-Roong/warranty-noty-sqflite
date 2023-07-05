import '../models/product.dart';
import 'product_data_provider.dart';

class AppRepository {
    final ProductsDataProvider provider;

    AppRepository(this.provider);

    List<Product> getAllProducts(){
        return provider.products;
    }

    Future<void> getAllProductsWithAPI(){
       return provider.fetchAllData();
    }

    Product getProducts(String id){
        return provider.products.firstWhere((element) => element.id == id);
    }

    void addProduct(Product product){
      provider.addProduct(product);
    }

    Future delProduct(String delId) async{
      await provider.delProduct(delId);
    }

    void editProduct(Product product){
      provider.updateProduct(product);
    }
}
