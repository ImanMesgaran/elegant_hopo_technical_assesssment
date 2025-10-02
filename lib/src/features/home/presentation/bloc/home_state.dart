part of 'home_bloc.dart';

/// {@template home_status}
/// Enum representing the different states of the home screen.
/// {@endtemplate}
enum HomeStatus {
  /// Initial state
  initial,

  /// Loading state
  loading,

  /// Success state
  success,

  /// Failure state
  failure,
}

/// {@template home_state}
/// State class for the home screen.
/// {@endtemplate}
class HomeState extends Equatable {
  /// {@macro home_state}
  const HomeState({
    this.status = HomeStatus.initial,
    this.items = const [],
    this.errorMessage,
  });

  /// Current status of the home screen.
  final HomeStatus status;

  /// List of home items.
  final List<HomeEntity> items;

  /// Error message if any.
  final String? errorMessage;

  /// Whether the home screen is loading.
  bool get isLoading => status == HomeStatus.loading;

  /// Whether the home screen has failed.
  bool get isFailure => status == HomeStatus.failure;

  /// Whether the home screen is successful.
  bool get isSuccess => status == HomeStatus.success;

  @override
  List<Object?> get props => [status, items, errorMessage];

  /// Creates a copy of this state with the given fields replaced.
  HomeState copyWith({
    HomeStatus? status,
    List<HomeEntity>? items,
    String? errorMessage,
  }) {
    return HomeState(
      status: status ?? this.status,
      items: items ?? this.items,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
