import 'package:freezed_annotation/freezed_annotation.dart';

part 'beauty_package.freezed.dart';
part 'beauty_package.g.dart';

@freezed
class BeautyPackage with _$BeautyPackage {
  const factory BeautyPackage({
    required String id,
    required String title,
    required double progress,
    required List<String> images,
    @Default(false) bool hasExtra,
    @Default(0) int extraCount,
  }) = _BeautyPackage;

  factory BeautyPackage.fromJson(Map<String, dynamic> json) =>
      _$BeautyPackageFromJson(json);
}
