part of 'app_bloc.dart';

abstract class AppEvent extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class HomePageSelectEvent extends AppEvent{
  final int? index;

  HomePageSelectEvent({this.index});
}

class addProductEvent extends AppEvent{
  final Product? product;

  addProductEvent({this.product});
}