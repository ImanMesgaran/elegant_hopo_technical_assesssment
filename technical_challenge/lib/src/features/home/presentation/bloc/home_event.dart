part of 'home_bloc.dart';

/// {@template home_event}
/// Base class for all home events.
/// {@endtemplate}
abstract class HomeEvent extends Equatable {
  /// {@macro home_event}
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

/// {@template home_started}
/// Event triggered when the home screen is started.
/// {@endtemplate}
class HomeStarted extends HomeEvent {
  /// {@macro home_started}
  const HomeStarted();
}

/// {@template home_refresh_requested}
/// Event triggered when the home screen is refreshed.
/// {@endtemplate}
class HomeRefreshRequested extends HomeEvent {
  /// {@macro home_refresh_requested}
  const HomeRefreshRequested();
}

/// {@template home_item_toggled}
/// Event triggered when a home item is toggled.
/// {@endtemplate}
class HomeItemToggled extends HomeEvent {
  /// {@macro home_item_toggled}
  const HomeItemToggled(this.itemId);

  /// The ID of the item to toggle.
  final String itemId;

  @override
  List<Object?> get props => [itemId];
}
