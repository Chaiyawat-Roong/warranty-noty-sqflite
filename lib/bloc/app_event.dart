part of 'app_bloc.dart';

abstract class AppEvent extends Equatable{
  @override
  List<Object?> get props => [];

}

class HomePageSelectEvent extends AppEvent{
  final int? index;

  HomePageSelectEvent({this.index});
}

class LoadingHomePageEvent extends AppEvent{
  final int? index;

  LoadingHomePageEvent({this.index});
}

class GetProductEvent extends AppEvent{
  final String? id;

  GetProductEvent({this.id});
}

class AddProductEvent extends AppEvent{
  final Product? product;

  AddProductEvent({this.product});
}

class EditProductEvent extends AppEvent{
  final Product? product;

  EditProductEvent({this.product});
}

class DeleteProductEvent extends AppEvent{
  final String? delId;

  DeleteProductEvent({this.delId});
}

class SearchProductsEvent extends AppEvent{
  final String? name;

  SearchProductsEvent({this.name});
}

class SearchAPIEvent extends AppEvent{
  final String? status;

  SearchAPIEvent({this.status});
}