import 'package:equatable/equatable.dart';

/// {@template home_entity}
/// Entity representing home data.
/// {@endtemplate}
class HomeEntity extends Equatable {
  /// {@macro home_entity}
  const HomeEntity({
    required this.id,
    required this.title,
    required this.description,
    this.isCompleted = false,
    this.createdAt,
    this.updatedAt,
  });

  /// Unique identifier for the home item.
  final String id;

  /// Title of the home item.
  final String title;

  /// Description of the home item.
  final String description;

  /// Whether the home item is completed.
  final bool isCompleted;

  /// When the home item was created.
  final DateTime? createdAt;

  /// When the home item was last updated.
  final DateTime? updatedAt;

  @override
  List<Object?> get props => [
    id,
    title,
    description,
    isCompleted,
    createdAt,
    updatedAt,
  ];

  /// Creates a copy of this entity with the given fields replaced.
  HomeEntity copyWith({
    String? id,
    String? title,
    String? description,
    bool? isCompleted,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return HomeEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
