part of 'home_page_bloc.dart';

class HomePageState extends Equatable{
    final int selectIndex;

    const HomePageState({this.selectIndex = 0});

    HomePageState copyWith({int? select}){
      return HomePageState(selectIndex: select ?? selectIndex);
    }
    
    @override
    // TODO: implement props
    List<Object?> get props => [selectIndex];
}