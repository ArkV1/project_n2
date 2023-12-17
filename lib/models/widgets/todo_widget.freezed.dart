// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_widget.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ToDoWidget {
  @Id(assignable: true)
  int? get id => throw _privateConstructorUsedError;
  int get toDoListId => throw _privateConstructorUsedError;
  int get widgetTypeIndex => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ToDoWidgetCopyWith<ToDoWidget> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ToDoWidgetCopyWith<$Res> {
  factory $ToDoWidgetCopyWith(
          ToDoWidget value, $Res Function(ToDoWidget) then) =
      _$ToDoWidgetCopyWithImpl<$Res, ToDoWidget>;
  @useResult
  $Res call(
      {@Id(assignable: true) int? id, int toDoListId, int widgetTypeIndex});
}

/// @nodoc
class _$ToDoWidgetCopyWithImpl<$Res, $Val extends ToDoWidget>
    implements $ToDoWidgetCopyWith<$Res> {
  _$ToDoWidgetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? toDoListId = null,
    Object? widgetTypeIndex = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      toDoListId: null == toDoListId
          ? _value.toDoListId
          : toDoListId // ignore: cast_nullable_to_non_nullable
              as int,
      widgetTypeIndex: null == widgetTypeIndex
          ? _value.widgetTypeIndex
          : widgetTypeIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ToDoWidgetImplCopyWith<$Res>
    implements $ToDoWidgetCopyWith<$Res> {
  factory _$$ToDoWidgetImplCopyWith(
          _$ToDoWidgetImpl value, $Res Function(_$ToDoWidgetImpl) then) =
      __$$ToDoWidgetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@Id(assignable: true) int? id, int toDoListId, int widgetTypeIndex});
}

/// @nodoc
class __$$ToDoWidgetImplCopyWithImpl<$Res>
    extends _$ToDoWidgetCopyWithImpl<$Res, _$ToDoWidgetImpl>
    implements _$$ToDoWidgetImplCopyWith<$Res> {
  __$$ToDoWidgetImplCopyWithImpl(
      _$ToDoWidgetImpl _value, $Res Function(_$ToDoWidgetImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? toDoListId = null,
    Object? widgetTypeIndex = null,
  }) {
    return _then(_$ToDoWidgetImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      toDoListId: null == toDoListId
          ? _value.toDoListId
          : toDoListId // ignore: cast_nullable_to_non_nullable
              as int,
      widgetTypeIndex: null == widgetTypeIndex
          ? _value.widgetTypeIndex
          : widgetTypeIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@Entity(realClass: ToDoWidget)
class _$ToDoWidgetImpl extends _ToDoWidget {
  _$ToDoWidgetImpl(
      {@Id(assignable: true) this.id = 0,
      required this.toDoListId,
      required this.widgetTypeIndex})
      : super._();

  @override
  @JsonKey()
  @Id(assignable: true)
  final int? id;
  @override
  final int toDoListId;
  @override
  final int widgetTypeIndex;

  @override
  String toString() {
    return 'ToDoWidget(id: $id, toDoListId: $toDoListId, widgetTypeIndex: $widgetTypeIndex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ToDoWidgetImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.toDoListId, toDoListId) ||
                other.toDoListId == toDoListId) &&
            (identical(other.widgetTypeIndex, widgetTypeIndex) ||
                other.widgetTypeIndex == widgetTypeIndex));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, toDoListId, widgetTypeIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ToDoWidgetImplCopyWith<_$ToDoWidgetImpl> get copyWith =>
      __$$ToDoWidgetImplCopyWithImpl<_$ToDoWidgetImpl>(this, _$identity);
}

abstract class _ToDoWidget extends ToDoWidget {
  factory _ToDoWidget(
      {@Id(assignable: true) final int? id,
      required final int toDoListId,
      required final int widgetTypeIndex}) = _$ToDoWidgetImpl;
  _ToDoWidget._() : super._();

  @override
  @Id(assignable: true)
  int? get id;
  @override
  int get toDoListId;
  @override
  int get widgetTypeIndex;
  @override
  @JsonKey(ignore: true)
  _$$ToDoWidgetImplCopyWith<_$ToDoWidgetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
