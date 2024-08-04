part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

class InitHomeEvent extends HomeEvent {
  const InitHomeEvent();
}

class ChangePageEvent extends HomeEvent {
  final int currentIndex;
  const ChangePageEvent(this.currentIndex);

  @override
  List<Object?> get props => [currentIndex];
}

class TapIconEvent extends HomeEvent {
  final int currentIndex;
  const TapIconEvent(this.currentIndex);

  @override
  List<Object?> get props => [currentIndex];
}