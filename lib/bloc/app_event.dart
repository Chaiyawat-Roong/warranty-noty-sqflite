part of 'app_bloc.dart';

abstract class AppEvent extends Equatable{
  @override
  List<Object?> get props => [];

}

class HomePageSelectEvent extends AppEvent{
  final int? index;

  HomePageSelectEvent({this.index});
}

class AddProductEvent extends AppEvent{
  final Product? product;

  AddProductEvent({this.product});
}

class DeleteProductEvent extends AppEvent{
  final String? delName;

  DeleteProductEvent({this.delName});
}

class SearchProductEvent extends AppEvent{
  final String? name;

  SearchProductEvent({this.name});
}