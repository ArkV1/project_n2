// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wallet_currency.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$WalletCurrency {
  @Id(assignable: true)
  int? get id => throw _privateConstructorUsedError;
  String? get emoji => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get symbol => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WalletCurrencyCopyWith<WalletCurrency> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletCurrencyCopyWith<$Res> {
  factory $WalletCurrencyCopyWith(
          WalletCurrency value, $Res Function(WalletCurrency) then) =
      _$WalletCurrencyCopyWithImpl<$Res, WalletCurrency>;
  @useResult
  $Res call(
      {@Id(assignable: true) int? id,
      String? emoji,
      String code,
      String name,
      String symbol});
}

/// @nodoc
class _$WalletCurrencyCopyWithImpl<$Res, $Val extends WalletCurrency>
    implements $WalletCurrencyCopyWith<$Res> {
  _$WalletCurrencyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? emoji = freezed,
    Object? code = null,
    Object? name = null,
    Object? symbol = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      emoji: freezed == emoji
          ? _value.emoji
          : emoji // ignore: cast_nullable_to_non_nullable
              as String?,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WalletCurrencyImplCopyWith<$Res>
    implements $WalletCurrencyCopyWith<$Res> {
  factory _$$WalletCurrencyImplCopyWith(_$WalletCurrencyImpl value,
          $Res Function(_$WalletCurrencyImpl) then) =
      __$$WalletCurrencyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@Id(assignable: true) int? id,
      String? emoji,
      String code,
      String name,
      String symbol});
}

/// @nodoc
class __$$WalletCurrencyImplCopyWithImpl<$Res>
    extends _$WalletCurrencyCopyWithImpl<$Res, _$WalletCurrencyImpl>
    implements _$$WalletCurrencyImplCopyWith<$Res> {
  __$$WalletCurrencyImplCopyWithImpl(
      _$WalletCurrencyImpl _value, $Res Function(_$WalletCurrencyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? emoji = freezed,
    Object? code = null,
    Object? name = null,
    Object? symbol = null,
  }) {
    return _then(_$WalletCurrencyImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      emoji: freezed == emoji
          ? _value.emoji
          : emoji // ignore: cast_nullable_to_non_nullable
              as String?,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@Entity(realClass: WalletCurrency)
class _$WalletCurrencyImpl extends _WalletCurrency {
  _$WalletCurrencyImpl(
      {@Id(assignable: true) this.id = 0,
      this.emoji,
      required this.code,
      required this.name,
      required this.symbol})
      : super._();

  @override
  @JsonKey()
  @Id(assignable: true)
  final int? id;
  @override
  final String? emoji;
  @override
  final String code;
  @override
  final String name;
  @override
  final String symbol;

  @override
  String toString() {
    return 'WalletCurrency(id: $id, emoji: $emoji, code: $code, name: $name, symbol: $symbol)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WalletCurrencyImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.emoji, emoji) || other.emoji == emoji) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.symbol, symbol) || other.symbol == symbol));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, emoji, code, name, symbol);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WalletCurrencyImplCopyWith<_$WalletCurrencyImpl> get copyWith =>
      __$$WalletCurrencyImplCopyWithImpl<_$WalletCurrencyImpl>(
          this, _$identity);
}

abstract class _WalletCurrency extends WalletCurrency {
  factory _WalletCurrency(
      {@Id(assignable: true) final int? id,
      final String? emoji,
      required final String code,
      required final String name,
      required final String symbol}) = _$WalletCurrencyImpl;
  _WalletCurrency._() : super._();

  @override
  @Id(assignable: true)
  int? get id;
  @override
  String? get emoji;
  @override
  String get code;
  @override
  String get name;
  @override
  String get symbol;
  @override
  @JsonKey(ignore: true)
  _$$WalletCurrencyImplCopyWith<_$WalletCurrencyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
