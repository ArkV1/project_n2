// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ToDoList _$ToDoListFromJson(Map<String, dynamic> json) {
  return _ToDoList.fromJson(json);
}

/// @nodoc
mixin _$ToDoList {
  @ignore
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ToDoListCopyWith<ToDoList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ToDoListCopyWith<$Res> {
  factory $ToDoListCopyWith(ToDoList value, $Res Function(ToDoList) then) =
      _$ToDoListCopyWithImpl<$Res, ToDoList>;
  @useResult
  $Res call({@ignore int id, String name});
}

/// @nodoc
class _$ToDoListCopyWithImpl<$Res, $Val extends ToDoList>
    implements $ToDoListCopyWith<$Res> {
  _$ToDoListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ToDoListImplCopyWith<$Res>
    implements $ToDoListCopyWith<$Res> {
  factory _$$ToDoListImplCopyWith(
          _$ToDoListImpl value, $Res Function(_$ToDoListImpl) then) =
      __$$ToDoListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@ignore int id, String name});
}

/// @nodoc
class __$$ToDoListImplCopyWithImpl<$Res>
    extends _$ToDoListCopyWithImpl<$Res, _$ToDoListImpl>
    implements _$$ToDoListImplCopyWith<$Res> {
  __$$ToDoListImplCopyWithImpl(
      _$ToDoListImpl _value, $Res Function(_$ToDoListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$ToDoListImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ToDoListImpl extends _ToDoList with DiagnosticableTreeMixin {
  _$ToDoListImpl({@ignore this.id = Isar.autoIncrement, required this.name})
      : super._();

  factory _$ToDoListImpl.fromJson(Map<String, dynamic> json) =>
      _$$ToDoListImplFromJson(json);

  @override
  @JsonKey()
  @ignore
  final int id;
  @override
  final String name;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ToDoList(id: $id, name: $name)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ToDoList'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ToDoListImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ToDoListImplCopyWith<_$ToDoListImpl> get copyWith =>
      __$$ToDoListImplCopyWithImpl<_$ToDoListImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ToDoListImplToJson(
      this,
    );
  }
}

abstract class _ToDoList extends ToDoList {
  factory _ToDoList({@ignore final int id, required final String name}) =
      _$ToDoListImpl;
  _ToDoList._() : super._();

  factory _ToDoList.fromJson(Map<String, dynamic> json) =
      _$ToDoListImpl.fromJson;

  @override
  @ignore
  int get id;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$ToDoListImplCopyWith<_$ToDoListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
