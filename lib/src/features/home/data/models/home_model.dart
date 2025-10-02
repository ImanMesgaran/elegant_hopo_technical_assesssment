import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/home_entity.dart';

part 'home_model.freezed.dart';
part 'home_model.g.dart';

/// {@template home_model}
/// Data model for home items.
/// {@endtemplate}
@freezed
class HomeModel with _$HomeModel {
  /// {@macro home_model}
  const factory HomeModel({
    required String id,
    required String title,
    required String description,
    @Default(false) bool isCompleted,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _HomeModel;

  /// Creates a [HomeModel] from JSON.
  factory HomeModel.fromJson(Map<String, dynamic> json) =>
      _$HomeModelFromJson(json);

  /// Creates a [HomeModel] from a [HomeEntity].
  factory HomeModel.fromEntity(HomeEntity entity) {
    return HomeModel(
      id: entity.id,
      title: entity.title,
      description: entity.description,
      isCompleted: entity.isCompleted,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }
}

/// Extension on [HomeModel] to convert to [HomeEntity].
extension HomeModelX on HomeModel {
  /// Converts this model to an entity.
  HomeEntity toEntity() {
    return HomeEntity(
      id: id,
      title: title,
      description: description,
      isCompleted: isCompleted,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
