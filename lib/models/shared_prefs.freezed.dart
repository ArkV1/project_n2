// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shared_prefs.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SharedPref {
  @ignore
  int get id => throw _privateConstructorUsedError;
  String get key => throw _privateConstructorUsedError;
  String? get value => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SharedPrefCopyWith<SharedPref> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SharedPrefCopyWith<$Res> {
  factory $SharedPrefCopyWith(
          SharedPref value, $Res Function(SharedPref) then) =
      _$SharedPrefCopyWithImpl<$Res, SharedPref>;
  @useResult
  $Res call({@ignore int id, String key, String? value});
}

/// @nodoc
class _$SharedPrefCopyWithImpl<$Res, $Val extends SharedPref>
    implements $SharedPrefCopyWith<$Res> {
  _$SharedPrefCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? key = null,
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SharedPrefImplCopyWith<$Res>
    implements $SharedPrefCopyWith<$Res> {
  factory _$$SharedPrefImplCopyWith(
          _$SharedPrefImpl value, $Res Function(_$SharedPrefImpl) then) =
      __$$SharedPrefImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@ignore int id, String key, String? value});
}

/// @nodoc
class __$$SharedPrefImplCopyWithImpl<$Res>
    extends _$SharedPrefCopyWithImpl<$Res, _$SharedPrefImpl>
    implements _$$SharedPrefImplCopyWith<$Res> {
  __$$SharedPrefImplCopyWithImpl(
      _$SharedPrefImpl _value, $Res Function(_$SharedPrefImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? key = null,
    Object? value = freezed,
  }) {
    return _then(_$SharedPrefImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$SharedPrefImpl extends _SharedPref {
  _$SharedPrefImpl(
      {@ignore this.id = Isar.autoIncrement, required this.key, this.value})
      : super._();

  @override
  @JsonKey()
  @ignore
  final int id;
  @override
  final String key;
  @override
  final String? value;

  @override
  String toString() {
    return 'SharedPref(id: $id, key: $key, value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SharedPrefImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, key, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SharedPrefImplCopyWith<_$SharedPrefImpl> get copyWith =>
      __$$SharedPrefImplCopyWithImpl<_$SharedPrefImpl>(this, _$identity);
}

abstract class _SharedPref extends SharedPref {
  factory _SharedPref(
      {@ignore final int id,
      required final String key,
      final String? value}) = _$SharedPrefImpl;
  _SharedPref._() : super._();

  @override
  @ignore
  int get id;
  @override
  String get key;
  @override
  String? get value;
  @override
  @JsonKey(ignore: true)
  _$$SharedPrefImplCopyWith<_$SharedPrefImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
