// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'beauty_package.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BeautyPackageImpl _$$BeautyPackageImplFromJson(Map<String, dynamic> json) =>
    _$BeautyPackageImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      progress: (json['progress'] as num).toDouble(),
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      hasExtra: json['hasExtra'] as bool? ?? false,
      extraCount: (json['extraCount'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$BeautyPackageImplToJson(_$BeautyPackageImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'progress': instance.progress,
      'images': instance.images,
      'hasExtra': instance.hasExtra,
      'extraCount': instance.extraCount,
    };
