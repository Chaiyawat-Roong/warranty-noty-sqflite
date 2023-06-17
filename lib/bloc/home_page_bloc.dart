import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:warranty_noty/bloc/home_page_repository.dart';

import '../models/product.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  final HomePageRepository repository;
  HomePageBloc(this.repository) : super(HomePageInitial(repository.getAllProducts())) {
    on<HomePageSelectEvent>((event, emit) {
      if(event.index == 0){
        emit(HomePageFinishState(event.index, repository.getAllProducts()));
      }else if(event.index == 1){
        List<Product> sortProducts = [...state.products!];
        sortProducts.sort((a, b) => a.expDate!.compareTo(b.expDate!));
        emit(HomePageFinishState(event.index, sortProducts));
      }
    });
  }
}
