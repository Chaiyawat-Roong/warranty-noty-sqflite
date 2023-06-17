part of 'home_page_bloc.dart';

abstract class HomePageEvent extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class HomePageSelectEvent extends HomePageEvent{
  final int? index;

  HomePageSelectEvent({this.index});
}
