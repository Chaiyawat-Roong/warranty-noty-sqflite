import '../models/product.dart';
import 'product_data_provider.dart';

class HomePageRepository {
    final ProductsDataProvider provider;

    HomePageRepository(this.provider);

    List<Product> getAllProducts(){
        return provider.products;
    }
}
