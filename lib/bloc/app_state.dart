part of 'app_bloc.dart';


@immutable
abstract class AppState {
  int? get selectIndex => 0;
  List<Product>? get products => [];
}

class AppInitial extends AppState{
  final List<Product> _products;

  AppInitial(this._products);

  @override
  List<Product>? get products => _products;
}

class AppFinishState extends AppState{
    final int? _selectIndex;
    final List<Product> _products;

    AppFinishState(this._selectIndex, this._products);

    @override
    int? get selectIndex => _selectIndex;

    @override
    List<Product>? get products => _products;
}

class AppSortState extends AppState{
    final int? _selectIndex;
    final List<Product> _products;

    AppSortState(this._selectIndex, this._products);

    @override
    int? get selectIndex => _selectIndex;

    @override
    List<Product>? get products => _products;
}

class SelectState extends AppState{
    final int? _selectIndex;
    final List<Product> _products;

    SelectState(this._selectIndex, this._products);

    @override
    int? get selectIndex => _selectIndex;

    @override
    List<Product>? get products => _products;
}

class ProductsState extends AppState{
    final List<Product> _products;

    ProductsState(this._products);

    @override
    List<Product>? get products => _products;
}

class ProductDetailState extends AppState{
    final Product _product;

    ProductDetailState(this._product);

    Product? get product => _product;
}