// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wallet_widget.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$WalletWidget {
  @ignore
  int get id => throw _privateConstructorUsedError;
  int get walletId => throw _privateConstructorUsedError;
  @enumerated
  WalletWidgetType get widgetType => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WalletWidgetCopyWith<WalletWidget> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletWidgetCopyWith<$Res> {
  factory $WalletWidgetCopyWith(
          WalletWidget value, $Res Function(WalletWidget) then) =
      _$WalletWidgetCopyWithImpl<$Res, WalletWidget>;
  @useResult
  $Res call(
      {@ignore int id, int walletId, @enumerated WalletWidgetType widgetType});
}

/// @nodoc
class _$WalletWidgetCopyWithImpl<$Res, $Val extends WalletWidget>
    implements $WalletWidgetCopyWith<$Res> {
  _$WalletWidgetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? walletId = null,
    Object? widgetType = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      walletId: null == walletId
          ? _value.walletId
          : walletId // ignore: cast_nullable_to_non_nullable
              as int,
      widgetType: null == widgetType
          ? _value.widgetType
          : widgetType // ignore: cast_nullable_to_non_nullable
              as WalletWidgetType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WalletWidgetImplCopyWith<$Res>
    implements $WalletWidgetCopyWith<$Res> {
  factory _$$WalletWidgetImplCopyWith(
          _$WalletWidgetImpl value, $Res Function(_$WalletWidgetImpl) then) =
      __$$WalletWidgetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@ignore int id, int walletId, @enumerated WalletWidgetType widgetType});
}

/// @nodoc
class __$$WalletWidgetImplCopyWithImpl<$Res>
    extends _$WalletWidgetCopyWithImpl<$Res, _$WalletWidgetImpl>
    implements _$$WalletWidgetImplCopyWith<$Res> {
  __$$WalletWidgetImplCopyWithImpl(
      _$WalletWidgetImpl _value, $Res Function(_$WalletWidgetImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? walletId = null,
    Object? widgetType = null,
  }) {
    return _then(_$WalletWidgetImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      walletId: null == walletId
          ? _value.walletId
          : walletId // ignore: cast_nullable_to_non_nullable
              as int,
      widgetType: null == widgetType
          ? _value.widgetType
          : widgetType // ignore: cast_nullable_to_non_nullable
              as WalletWidgetType,
    ));
  }
}

/// @nodoc

class _$WalletWidgetImpl extends _WalletWidget {
  _$WalletWidgetImpl(
      {@ignore this.id = Isar.autoIncrement,
      required this.walletId,
      @enumerated required this.widgetType})
      : super._();

  @override
  @JsonKey()
  @ignore
  final int id;
  @override
  final int walletId;
  @override
  @enumerated
  final WalletWidgetType widgetType;

  @override
  String toString() {
    return 'WalletWidget(id: $id, walletId: $walletId, widgetType: $widgetType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WalletWidgetImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.walletId, walletId) ||
                other.walletId == walletId) &&
            (identical(other.widgetType, widgetType) ||
                other.widgetType == widgetType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, walletId, widgetType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WalletWidgetImplCopyWith<_$WalletWidgetImpl> get copyWith =>
      __$$WalletWidgetImplCopyWithImpl<_$WalletWidgetImpl>(this, _$identity);
}

abstract class _WalletWidget extends WalletWidget {
  factory _WalletWidget(
          {@ignore final int id,
          required final int walletId,
          @enumerated required final WalletWidgetType widgetType}) =
      _$WalletWidgetImpl;
  _WalletWidget._() : super._();

  @override
  @ignore
  int get id;
  @override
  int get walletId;
  @override
  @enumerated
  WalletWidgetType get widgetType;
  @override
  @JsonKey(ignore: true)
  _$$WalletWidgetImplCopyWith<_$WalletWidgetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
