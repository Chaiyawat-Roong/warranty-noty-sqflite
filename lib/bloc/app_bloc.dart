import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:warranty_noty/bloc/app_repository.dart';

import '../models/product.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final AppRepository repository;
  AppBloc(this.repository): super(AppInitial(repository.getAllProducts())) {
    on<LoadingHomePageEvent>((event, emit) async {
      if(await repository.getAllProductsWithAPI()){
        emit(SelectState(event.index, repository.getAllProducts()));
      }else{
        emit(ErrorState("Error 404 Not Found"));
      }
    });
    on<HomePageSelectEvent>(
      (event, emit) async {
          if (event.index == 0) {
            emit(SelectState(event.index, repository.getAllProducts()));
          } else if (event.index == 1) {
            List<Product> sortProducts = [...repository.getAllProducts()];
            sortProducts.sort((a, b) => DateTime(
                      a.exptype == "Year"
                          ? a.date!.year + a.exptime!
                          : a.date!.year,
                      a.exptype == "Month"
                          ? a.date!.month + a.exptime!
                          : a.date!.month,
                      a.exptype == "Day"
                          ? a.date!.day + a.exptime!
                          : a.date!.day,
                    ).compareTo(DateTime(
                      b.exptype == "Year"
                          ? b.date!.year + b.exptime!
                          : b.date!.year,
                      b.exptype == "Month"
                          ? b.date!.month + b.exptime!
                          : b.date!.month,
                      b.exptype == "Day"
                          ? b.date!.day + b.exptime!
                          : b.date!.day,
                    )));
            emit(SelectState(event.index, sortProducts));
          }
      },
    );
    on<AddProductEvent>((event, emit) async {
      if(await repository.addProduct(event.product!)){
        emit(ProductsState(repository.getAllProducts()));
      }else{
        emit(ErrorState("Error 404 Not Found"));
      }
    });
    on<DeleteProductEvent>((event, emit)async {
      if(await repository.delProduct(event.delId!)){
        emit(ProductsState(repository.getAllProducts()));
      }else{
        emit(ErrorState("Error 404 Not Found"));
      }
    });
    on<EditProductEvent>((event, emit) async {
      if(await repository.editProduct(event.product!)){
        emit(ProductsState(repository.getAllProducts()));
      }else{
        emit(ErrorState("Error 404 Not Found"));
      }
    });
    on<SearchProductsEvent>((event, emit) async {
      if(event.name == ""){
        emit(ProductsSearchState(repository.getAllProducts()));
      }else{
        List<Product> products = repository.getAllProducts();
        List<Product> filterProducts = products.where((element) => element.name!.toLowerCase().contains(event.name!.toLowerCase())).toList();
        emit(ProductsSearchState(filterProducts));
      }
    });
  }
}
