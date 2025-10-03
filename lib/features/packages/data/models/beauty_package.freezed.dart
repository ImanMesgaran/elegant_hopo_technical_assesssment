// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'beauty_package.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BeautyPackage _$BeautyPackageFromJson(Map<String, dynamic> json) {
  return _BeautyPackage.fromJson(json);
}

/// @nodoc
mixin _$BeautyPackage {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  double get progress => throw _privateConstructorUsedError;
  List<String> get images => throw _privateConstructorUsedError;
  bool get hasExtra => throw _privateConstructorUsedError;
  int get extraCount => throw _privateConstructorUsedError;

  /// Serializes this BeautyPackage to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BeautyPackage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BeautyPackageCopyWith<BeautyPackage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BeautyPackageCopyWith<$Res> {
  factory $BeautyPackageCopyWith(
          BeautyPackage value, $Res Function(BeautyPackage) then) =
      _$BeautyPackageCopyWithImpl<$Res, BeautyPackage>;
  @useResult
  $Res call(
      {String id,
      String title,
      double progress,
      List<String> images,
      bool hasExtra,
      int extraCount});
}

/// @nodoc
class _$BeautyPackageCopyWithImpl<$Res, $Val extends BeautyPackage>
    implements $BeautyPackageCopyWith<$Res> {
  _$BeautyPackageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BeautyPackage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? progress = null,
    Object? images = null,
    Object? hasExtra = null,
    Object? extraCount = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      progress: null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as double,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      hasExtra: null == hasExtra
          ? _value.hasExtra
          : hasExtra // ignore: cast_nullable_to_non_nullable
              as bool,
      extraCount: null == extraCount
          ? _value.extraCount
          : extraCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BeautyPackageImplCopyWith<$Res>
    implements $BeautyPackageCopyWith<$Res> {
  factory _$$BeautyPackageImplCopyWith(
          _$BeautyPackageImpl value, $Res Function(_$BeautyPackageImpl) then) =
      __$$BeautyPackageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      double progress,
      List<String> images,
      bool hasExtra,
      int extraCount});
}

/// @nodoc
class __$$BeautyPackageImplCopyWithImpl<$Res>
    extends _$BeautyPackageCopyWithImpl<$Res, _$BeautyPackageImpl>
    implements _$$BeautyPackageImplCopyWith<$Res> {
  __$$BeautyPackageImplCopyWithImpl(
      _$BeautyPackageImpl _value, $Res Function(_$BeautyPackageImpl) _then)
      : super(_value, _then);

  /// Create a copy of BeautyPackage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? progress = null,
    Object? images = null,
    Object? hasExtra = null,
    Object? extraCount = null,
  }) {
    return _then(_$BeautyPackageImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      progress: null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as double,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      hasExtra: null == hasExtra
          ? _value.hasExtra
          : hasExtra // ignore: cast_nullable_to_non_nullable
              as bool,
      extraCount: null == extraCount
          ? _value.extraCount
          : extraCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BeautyPackageImpl implements _BeautyPackage {
  const _$BeautyPackageImpl(
      {required this.id,
      required this.title,
      required this.progress,
      required final List<String> images,
      this.hasExtra = false,
      this.extraCount = 0})
      : _images = images;

  factory _$BeautyPackageImpl.fromJson(Map<String, dynamic> json) =>
      _$$BeautyPackageImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final double progress;
  final List<String> _images;
  @override
  List<String> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  @JsonKey()
  final bool hasExtra;
  @override
  @JsonKey()
  final int extraCount;

  @override
  String toString() {
    return 'BeautyPackage(id: $id, title: $title, progress: $progress, images: $images, hasExtra: $hasExtra, extraCount: $extraCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BeautyPackageImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.progress, progress) ||
                other.progress == progress) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.hasExtra, hasExtra) ||
                other.hasExtra == hasExtra) &&
            (identical(other.extraCount, extraCount) ||
                other.extraCount == extraCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, progress,
      const DeepCollectionEquality().hash(_images), hasExtra, extraCount);

  /// Create a copy of BeautyPackage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BeautyPackageImplCopyWith<_$BeautyPackageImpl> get copyWith =>
      __$$BeautyPackageImplCopyWithImpl<_$BeautyPackageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BeautyPackageImplToJson(
      this,
    );
  }
}

abstract class _BeautyPackage implements BeautyPackage {
  const factory _BeautyPackage(
      {required final String id,
      required final String title,
      required final double progress,
      required final List<String> images,
      final bool hasExtra,
      final int extraCount}) = _$BeautyPackageImpl;

  factory _BeautyPackage.fromJson(Map<String, dynamic> json) =
      _$BeautyPackageImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  double get progress;
  @override
  List<String> get images;
  @override
  bool get hasExtra;
  @override
  int get extraCount;

  /// Create a copy of BeautyPackage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BeautyPackageImplCopyWith<_$BeautyPackageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
