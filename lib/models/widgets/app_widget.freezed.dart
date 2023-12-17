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

/// @nodoc
mixin _$AppWidget {
  @Id(assignable: true)
  int? get id => throw _privateConstructorUsedError;
  String get parentId => throw _privateConstructorUsedError;
  int get parentIndex => throw _privateConstructorUsedError;
  int get containedObjectTypeIndex => throw _privateConstructorUsedError;
  Map<String, dynamic>? get widgetSettingsMap =>
      throw _privateConstructorUsedError;

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
      {@Id(assignable: true) int? id,
      String parentId,
      int parentIndex,
      int containedObjectTypeIndex,
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
    Object? id = freezed,
    Object? parentId = null,
    Object? parentIndex = null,
    Object? containedObjectTypeIndex = null,
    Object? widgetSettingsMap = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      parentId: null == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as String,
      parentIndex: null == parentIndex
          ? _value.parentIndex
          : parentIndex // ignore: cast_nullable_to_non_nullable
              as int,
      containedObjectTypeIndex: null == containedObjectTypeIndex
          ? _value.containedObjectTypeIndex
          : containedObjectTypeIndex // ignore: cast_nullable_to_non_nullable
              as int,
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
      {@Id(assignable: true) int? id,
      String parentId,
      int parentIndex,
      int containedObjectTypeIndex,
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
    Object? id = freezed,
    Object? parentId = null,
    Object? parentIndex = null,
    Object? containedObjectTypeIndex = null,
    Object? widgetSettingsMap = freezed,
  }) {
    return _then(_$AppWidgetImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      parentId: null == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as String,
      parentIndex: null == parentIndex
          ? _value.parentIndex
          : parentIndex // ignore: cast_nullable_to_non_nullable
              as int,
      containedObjectTypeIndex: null == containedObjectTypeIndex
          ? _value.containedObjectTypeIndex
          : containedObjectTypeIndex // ignore: cast_nullable_to_non_nullable
              as int,
      widgetSettingsMap: freezed == widgetSettingsMap
          ? _value._widgetSettingsMap
          : widgetSettingsMap // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc

@Entity(realClass: AppWidget)
class _$AppWidgetImpl extends _AppWidget with DiagnosticableTreeMixin {
  _$AppWidgetImpl(
      {@Id(assignable: true) this.id = 0,
      required this.parentId,
      required this.parentIndex,
      required this.containedObjectTypeIndex,
      final Map<String, dynamic>? widgetSettingsMap})
      : _widgetSettingsMap = widgetSettingsMap,
        super._();

  @override
  @JsonKey()
  @Id(assignable: true)
  final int? id;
  @override
  final String parentId;
  @override
  final int parentIndex;
  @override
  final int containedObjectTypeIndex;
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
    return 'AppWidget(id: $id, parentId: $parentId, parentIndex: $parentIndex, containedObjectTypeIndex: $containedObjectTypeIndex, widgetSettingsMap: $widgetSettingsMap)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AppWidget'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('parentId', parentId))
      ..add(DiagnosticsProperty('parentIndex', parentIndex))
      ..add(DiagnosticsProperty(
          'containedObjectTypeIndex', containedObjectTypeIndex))
      ..add(DiagnosticsProperty('widgetSettingsMap', widgetSettingsMap));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppWidgetImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.parentId, parentId) ||
                other.parentId == parentId) &&
            (identical(other.parentIndex, parentIndex) ||
                other.parentIndex == parentIndex) &&
            (identical(
                    other.containedObjectTypeIndex, containedObjectTypeIndex) ||
                other.containedObjectTypeIndex == containedObjectTypeIndex) &&
            const DeepCollectionEquality()
                .equals(other._widgetSettingsMap, _widgetSettingsMap));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      parentId,
      parentIndex,
      containedObjectTypeIndex,
      const DeepCollectionEquality().hash(_widgetSettingsMap));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppWidgetImplCopyWith<_$AppWidgetImpl> get copyWith =>
      __$$AppWidgetImplCopyWithImpl<_$AppWidgetImpl>(this, _$identity);
}

abstract class _AppWidget extends AppWidget {
  factory _AppWidget(
      {@Id(assignable: true) final int? id,
      required final String parentId,
      required final int parentIndex,
      required final int containedObjectTypeIndex,
      final Map<String, dynamic>? widgetSettingsMap}) = _$AppWidgetImpl;
  _AppWidget._() : super._();

  @override
  @Id(assignable: true)
  int? get id;
  @override
  String get parentId;
  @override
  int get parentIndex;
  @override
  int get containedObjectTypeIndex;
  @override
  Map<String, dynamic>? get widgetSettingsMap;
  @override
  @JsonKey(ignore: true)
  _$$AppWidgetImplCopyWith<_$AppWidgetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
