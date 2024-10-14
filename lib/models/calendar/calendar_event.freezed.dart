// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calendar_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CalendarEvent {
  @Id(assignable: true)
  int? get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @Property(type: PropertyType.date)
  DateTime get startTime => throw _privateConstructorUsedError;
  @Property(type: PropertyType.date)
  DateTime get endTime => throw _privateConstructorUsedError;
  bool get isAllDay => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CalendarEventCopyWith<CalendarEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalendarEventCopyWith<$Res> {
  factory $CalendarEventCopyWith(
          CalendarEvent value, $Res Function(CalendarEvent) then) =
      _$CalendarEventCopyWithImpl<$Res, CalendarEvent>;
  @useResult
  $Res call(
      {@Id(assignable: true) int? id,
      String title,
      String? description,
      @Property(type: PropertyType.date) DateTime startTime,
      @Property(type: PropertyType.date) DateTime endTime,
      bool isAllDay});
}

/// @nodoc
class _$CalendarEventCopyWithImpl<$Res, $Val extends CalendarEvent>
    implements $CalendarEventCopyWith<$Res> {
  _$CalendarEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = null,
    Object? description = freezed,
    Object? startTime = null,
    Object? endTime = null,
    Object? isAllDay = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isAllDay: null == isAllDay
          ? _value.isAllDay
          : isAllDay // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CalendarEventImplCopyWith<$Res>
    implements $CalendarEventCopyWith<$Res> {
  factory _$$CalendarEventImplCopyWith(
          _$CalendarEventImpl value, $Res Function(_$CalendarEventImpl) then) =
      __$$CalendarEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@Id(assignable: true) int? id,
      String title,
      String? description,
      @Property(type: PropertyType.date) DateTime startTime,
      @Property(type: PropertyType.date) DateTime endTime,
      bool isAllDay});
}

/// @nodoc
class __$$CalendarEventImplCopyWithImpl<$Res>
    extends _$CalendarEventCopyWithImpl<$Res, _$CalendarEventImpl>
    implements _$$CalendarEventImplCopyWith<$Res> {
  __$$CalendarEventImplCopyWithImpl(
      _$CalendarEventImpl _value, $Res Function(_$CalendarEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = null,
    Object? description = freezed,
    Object? startTime = null,
    Object? endTime = null,
    Object? isAllDay = null,
  }) {
    return _then(_$CalendarEventImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isAllDay: null == isAllDay
          ? _value.isAllDay
          : isAllDay // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

@Entity(realClass: CalendarEvent)
class _$CalendarEventImpl extends _CalendarEvent {
  _$CalendarEventImpl(
      {@Id(assignable: true) this.id = 0,
      required this.title,
      this.description,
      @Property(type: PropertyType.date) required this.startTime,
      @Property(type: PropertyType.date) required this.endTime,
      this.isAllDay = false})
      : super._();

  @override
  @JsonKey()
  @Id(assignable: true)
  final int? id;
  @override
  final String title;
  @override
  final String? description;
  @override
  @Property(type: PropertyType.date)
  final DateTime startTime;
  @override
  @Property(type: PropertyType.date)
  final DateTime endTime;
  @override
  @JsonKey()
  final bool isAllDay;

  @override
  String toString() {
    return 'CalendarEvent(id: $id, title: $title, description: $description, startTime: $startTime, endTime: $endTime, isAllDay: $isAllDay)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CalendarEventImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.isAllDay, isAllDay) ||
                other.isAllDay == isAllDay));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, title, description, startTime, endTime, isAllDay);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CalendarEventImplCopyWith<_$CalendarEventImpl> get copyWith =>
      __$$CalendarEventImplCopyWithImpl<_$CalendarEventImpl>(this, _$identity);
}

abstract class _CalendarEvent extends CalendarEvent {
  factory _CalendarEvent(
      {@Id(assignable: true) final int? id,
      required final String title,
      final String? description,
      @Property(type: PropertyType.date) required final DateTime startTime,
      @Property(type: PropertyType.date) required final DateTime endTime,
      final bool isAllDay}) = _$CalendarEventImpl;
  _CalendarEvent._() : super._();

  @override
  @Id(assignable: true)
  int? get id;
  @override
  String get title;
  @override
  String? get description;
  @override
  @Property(type: PropertyType.date)
  DateTime get startTime;
  @override
  @Property(type: PropertyType.date)
  DateTime get endTime;
  @override
  bool get isAllDay;
  @override
  @JsonKey(ignore: true)
  _$$CalendarEventImplCopyWith<_$CalendarEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
