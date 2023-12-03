// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ToDoTask _$ToDoTaskFromJson(Map<String, dynamic> json) {
  return _ToDoTask.fromJson(json);
}

/// @nodoc
mixin _$ToDoTask {
  @ignore
  int get id => throw _privateConstructorUsedError;
  int get toDoListId => throw _privateConstructorUsedError;
  int get parentIndex => throw _privateConstructorUsedError;
  String? get task => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  bool get isDaily => throw _privateConstructorUsedError;
  bool get complete => throw _privateConstructorUsedError;
  DateTime? get creationDate => throw _privateConstructorUsedError;
  DateTime? get completionDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ToDoTaskCopyWith<ToDoTask> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ToDoTaskCopyWith<$Res> {
  factory $ToDoTaskCopyWith(ToDoTask value, $Res Function(ToDoTask) then) =
      _$ToDoTaskCopyWithImpl<$Res, ToDoTask>;
  @useResult
  $Res call(
      {@ignore int id,
      int toDoListId,
      int parentIndex,
      String? task,
      String? description,
      bool isDaily,
      bool complete,
      DateTime? creationDate,
      DateTime? completionDate});
}

/// @nodoc
class _$ToDoTaskCopyWithImpl<$Res, $Val extends ToDoTask>
    implements $ToDoTaskCopyWith<$Res> {
  _$ToDoTaskCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? toDoListId = null,
    Object? parentIndex = null,
    Object? task = freezed,
    Object? description = freezed,
    Object? isDaily = null,
    Object? complete = null,
    Object? creationDate = freezed,
    Object? completionDate = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      toDoListId: null == toDoListId
          ? _value.toDoListId
          : toDoListId // ignore: cast_nullable_to_non_nullable
              as int,
      parentIndex: null == parentIndex
          ? _value.parentIndex
          : parentIndex // ignore: cast_nullable_to_non_nullable
              as int,
      task: freezed == task
          ? _value.task
          : task // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      isDaily: null == isDaily
          ? _value.isDaily
          : isDaily // ignore: cast_nullable_to_non_nullable
              as bool,
      complete: null == complete
          ? _value.complete
          : complete // ignore: cast_nullable_to_non_nullable
              as bool,
      creationDate: freezed == creationDate
          ? _value.creationDate
          : creationDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      completionDate: freezed == completionDate
          ? _value.completionDate
          : completionDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ToDoTaskImplCopyWith<$Res>
    implements $ToDoTaskCopyWith<$Res> {
  factory _$$ToDoTaskImplCopyWith(
          _$ToDoTaskImpl value, $Res Function(_$ToDoTaskImpl) then) =
      __$$ToDoTaskImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@ignore int id,
      int toDoListId,
      int parentIndex,
      String? task,
      String? description,
      bool isDaily,
      bool complete,
      DateTime? creationDate,
      DateTime? completionDate});
}

/// @nodoc
class __$$ToDoTaskImplCopyWithImpl<$Res>
    extends _$ToDoTaskCopyWithImpl<$Res, _$ToDoTaskImpl>
    implements _$$ToDoTaskImplCopyWith<$Res> {
  __$$ToDoTaskImplCopyWithImpl(
      _$ToDoTaskImpl _value, $Res Function(_$ToDoTaskImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? toDoListId = null,
    Object? parentIndex = null,
    Object? task = freezed,
    Object? description = freezed,
    Object? isDaily = null,
    Object? complete = null,
    Object? creationDate = freezed,
    Object? completionDate = freezed,
  }) {
    return _then(_$ToDoTaskImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      toDoListId: null == toDoListId
          ? _value.toDoListId
          : toDoListId // ignore: cast_nullable_to_non_nullable
              as int,
      parentIndex: null == parentIndex
          ? _value.parentIndex
          : parentIndex // ignore: cast_nullable_to_non_nullable
              as int,
      task: freezed == task
          ? _value.task
          : task // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      isDaily: null == isDaily
          ? _value.isDaily
          : isDaily // ignore: cast_nullable_to_non_nullable
              as bool,
      complete: null == complete
          ? _value.complete
          : complete // ignore: cast_nullable_to_non_nullable
              as bool,
      creationDate: freezed == creationDate
          ? _value.creationDate
          : creationDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      completionDate: freezed == completionDate
          ? _value.completionDate
          : completionDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ToDoTaskImpl extends _ToDoTask {
  _$ToDoTaskImpl(
      {@ignore this.id = Isar.autoIncrement,
      required this.toDoListId,
      required this.parentIndex,
      this.task,
      this.description,
      this.isDaily = false,
      this.complete = false,
      this.creationDate,
      this.completionDate})
      : super._();

  factory _$ToDoTaskImpl.fromJson(Map<String, dynamic> json) =>
      _$$ToDoTaskImplFromJson(json);

  @override
  @JsonKey()
  @ignore
  final int id;
  @override
  final int toDoListId;
  @override
  final int parentIndex;
  @override
  final String? task;
  @override
  final String? description;
  @override
  @JsonKey()
  final bool isDaily;
  @override
  @JsonKey()
  final bool complete;
  @override
  final DateTime? creationDate;
  @override
  final DateTime? completionDate;

  @override
  String toString() {
    return 'ToDoTask(id: $id, toDoListId: $toDoListId, parentIndex: $parentIndex, task: $task, description: $description, isDaily: $isDaily, complete: $complete, creationDate: $creationDate, completionDate: $completionDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ToDoTaskImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.toDoListId, toDoListId) ||
                other.toDoListId == toDoListId) &&
            (identical(other.parentIndex, parentIndex) ||
                other.parentIndex == parentIndex) &&
            (identical(other.task, task) || other.task == task) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.isDaily, isDaily) || other.isDaily == isDaily) &&
            (identical(other.complete, complete) ||
                other.complete == complete) &&
            (identical(other.creationDate, creationDate) ||
                other.creationDate == creationDate) &&
            (identical(other.completionDate, completionDate) ||
                other.completionDate == completionDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, toDoListId, parentIndex,
      task, description, isDaily, complete, creationDate, completionDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ToDoTaskImplCopyWith<_$ToDoTaskImpl> get copyWith =>
      __$$ToDoTaskImplCopyWithImpl<_$ToDoTaskImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ToDoTaskImplToJson(
      this,
    );
  }
}

abstract class _ToDoTask extends ToDoTask {
  factory _ToDoTask(
      {@ignore final int id,
      required final int toDoListId,
      required final int parentIndex,
      final String? task,
      final String? description,
      final bool isDaily,
      final bool complete,
      final DateTime? creationDate,
      final DateTime? completionDate}) = _$ToDoTaskImpl;
  _ToDoTask._() : super._();

  factory _ToDoTask.fromJson(Map<String, dynamic> json) =
      _$ToDoTaskImpl.fromJson;

  @override
  @ignore
  int get id;
  @override
  int get toDoListId;
  @override
  int get parentIndex;
  @override
  String? get task;
  @override
  String? get description;
  @override
  bool get isDaily;
  @override
  bool get complete;
  @override
  DateTime? get creationDate;
  @override
  DateTime? get completionDate;
  @override
  @JsonKey(ignore: true)
  _$$ToDoTaskImplCopyWith<_$ToDoTaskImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
