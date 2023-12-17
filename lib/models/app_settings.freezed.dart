// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CustomTheme {
  Ergonomics get ergonomics => throw _privateConstructorUsedError;
  ThemeMode get themeMode => throw _privateConstructorUsedError;
  Map<dynamic, dynamic> get primaryColor => throw _privateConstructorUsedError;
  Map<dynamic, dynamic> get primaryContrastingColor =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CustomThemeCopyWith<CustomTheme> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomThemeCopyWith<$Res> {
  factory $CustomThemeCopyWith(
          CustomTheme value, $Res Function(CustomTheme) then) =
      _$CustomThemeCopyWithImpl<$Res, CustomTheme>;
  @useResult
  $Res call(
      {Ergonomics ergonomics,
      ThemeMode themeMode,
      Map<dynamic, dynamic> primaryColor,
      Map<dynamic, dynamic> primaryContrastingColor});
}

/// @nodoc
class _$CustomThemeCopyWithImpl<$Res, $Val extends CustomTheme>
    implements $CustomThemeCopyWith<$Res> {
  _$CustomThemeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ergonomics = null,
    Object? themeMode = null,
    Object? primaryColor = null,
    Object? primaryContrastingColor = null,
  }) {
    return _then(_value.copyWith(
      ergonomics: null == ergonomics
          ? _value.ergonomics
          : ergonomics // ignore: cast_nullable_to_non_nullable
              as Ergonomics,
      themeMode: null == themeMode
          ? _value.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as ThemeMode,
      primaryColor: null == primaryColor
          ? _value.primaryColor
          : primaryColor // ignore: cast_nullable_to_non_nullable
              as Map<dynamic, dynamic>,
      primaryContrastingColor: null == primaryContrastingColor
          ? _value.primaryContrastingColor
          : primaryContrastingColor // ignore: cast_nullable_to_non_nullable
              as Map<dynamic, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CustomThemeImplCopyWith<$Res>
    implements $CustomThemeCopyWith<$Res> {
  factory _$$CustomThemeImplCopyWith(
          _$CustomThemeImpl value, $Res Function(_$CustomThemeImpl) then) =
      __$$CustomThemeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Ergonomics ergonomics,
      ThemeMode themeMode,
      Map<dynamic, dynamic> primaryColor,
      Map<dynamic, dynamic> primaryContrastingColor});
}

/// @nodoc
class __$$CustomThemeImplCopyWithImpl<$Res>
    extends _$CustomThemeCopyWithImpl<$Res, _$CustomThemeImpl>
    implements _$$CustomThemeImplCopyWith<$Res> {
  __$$CustomThemeImplCopyWithImpl(
      _$CustomThemeImpl _value, $Res Function(_$CustomThemeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ergonomics = null,
    Object? themeMode = null,
    Object? primaryColor = null,
    Object? primaryContrastingColor = null,
  }) {
    return _then(_$CustomThemeImpl(
      ergonomics: null == ergonomics
          ? _value.ergonomics
          : ergonomics // ignore: cast_nullable_to_non_nullable
              as Ergonomics,
      themeMode: null == themeMode
          ? _value.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as ThemeMode,
      primaryColor: null == primaryColor
          ? _value._primaryColor
          : primaryColor // ignore: cast_nullable_to_non_nullable
              as Map<dynamic, dynamic>,
      primaryContrastingColor: null == primaryContrastingColor
          ? _value._primaryContrastingColor
          : primaryContrastingColor // ignore: cast_nullable_to_non_nullable
              as Map<dynamic, dynamic>,
    ));
  }
}

/// @nodoc

class _$CustomThemeImpl implements _CustomTheme {
  _$CustomThemeImpl(
      {required this.ergonomics,
      required this.themeMode,
      required final Map<dynamic, dynamic> primaryColor,
      required final Map<dynamic, dynamic> primaryContrastingColor})
      : _primaryColor = primaryColor,
        _primaryContrastingColor = primaryContrastingColor;

  @override
  final Ergonomics ergonomics;
  @override
  final ThemeMode themeMode;
  final Map<dynamic, dynamic> _primaryColor;
  @override
  Map<dynamic, dynamic> get primaryColor {
    if (_primaryColor is EqualUnmodifiableMapView) return _primaryColor;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_primaryColor);
  }

  final Map<dynamic, dynamic> _primaryContrastingColor;
  @override
  Map<dynamic, dynamic> get primaryContrastingColor {
    if (_primaryContrastingColor is EqualUnmodifiableMapView)
      return _primaryContrastingColor;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_primaryContrastingColor);
  }

  @override
  String toString() {
    return 'CustomTheme(ergonomics: $ergonomics, themeMode: $themeMode, primaryColor: $primaryColor, primaryContrastingColor: $primaryContrastingColor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomThemeImpl &&
            (identical(other.ergonomics, ergonomics) ||
                other.ergonomics == ergonomics) &&
            (identical(other.themeMode, themeMode) ||
                other.themeMode == themeMode) &&
            const DeepCollectionEquality()
                .equals(other._primaryColor, _primaryColor) &&
            const DeepCollectionEquality().equals(
                other._primaryContrastingColor, _primaryContrastingColor));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      ergonomics,
      themeMode,
      const DeepCollectionEquality().hash(_primaryColor),
      const DeepCollectionEquality().hash(_primaryContrastingColor));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomThemeImplCopyWith<_$CustomThemeImpl> get copyWith =>
      __$$CustomThemeImplCopyWithImpl<_$CustomThemeImpl>(this, _$identity);
}

abstract class _CustomTheme implements CustomTheme {
  factory _CustomTheme(
          {required final Ergonomics ergonomics,
          required final ThemeMode themeMode,
          required final Map<dynamic, dynamic> primaryColor,
          required final Map<dynamic, dynamic> primaryContrastingColor}) =
      _$CustomThemeImpl;

  @override
  Ergonomics get ergonomics;
  @override
  ThemeMode get themeMode;
  @override
  Map<dynamic, dynamic> get primaryColor;
  @override
  Map<dynamic, dynamic> get primaryContrastingColor;
  @override
  @JsonKey(ignore: true)
  _$$CustomThemeImplCopyWith<_$CustomThemeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
