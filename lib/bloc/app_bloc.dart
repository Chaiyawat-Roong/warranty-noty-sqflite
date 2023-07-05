import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:warranty_noty/bloc/app_repository.dart';
import 'package:http/http.dart' as http;

import '../models/product.dart';
import '../models/response.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final AppRepository repository;
  AppBloc(this.repository): super(AppInitial(repository.getAllProducts())) {
    on<LoadingHomePageEvent>((event, emit) async {
      await repository.getAllProductsWithAPI();
      emit(SelectState(event.index, repository.getAllProducts()));
    });
    on<HomePageSelectEvent>(
      (event, emit) async {
        await repository.getAllProductsWithAPI();
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
    on<AddProductEvent>((event, emit) {
      repository.addProduct(event.product!);
      repository.getAllProductsWithAPI();
      emit(ProductsState(repository.getAllProducts()));
    });
    on<DeleteProductEvent>((event, emit)async {
      repository.delProduct(event.delId!).then((value) => repository.getAllProductsWithAPI());
      emit(ProductsState(repository.getAllProducts()));
    });
    on<EditProductEvent>((event, emit) {
      repository.editProduct(event.product!);
      repository.getAllProductsWithAPI();
      emit(ProductsState(repository.getAllProducts()));
    });
    on<SearchProductsEvent>((event, emit) {
      if(event.name == ""){
        repository.getAllProductsWithAPI();
        emit(ProductsState(repository.getAllProducts()));
      }else{
        repository.getAllProductsWithAPI();
        List<Product> products = repository.getAllProducts();
        List<Product> filterProducts = products.where((element) => element.name!.toLowerCase().contains(event.name!.toLowerCase())).toList();
        emit(ProductsState(filterProducts));
      }
    });
  }
}
