import '../models/product.dart';
import 'product_data_provider.dart';

class AppRepository {
    final ProductsDataProvider provider;

    AppRepository(this.provider);

    List<Product> getAllProducts(){
        return provider.products;
    }

    void addProduct(Product product){
      provider.addProduct(product);
    }

    void delProduct(String delName){
      provider.delProduct(delName);
    }

    void editProduct(Product product){
      provider.editProduct(product);
    }
}
