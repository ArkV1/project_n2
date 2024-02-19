// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wallet_transaction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$WalletTransaction {
  @Id(assignable: true)
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  double? get amount => throw _privateConstructorUsedError;
  @Property(type: PropertyType.date)
  DateTime? get date => throw _privateConstructorUsedError;
  @Transient()
  Uint8List? get media => throw _privateConstructorUsedError;
  ToOne<Wallet> get walletRelation => throw _privateConstructorUsedError;
  ToOne<WalletCurrency> get currencyRelation =>
      throw _privateConstructorUsedError;
  ToOne<WalletBudget> get walletBudgetRelation =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WalletTransactionCopyWith<WalletTransaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletTransactionCopyWith<$Res> {
  factory $WalletTransactionCopyWith(
          WalletTransaction value, $Res Function(WalletTransaction) then) =
      _$WalletTransactionCopyWithImpl<$Res, WalletTransaction>;
  @useResult
  $Res call(
      {@Id(assignable: true) int? id,
      String? name,
      String? description,
      double? amount,
      @Property(type: PropertyType.date) DateTime? date,
      @Transient() Uint8List? media,
      ToOne<Wallet> walletRelation,
      ToOne<WalletCurrency> currencyRelation,
      ToOne<WalletBudget> walletBudgetRelation});
}

/// @nodoc
class _$WalletTransactionCopyWithImpl<$Res, $Val extends WalletTransaction>
    implements $WalletTransactionCopyWith<$Res> {
  _$WalletTransactionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? amount = freezed,
    Object? date = freezed,
    Object? media = freezed,
    Object? walletRelation = null,
    Object? currencyRelation = null,
    Object? walletBudgetRelation = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      media: freezed == media
          ? _value.media
          : media // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      walletRelation: null == walletRelation
          ? _value.walletRelation
          : walletRelation // ignore: cast_nullable_to_non_nullable
              as ToOne<Wallet>,
      currencyRelation: null == currencyRelation
          ? _value.currencyRelation
          : currencyRelation // ignore: cast_nullable_to_non_nullable
              as ToOne<WalletCurrency>,
      walletBudgetRelation: null == walletBudgetRelation
          ? _value.walletBudgetRelation
          : walletBudgetRelation // ignore: cast_nullable_to_non_nullable
              as ToOne<WalletBudget>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WalletTransactionImplCopyWith<$Res>
    implements $WalletTransactionCopyWith<$Res> {
  factory _$$WalletTransactionImplCopyWith(_$WalletTransactionImpl value,
          $Res Function(_$WalletTransactionImpl) then) =
      __$$WalletTransactionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@Id(assignable: true) int? id,
      String? name,
      String? description,
      double? amount,
      @Property(type: PropertyType.date) DateTime? date,
      @Transient() Uint8List? media,
      ToOne<Wallet> walletRelation,
      ToOne<WalletCurrency> currencyRelation,
      ToOne<WalletBudget> walletBudgetRelation});
}

/// @nodoc
class __$$WalletTransactionImplCopyWithImpl<$Res>
    extends _$WalletTransactionCopyWithImpl<$Res, _$WalletTransactionImpl>
    implements _$$WalletTransactionImplCopyWith<$Res> {
  __$$WalletTransactionImplCopyWithImpl(_$WalletTransactionImpl _value,
      $Res Function(_$WalletTransactionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? amount = freezed,
    Object? date = freezed,
    Object? media = freezed,
    Object? walletRelation = null,
    Object? currencyRelation = null,
    Object? walletBudgetRelation = null,
  }) {
    return _then(_$WalletTransactionImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      media: freezed == media
          ? _value.media
          : media // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      walletRelation: null == walletRelation
          ? _value.walletRelation
          : walletRelation // ignore: cast_nullable_to_non_nullable
              as ToOne<Wallet>,
      currencyRelation: null == currencyRelation
          ? _value.currencyRelation
          : currencyRelation // ignore: cast_nullable_to_non_nullable
              as ToOne<WalletCurrency>,
      walletBudgetRelation: null == walletBudgetRelation
          ? _value.walletBudgetRelation
          : walletBudgetRelation // ignore: cast_nullable_to_non_nullable
              as ToOne<WalletBudget>,
    ));
  }
}

/// @nodoc

@Entity(realClass: WalletTransaction)
class _$WalletTransactionImpl extends _WalletTransaction {
  _$WalletTransactionImpl(
      {@Id(assignable: true) this.id,
      this.name,
      this.description,
      this.amount,
      @Property(type: PropertyType.date) this.date,
      @Transient() this.media,
      required this.walletRelation,
      required this.currencyRelation,
      required this.walletBudgetRelation})
      : super._();

  @override
  @Id(assignable: true)
  final int? id;
  @override
  final String? name;
  @override
  final String? description;
  @override
  final double? amount;
  @override
  @Property(type: PropertyType.date)
  final DateTime? date;
  @override
  @Transient()
  final Uint8List? media;
  @override
  final ToOne<Wallet> walletRelation;
  @override
  final ToOne<WalletCurrency> currencyRelation;
  @override
  final ToOne<WalletBudget> walletBudgetRelation;

  @override
  String toString() {
    return 'WalletTransaction(id: $id, name: $name, description: $description, amount: $amount, date: $date, media: $media, walletRelation: $walletRelation, currencyRelation: $currencyRelation, walletBudgetRelation: $walletBudgetRelation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WalletTransactionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.date, date) || other.date == date) &&
            const DeepCollectionEquality().equals(other.media, media) &&
            (identical(other.walletRelation, walletRelation) ||
                other.walletRelation == walletRelation) &&
            (identical(other.currencyRelation, currencyRelation) ||
                other.currencyRelation == currencyRelation) &&
            (identical(other.walletBudgetRelation, walletBudgetRelation) ||
                other.walletBudgetRelation == walletBudgetRelation));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      description,
      amount,
      date,
      const DeepCollectionEquality().hash(media),
      walletRelation,
      currencyRelation,
      walletBudgetRelation);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WalletTransactionImplCopyWith<_$WalletTransactionImpl> get copyWith =>
      __$$WalletTransactionImplCopyWithImpl<_$WalletTransactionImpl>(
          this, _$identity);
}

abstract class _WalletTransaction extends WalletTransaction {
  factory _WalletTransaction(
          {@Id(assignable: true) final int? id,
          final String? name,
          final String? description,
          final double? amount,
          @Property(type: PropertyType.date) final DateTime? date,
          @Transient() final Uint8List? media,
          required final ToOne<Wallet> walletRelation,
          required final ToOne<WalletCurrency> currencyRelation,
          required final ToOne<WalletBudget> walletBudgetRelation}) =
      _$WalletTransactionImpl;
  _WalletTransaction._() : super._();

  @override
  @Id(assignable: true)
  int? get id;
  @override
  String? get name;
  @override
  String? get description;
  @override
  double? get amount;
  @override
  @Property(type: PropertyType.date)
  DateTime? get date;
  @override
  @Transient()
  Uint8List? get media;
  @override
  ToOne<Wallet> get walletRelation;
  @override
  ToOne<WalletCurrency> get currencyRelation;
  @override
  ToOne<WalletBudget> get walletBudgetRelation;
  @override
  @JsonKey(ignore: true)
  _$$WalletTransactionImplCopyWith<_$WalletTransactionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
