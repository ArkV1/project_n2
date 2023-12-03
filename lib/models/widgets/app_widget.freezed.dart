// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_widget.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AppWidget _$AppWidgetFromJson(Map<String, dynamic> json) {
  return _AppWidget.fromJson(json);
}

/// @nodoc
mixin _$AppWidget {
  @ignore
  int get id => throw _privateConstructorUsedError;
  String get parentId => throw _privateConstructorUsedError;
  int get parentIndex => throw _privateConstructorUsedError;
  @enumerated
  ContainedObjectType get containedObjectType =>
      throw _privateConstructorUsedError;
  Map<String, dynamic>? get widgetSettingsMap =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppWidgetCopyWith<AppWidget> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppWidgetCopyWith<$Res> {
  factory $AppWidgetCopyWith(AppWidget value, $Res Function(AppWidget) then) =
      _$AppWidgetCopyWithImpl<$Res, AppWidget>;
  @useResult
  $Res call(
      {@ignore int id,
      String parentId,
      int parentIndex,
      @enumerated ContainedObjectType containedObjectType,
      Map<String, dynamic>? widgetSettingsMap});
}

/// @nodoc
class _$AppWidgetCopyWithImpl<$Res, $Val extends AppWidget>
    implements $AppWidgetCopyWith<$Res> {
  _$AppWidgetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? parentId = null,
    Object? parentIndex = null,
    Object? containedObjectType = null,
    Object? widgetSettingsMap = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      parentId: null == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as String,
      parentIndex: null == parentIndex
          ? _value.parentIndex
          : parentIndex // ignore: cast_nullable_to_non_nullable
              as int,
      containedObjectType: null == containedObjectType
          ? _value.containedObjectType
          : containedObjectType // ignore: cast_nullable_to_non_nullable
              as ContainedObjectType,
      widgetSettingsMap: freezed == widgetSettingsMap
          ? _value.widgetSettingsMap
          : widgetSettingsMap // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppWidgetImplCopyWith<$Res>
    implements $AppWidgetCopyWith<$Res> {
  factory _$$AppWidgetImplCopyWith(
          _$AppWidgetImpl value, $Res Function(_$AppWidgetImpl) then) =
      __$$AppWidgetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@ignore int id,
      String parentId,
      int parentIndex,
      @enumerated ContainedObjectType containedObjectType,
      Map<String, dynamic>? widgetSettingsMap});
}

/// @nodoc
class __$$AppWidgetImplCopyWithImpl<$Res>
    extends _$AppWidgetCopyWithImpl<$Res, _$AppWidgetImpl>
    implements _$$AppWidgetImplCopyWith<$Res> {
  __$$AppWidgetImplCopyWithImpl(
      _$AppWidgetImpl _value, $Res Function(_$AppWidgetImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? parentId = null,
    Object? parentIndex = null,
    Object? containedObjectType = null,
    Object? widgetSettingsMap = freezed,
  }) {
    return _then(_$AppWidgetImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      parentId: null == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as String,
      parentIndex: null == parentIndex
          ? _value.parentIndex
          : parentIndex // ignore: cast_nullable_to_non_nullable
              as int,
      containedObjectType: null == containedObjectType
          ? _value.containedObjectType
          : containedObjectType // ignore: cast_nullable_to_non_nullable
              as ContainedObjectType,
      widgetSettingsMap: freezed == widgetSettingsMap
          ? _value._widgetSettingsMap
          : widgetSettingsMap // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppWidgetImpl extends _AppWidget with DiagnosticableTreeMixin {
  _$AppWidgetImpl(
      {@ignore this.id = Isar.autoIncrement,
      required this.parentId,
      required this.parentIndex,
      @enumerated required this.containedObjectType,
      final Map<String, dynamic>? widgetSettingsMap})
      : _widgetSettingsMap = widgetSettingsMap,
        super._();

  factory _$AppWidgetImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppWidgetImplFromJson(json);

  @override
  @JsonKey()
  @ignore
  final int id;
  @override
  final String parentId;
  @override
  final int parentIndex;
  @override
  @enumerated
  final ContainedObjectType containedObjectType;
  final Map<String, dynamic>? _widgetSettingsMap;
  @override
  Map<String, dynamic>? get widgetSettingsMap {
    final value = _widgetSettingsMap;
    if (value == null) return null;
    if (_widgetSettingsMap is EqualUnmodifiableMapView)
      return _widgetSettingsMap;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AppWidget(id: $id, parentId: $parentId, parentIndex: $parentIndex, containedObjectType: $containedObjectType, widgetSettingsMap: $widgetSettingsMap)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AppWidget'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('parentId', parentId))
      ..add(DiagnosticsProperty('parentIndex', parentIndex))
      ..add(DiagnosticsProperty('containedObjectType', containedObjectType))
      ..add(DiagnosticsProperty('widgetSettingsMap', widgetSettingsMap));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppWidgetImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.parentId, parentId) ||
                other.parentId == parentId) &&
            (identical(other.parentIndex, parentIndex) ||
                other.parentIndex == parentIndex) &&
            (identical(other.containedObjectType, containedObjectType) ||
                other.containedObjectType == containedObjectType) &&
            const DeepCollectionEquality()
                .equals(other._widgetSettingsMap, _widgetSettingsMap));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      parentId,
      parentIndex,
      containedObjectType,
      const DeepCollectionEquality().hash(_widgetSettingsMap));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppWidgetImplCopyWith<_$AppWidgetImpl> get copyWith =>
      __$$AppWidgetImplCopyWithImpl<_$AppWidgetImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppWidgetImplToJson(
      this,
    );
  }
}

abstract class _AppWidget extends AppWidget {
  factory _AppWidget(
      {@ignore final int id,
      required final String parentId,
      required final int parentIndex,
      @enumerated required final ContainedObjectType containedObjectType,
      final Map<String, dynamic>? widgetSettingsMap}) = _$AppWidgetImpl;
  _AppWidget._() : super._();

  factory _AppWidget.fromJson(Map<String, dynamic> json) =
      _$AppWidgetImpl.fromJson;

  @override
  @ignore
  int get id;
  @override
  String get parentId;
  @override
  int get parentIndex;
  @override
  @enumerated
  ContainedObjectType get containedObjectType;
  @override
  Map<String, dynamic>? get widgetSettingsMap;
  @override
  @JsonKey(ignore: true)
  _$$AppWidgetImplCopyWith<_$AppWidgetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
