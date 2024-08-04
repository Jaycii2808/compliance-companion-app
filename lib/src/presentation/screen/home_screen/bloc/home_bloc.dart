import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'home_event.dart';
part 'home_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const Initial(honePageIndex: 0)) {
    on<ChangePageEvent>(_onChangeHomePage);
    on<TapIconEvent>(_onTapIcon);
  }

  void _onChangeHomePage(ChangePageEvent event, Emitter<HomeState> emit) {
      final currentState = state;
      emit(HomeLoading(honePageIndex: currentState.honePageIndex));
      emit(ChangeHomePage(honePageIndex: event.currentIndex));
  }

  void _onTapIcon(TapIconEvent event, Emitter<HomeState> emit) {
    final currentState = state;
    emit(HomeLoading(honePageIndex: currentState.honePageIndex));
    emit(OnTapIcon(honePageIndex: event.currentIndex));
  }
}
