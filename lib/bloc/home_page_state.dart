part of 'home_page_bloc.dart';

class HomePageState extends Equatable{
    final bool showSearch;

    const HomePageState({this.showSearch = false});

    HomePageState copyWith({bool? show}){
      return HomePageState(showSearch: show ?? showSearch);
    }
    
    @override
    // TODO: implement props
    List<Object?> get props => [showSearch];
}