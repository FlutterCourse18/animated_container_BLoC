part of 'home_bloc.dart';

sealed class HomeState {}

final class HomeInitialState extends HomeState {}

final class HomeLoadingState extends HomeState {
}

final class HomeSuccessState extends HomeState {
  HomeSuccessState({required this.data});
  final AnimatedContainerModel data;
}

final class HomeErrorState extends HomeState {
  HomeErrorState({required this.errorText});
  final String errorText;
}
