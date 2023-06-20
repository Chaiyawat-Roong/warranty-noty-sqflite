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
          emit(HomePageFinishState(event.index, repository.getAllProducts()));
        } else if (event.index == 1) {
          List<Product> sortProducts = [...state.products!];
          sortProducts.sort((a, b) => a.expDate!.compareTo(b.expDate!));
          emit(HomePageFinishState(event.index, sortProducts));
        }
      },
    );
    on<addProductEvent>((event, emit) {
      repository.addProduct2(event.product!);
    });
  }
}
