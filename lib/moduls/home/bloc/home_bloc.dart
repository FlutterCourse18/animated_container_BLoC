import 'package:bloc_animated_container/models/animated_container_model.dart';
import 'package:bloc_animated_container/repositoties/animated_container_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(this.repositories) : super(HomeInitialState()) {
    on<HomeEvent>((event, emit) {
      emit(HomeLoadingState());
      // await Future.delayed(const Duration(seconds: 1));
      try {
        final AnimatedContainerModel data = repositories.getAnimatedContainer();
        emit(HomeSuccessState(data: data));
      } catch (e) {
        emit(HomeErrorState(errorText: e.toString()));
      }
    });
  }
  final AnimatedContainerRepository repositories;
}
