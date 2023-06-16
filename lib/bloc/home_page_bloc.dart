import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc() : super(HomePageState()) {
    on<HomePageSearchEvent>((event, emit) {
      emit(state.copyWith(show: !state.showSearch));
    });
  }
}
