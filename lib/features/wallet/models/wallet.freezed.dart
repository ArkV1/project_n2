// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wallet.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Wallet {
  @Id(assignable: true)
  int? get id => throw _privateConstructorUsedError;
  String get name =>
      throw _privateConstructorUsedError; // required List<String> categories,
// required int? defaultCurrencyIndex,
  ToOne<WalletCurrency> get defaultCurrencyRelation =>
      throw _privateConstructorUsedError;
  ToMany<WalletBudget> get budgetsRelation =>
      throw _privateConstructorUsedError;
  ToMany<WalletTransaction> get transactionsRelation =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WalletCopyWith<Wallet> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletCopyWith<$Res> {
  factory $WalletCopyWith(Wallet value, $Res Function(Wallet) then) =
      _$WalletCopyWithImpl<$Res, Wallet>;
  @useResult
  $Res call(
      {@Id(assignable: true) int? id,
      String name,
      ToOne<WalletCurrency> defaultCurrencyRelation,
      ToMany<WalletBudget> budgetsRelation,
      ToMany<WalletTransaction> transactionsRelation});
}

/// @nodoc
class _$WalletCopyWithImpl<$Res, $Val extends Wallet>
    implements $WalletCopyWith<$Res> {
  _$WalletCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? defaultCurrencyRelation = null,
    Object? budgetsRelation = null,
    Object? transactionsRelation = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      defaultCurrencyRelation: null == defaultCurrencyRelation
          ? _value.defaultCurrencyRelation
          : defaultCurrencyRelation // ignore: cast_nullable_to_non_nullable
              as ToOne<WalletCurrency>,
      budgetsRelation: null == budgetsRelation
          ? _value.budgetsRelation
          : budgetsRelation // ignore: cast_nullable_to_non_nullable
              as ToMany<WalletBudget>,
      transactionsRelation: null == transactionsRelation
          ? _value.transactionsRelation
          : transactionsRelation // ignore: cast_nullable_to_non_nullable
              as ToMany<WalletTransaction>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WalletImplCopyWith<$Res> implements $WalletCopyWith<$Res> {
  factory _$$WalletImplCopyWith(
          _$WalletImpl value, $Res Function(_$WalletImpl) then) =
      __$$WalletImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@Id(assignable: true) int? id,
      String name,
      ToOne<WalletCurrency> defaultCurrencyRelation,
      ToMany<WalletBudget> budgetsRelation,
      ToMany<WalletTransaction> transactionsRelation});
}

/// @nodoc
class __$$WalletImplCopyWithImpl<$Res>
    extends _$WalletCopyWithImpl<$Res, _$WalletImpl>
    implements _$$WalletImplCopyWith<$Res> {
  __$$WalletImplCopyWithImpl(
      _$WalletImpl _value, $Res Function(_$WalletImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? defaultCurrencyRelation = null,
    Object? budgetsRelation = null,
    Object? transactionsRelation = null,
  }) {
    return _then(_$WalletImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      defaultCurrencyRelation: null == defaultCurrencyRelation
          ? _value.defaultCurrencyRelation
          : defaultCurrencyRelation // ignore: cast_nullable_to_non_nullable
              as ToOne<WalletCurrency>,
      budgetsRelation: null == budgetsRelation
          ? _value.budgetsRelation
          : budgetsRelation // ignore: cast_nullable_to_non_nullable
              as ToMany<WalletBudget>,
      transactionsRelation: null == transactionsRelation
          ? _value.transactionsRelation
          : transactionsRelation // ignore: cast_nullable_to_non_nullable
              as ToMany<WalletTransaction>,
    ));
  }
}

/// @nodoc

@Entity(realClass: Wallet)
class _$WalletImpl extends _Wallet {
  _$WalletImpl(
      {@Id(assignable: true) this.id,
      required this.name,
      required this.defaultCurrencyRelation,
      required this.budgetsRelation,
      required this.transactionsRelation})
      : super._();

  @override
  @Id(assignable: true)
  final int? id;
  @override
  final String name;
// required List<String> categories,
// required int? defaultCurrencyIndex,
  @override
  final ToOne<WalletCurrency> defaultCurrencyRelation;
  @override
  final ToMany<WalletBudget> budgetsRelation;
  @override
  final ToMany<WalletTransaction> transactionsRelation;

  @override
  String toString() {
    return 'Wallet(id: $id, name: $name, defaultCurrencyRelation: $defaultCurrencyRelation, budgetsRelation: $budgetsRelation, transactionsRelation: $transactionsRelation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WalletImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(
                    other.defaultCurrencyRelation, defaultCurrencyRelation) ||
                other.defaultCurrencyRelation == defaultCurrencyRelation) &&
            const DeepCollectionEquality()
                .equals(other.budgetsRelation, budgetsRelation) &&
            const DeepCollectionEquality()
                .equals(other.transactionsRelation, transactionsRelation));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      defaultCurrencyRelation,
      const DeepCollectionEquality().hash(budgetsRelation),
      const DeepCollectionEquality().hash(transactionsRelation));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WalletImplCopyWith<_$WalletImpl> get copyWith =>
      __$$WalletImplCopyWithImpl<_$WalletImpl>(this, _$identity);
}

abstract class _Wallet extends Wallet {
  factory _Wallet(
          {@Id(assignable: true) final int? id,
          required final String name,
          required final ToOne<WalletCurrency> defaultCurrencyRelation,
          required final ToMany<WalletBudget> budgetsRelation,
          required final ToMany<WalletTransaction> transactionsRelation}) =
      _$WalletImpl;
  _Wallet._() : super._();

  @override
  @Id(assignable: true)
  int? get id;
  @override
  String get name;
  @override // required List<String> categories,
// required int? defaultCurrencyIndex,
  ToOne<WalletCurrency> get defaultCurrencyRelation;
  @override
  ToMany<WalletBudget> get budgetsRelation;
  @override
  ToMany<WalletTransaction> get transactionsRelation;
  @override
  @JsonKey(ignore: true)
  _$$WalletImplCopyWith<_$WalletImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
