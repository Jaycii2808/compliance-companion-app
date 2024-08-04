part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  final int honePageIndex;

  const HomeState({required this.honePageIndex});

  @override
  List<Object?> get props => [];
}

class Initial extends HomeState {
  const Initial({required super.honePageIndex});
}

class HomeLoading extends HomeState {
  const HomeLoading({required super.honePageIndex});
}

class ChangeHomePage extends HomeState {
  const ChangeHomePage({required super.honePageIndex});
}

class OnTapIcon extends HomeState {
  const OnTapIcon({required super.honePageIndex});
}
