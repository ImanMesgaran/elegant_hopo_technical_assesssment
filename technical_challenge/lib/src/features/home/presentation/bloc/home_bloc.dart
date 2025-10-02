import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entities/home_entity.dart';
import '../../domain/usecases/get_home_items.dart';

part 'home_event.dart';
part 'home_state.dart';

/// {@template home_bloc}
/// BLoC for managing home state and events.
/// {@endtemplate}
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  /// {@macro home_bloc}
  HomeBloc(this._getHomeItems) : super(const HomeState()) {
    on<HomeStarted>(_onHomeStarted);
    on<HomeRefreshRequested>(_onHomeRefreshRequested);
    on<HomeItemToggled>(_onHomeItemToggled);
  }

  final GetHomeItems _getHomeItems;

  Future<void> _onHomeStarted(
    HomeStarted event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(status: HomeStatus.loading));

    try {
      final result = await _getHomeItems();

      result.fold(
        (failure) => emit(
          state.copyWith(
            status: HomeStatus.failure,
            errorMessage: failure.message,
          ),
        ),
        (items) =>
            emit(state.copyWith(status: HomeStatus.success, items: items)),
      );
    } catch (e) {
      emit(
        state.copyWith(status: HomeStatus.failure, errorMessage: e.toString()),
      );
    }
  }

  Future<void> _onHomeRefreshRequested(
    HomeRefreshRequested event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(status: HomeStatus.loading));

    try {
      final result = await _getHomeItems();

      result.fold(
        (failure) => emit(
          state.copyWith(
            status: HomeStatus.failure,
            errorMessage: failure.message,
          ),
        ),
        (items) =>
            emit(state.copyWith(status: HomeStatus.success, items: items)),
      );
    } catch (e) {
      emit(
        state.copyWith(status: HomeStatus.failure, errorMessage: e.toString()),
      );
    }
  }

  void _onHomeItemToggled(HomeItemToggled event, Emitter<HomeState> emit) {
    final updatedItems = state.items.map((item) {
      if (item.id == event.itemId) {
        return item.copyWith(isCompleted: !item.isCompleted);
      }
      return item;
    }).toList();

    emit(state.copyWith(items: updatedItems));
  }
}
