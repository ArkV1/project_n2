// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wallet_budget.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$WalletBudget {
  @Id(assignable: true)
  int? get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  ToOne<Wallet> get walletRelation => throw _privateConstructorUsedError;
  double? get amount => throw _privateConstructorUsedError;
  ToOne<Wallet> get currencyRelation => throw _privateConstructorUsedError;
  int? get recurranceTimeUnitsIndex => throw _privateConstructorUsedError;
  int? get recurranceTimeUnitsAmount => throw _privateConstructorUsedError;
  ToMany<WalletTransaction> get transactionsRelation =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WalletBudgetCopyWith<WalletBudget> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletBudgetCopyWith<$Res> {
  factory $WalletBudgetCopyWith(
          WalletBudget value, $Res Function(WalletBudget) then) =
      _$WalletBudgetCopyWithImpl<$Res, WalletBudget>;
  @useResult
  $Res call(
      {@Id(assignable: true) int? id,
      String name,
      ToOne<Wallet> walletRelation,
      double? amount,
      ToOne<Wallet> currencyRelation,
      int? recurranceTimeUnitsIndex,
      int? recurranceTimeUnitsAmount,
      ToMany<WalletTransaction> transactionsRelation});
}

/// @nodoc
class _$WalletBudgetCopyWithImpl<$Res, $Val extends WalletBudget>
    implements $WalletBudgetCopyWith<$Res> {
  _$WalletBudgetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? walletRelation = null,
    Object? amount = freezed,
    Object? currencyRelation = null,
    Object? recurranceTimeUnitsIndex = freezed,
    Object? recurranceTimeUnitsAmount = freezed,
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
      walletRelation: null == walletRelation
          ? _value.walletRelation
          : walletRelation // ignore: cast_nullable_to_non_nullable
              as ToOne<Wallet>,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      currencyRelation: null == currencyRelation
          ? _value.currencyRelation
          : currencyRelation // ignore: cast_nullable_to_non_nullable
              as ToOne<Wallet>,
      recurranceTimeUnitsIndex: freezed == recurranceTimeUnitsIndex
          ? _value.recurranceTimeUnitsIndex
          : recurranceTimeUnitsIndex // ignore: cast_nullable_to_non_nullable
              as int?,
      recurranceTimeUnitsAmount: freezed == recurranceTimeUnitsAmount
          ? _value.recurranceTimeUnitsAmount
          : recurranceTimeUnitsAmount // ignore: cast_nullable_to_non_nullable
              as int?,
      transactionsRelation: null == transactionsRelation
          ? _value.transactionsRelation
          : transactionsRelation // ignore: cast_nullable_to_non_nullable
              as ToMany<WalletTransaction>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WalletBudgetImplCopyWith<$Res>
    implements $WalletBudgetCopyWith<$Res> {
  factory _$$WalletBudgetImplCopyWith(
          _$WalletBudgetImpl value, $Res Function(_$WalletBudgetImpl) then) =
      __$$WalletBudgetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@Id(assignable: true) int? id,
      String name,
      ToOne<Wallet> walletRelation,
      double? amount,
      ToOne<Wallet> currencyRelation,
      int? recurranceTimeUnitsIndex,
      int? recurranceTimeUnitsAmount,
      ToMany<WalletTransaction> transactionsRelation});
}

/// @nodoc
class __$$WalletBudgetImplCopyWithImpl<$Res>
    extends _$WalletBudgetCopyWithImpl<$Res, _$WalletBudgetImpl>
    implements _$$WalletBudgetImplCopyWith<$Res> {
  __$$WalletBudgetImplCopyWithImpl(
      _$WalletBudgetImpl _value, $Res Function(_$WalletBudgetImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? walletRelation = null,
    Object? amount = freezed,
    Object? currencyRelation = null,
    Object? recurranceTimeUnitsIndex = freezed,
    Object? recurranceTimeUnitsAmount = freezed,
    Object? transactionsRelation = null,
  }) {
    return _then(_$WalletBudgetImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      walletRelation: null == walletRelation
          ? _value.walletRelation
          : walletRelation // ignore: cast_nullable_to_non_nullable
              as ToOne<Wallet>,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      currencyRelation: null == currencyRelation
          ? _value.currencyRelation
          : currencyRelation // ignore: cast_nullable_to_non_nullable
              as ToOne<Wallet>,
      recurranceTimeUnitsIndex: freezed == recurranceTimeUnitsIndex
          ? _value.recurranceTimeUnitsIndex
          : recurranceTimeUnitsIndex // ignore: cast_nullable_to_non_nullable
              as int?,
      recurranceTimeUnitsAmount: freezed == recurranceTimeUnitsAmount
          ? _value.recurranceTimeUnitsAmount
          : recurranceTimeUnitsAmount // ignore: cast_nullable_to_non_nullable
              as int?,
      transactionsRelation: null == transactionsRelation
          ? _value.transactionsRelation
          : transactionsRelation // ignore: cast_nullable_to_non_nullable
              as ToMany<WalletTransaction>,
    ));
  }
}

/// @nodoc

@Entity(realClass: WalletBudget)
class _$WalletBudgetImpl extends _WalletBudget {
  _$WalletBudgetImpl(
      {@Id(assignable: true) this.id = 0,
      required this.name,
      required this.walletRelation,
      this.amount,
      required this.currencyRelation,
      this.recurranceTimeUnitsIndex,
      this.recurranceTimeUnitsAmount,
      required this.transactionsRelation})
      : super._();

  @override
  @JsonKey()
  @Id(assignable: true)
  final int? id;
  @override
  final String name;
  @override
  final ToOne<Wallet> walletRelation;
  @override
  final double? amount;
  @override
  final ToOne<Wallet> currencyRelation;
  @override
  final int? recurranceTimeUnitsIndex;
  @override
  final int? recurranceTimeUnitsAmount;
  @override
  final ToMany<WalletTransaction> transactionsRelation;

  @override
  String toString() {
    return 'WalletBudget(id: $id, name: $name, walletRelation: $walletRelation, amount: $amount, currencyRelation: $currencyRelation, recurranceTimeUnitsIndex: $recurranceTimeUnitsIndex, recurranceTimeUnitsAmount: $recurranceTimeUnitsAmount, transactionsRelation: $transactionsRelation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WalletBudgetImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.walletRelation, walletRelation) ||
                other.walletRelation == walletRelation) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.currencyRelation, currencyRelation) ||
                other.currencyRelation == currencyRelation) &&
            (identical(
                    other.recurranceTimeUnitsIndex, recurranceTimeUnitsIndex) ||
                other.recurranceTimeUnitsIndex == recurranceTimeUnitsIndex) &&
            (identical(other.recurranceTimeUnitsAmount,
                    recurranceTimeUnitsAmount) ||
                other.recurranceTimeUnitsAmount == recurranceTimeUnitsAmount) &&
            const DeepCollectionEquality()
                .equals(other.transactionsRelation, transactionsRelation));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      walletRelation,
      amount,
      currencyRelation,
      recurranceTimeUnitsIndex,
      recurranceTimeUnitsAmount,
      const DeepCollectionEquality().hash(transactionsRelation));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WalletBudgetImplCopyWith<_$WalletBudgetImpl> get copyWith =>
      __$$WalletBudgetImplCopyWithImpl<_$WalletBudgetImpl>(this, _$identity);
}

abstract class _WalletBudget extends WalletBudget {
  factory _WalletBudget(
          {@Id(assignable: true) final int? id,
          required final String name,
          required final ToOne<Wallet> walletRelation,
          final double? amount,
          required final ToOne<Wallet> currencyRelation,
          final int? recurranceTimeUnitsIndex,
          final int? recurranceTimeUnitsAmount,
          required final ToMany<WalletTransaction> transactionsRelation}) =
      _$WalletBudgetImpl;
  _WalletBudget._() : super._();

  @override
  @Id(assignable: true)
  int? get id;
  @override
  String get name;
  @override
  ToOne<Wallet> get walletRelation;
  @override
  double? get amount;
  @override
  ToOne<Wallet> get currencyRelation;
  @override
  int? get recurranceTimeUnitsIndex;
  @override
  int? get recurranceTimeUnitsAmount;
  @override
  ToMany<WalletTransaction> get transactionsRelation;
  @override
  @JsonKey(ignore: true)
  _$$WalletBudgetImplCopyWith<_$WalletBudgetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
