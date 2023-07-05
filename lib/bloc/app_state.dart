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

class SelectState extends AppState{
    final int? _selectIndex;
    final List<Product> _products;

    SelectState(this._selectIndex, this._products);

    @override
    int? get selectIndex => _selectIndex;

    @override
    List<Product>? get products => _products;
}

class ErrorState extends AppState{
    final String? _error;

    ErrorState(this._error);

    @override
    String? get error => _error;
}

class ProductsState extends AppState{
    final List<Product> _products;

    ProductsState(this._products);

    @override
    List<Product>? get products => _products;
}

class ProductsSearchState extends AppState{
    final List<Product> _products;

    ProductsSearchState(this._products);

    @override
    List<Product>? get products => _products;
}