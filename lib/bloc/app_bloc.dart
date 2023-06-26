import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:warranty_noty/bloc/app_repository.dart';

import '../models/product.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, HomePageState> {
  final AppRepository repository;
  AppBloc(this.repository)
      : super(HomePageInitial(repository.getAllProducts())) {
    on<HomePageSelectEvent>(
      (event, emit) {
        if (event.index == 0) {
          emit(SelectState(event.index));
          emit(ProductsState(repository.getAllProducts()));
        } else if (event.index == 1) {
          List<Product> sortProducts = [...state.products!];
          sortProducts.sort((a, b) => DateTime(
                    a.expType == "Year"
                        ? a.date!.year + a.expTime!
                        : a.date!.year,
                    a.expType == "Month"
                        ? a.date!.month + a.expTime!
                        : a.date!.month,
                    a.expType == "Day"
                        ? a.date!.day + a.expTime!
                        : a.date!.day,
                  ).compareTo(DateTime(
                    b.expType == "Year"
                        ? b.date!.year + b.expTime!
                        : b.date!.year,
                    b.expType == "Month"
                        ? b.date!.month + b.expTime!
                        : b.date!.month,
                    b.expType == "Day"
                        ? b.date!.day + b.expTime!
                        : b.date!.day,
                  )));
          emit(HomePageFinishState(event.index, sortProducts));
        }
      },
    );
    on<AddProductEvent>((event, emit) {
      repository.addProduct2(event.product!);
    });
    on<DeleteProductEvent>((event, emit) {
      repository.delProduct2(event.delName!);
    });
    on<SearchProductEvent>((event, emit) {
      List<Product> products = repository.getAllProducts();
      List<Product> filterProducts = products.where((element) => element.name!.toLowerCase().contains(event.name!.toLowerCase())).toList();
      emit(HomePageFinishState(1, products));
    });
  }
}
