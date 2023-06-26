part of 'app_bloc.dart';


@immutable
abstract class HomePageState {
  int? get selectIndex => 0;
  List<Product>? get products => [];
}

class HomePageInitial extends HomePageState{
  final List<Product> _products;

  HomePageInitial(this._products);

  @override
  List<Product>? get products => _products;
}

class HomePageFinishState extends HomePageState{
    final int? _selectIndex;
    final List<Product> _products;

    HomePageFinishState(this._selectIndex, this._products);

    @override
    int? get selectIndex => _selectIndex;

    @override
    List<Product>? get products => _products;
}

class HomePageSortState extends HomePageState{
    final int? _selectIndex;
    final List<Product> _products;

    HomePageSortState(this._selectIndex, this._products);

    @override
    int? get selectIndex => _selectIndex;

    @override
    List<Product>? get products => _products;
}

class SelectState extends HomePageState{
    final int? _selectIndex;

    SelectState(this._selectIndex);

    @override
    int? get selectIndex => _selectIndex;
}

class ProductsState extends HomePageState{
    final List<Product> _products;

    ProductsState(this._products);

    @override
    List<Product>? get products => _products;
}