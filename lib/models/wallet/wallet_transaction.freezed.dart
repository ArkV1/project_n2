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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$WalletTransaction {
  @Id(assignable: true)
  int? get id => throw _privateConstructorUsedError;
  int get walletId => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get categorie => throw _privateConstructorUsedError;
  String? get amount => throw _privateConstructorUsedError;
  @Property(type: PropertyType.date)
  DateTime? get transactionDate => throw _privateConstructorUsedError;
  @Transient()
  Uint8List? get media => throw _privateConstructorUsedError;

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
      int walletId,
      String? name,
      String? description,
      String? categorie,
      String? amount,
      @Property(type: PropertyType.date) DateTime? transactionDate,
      @Transient() Uint8List? media});
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
    Object? walletId = null,
    Object? name = freezed,
    Object? description = freezed,
    Object? categorie = freezed,
    Object? amount = freezed,
    Object? transactionDate = freezed,
    Object? media = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      walletId: null == walletId
          ? _value.walletId
          : walletId // ignore: cast_nullable_to_non_nullable
              as int,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      categorie: freezed == categorie
          ? _value.categorie
          : categorie // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionDate: freezed == transactionDate
          ? _value.transactionDate
          : transactionDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      media: freezed == media
          ? _value.media
          : media // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
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
      int walletId,
      String? name,
      String? description,
      String? categorie,
      String? amount,
      @Property(type: PropertyType.date) DateTime? transactionDate,
      @Transient() Uint8List? media});
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
    Object? walletId = null,
    Object? name = freezed,
    Object? description = freezed,
    Object? categorie = freezed,
    Object? amount = freezed,
    Object? transactionDate = freezed,
    Object? media = freezed,
  }) {
    return _then(_$WalletTransactionImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      walletId: null == walletId
          ? _value.walletId
          : walletId // ignore: cast_nullable_to_non_nullable
              as int,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      categorie: freezed == categorie
          ? _value.categorie
          : categorie // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionDate: freezed == transactionDate
          ? _value.transactionDate
          : transactionDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      media: freezed == media
          ? _value.media
          : media // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
    ));
  }
}

/// @nodoc

@Entity(realClass: WalletTransaction)
class _$WalletTransactionImpl extends _WalletTransaction {
  _$WalletTransactionImpl(
      {@Id(assignable: true) this.id = 0,
      required this.walletId,
      this.name,
      this.description,
      this.categorie,
      this.amount,
      @Property(type: PropertyType.date) this.transactionDate,
      @Transient() this.media})
      : super._();

  @override
  @JsonKey()
  @Id(assignable: true)
  final int? id;
  @override
  final int walletId;
  @override
  final String? name;
  @override
  final String? description;
  @override
  final String? categorie;
  @override
  final String? amount;
  @override
  @Property(type: PropertyType.date)
  final DateTime? transactionDate;
  @override
  @Transient()
  final Uint8List? media;

  @override
  String toString() {
    return 'WalletTransaction(id: $id, walletId: $walletId, name: $name, description: $description, categorie: $categorie, amount: $amount, transactionDate: $transactionDate, media: $media)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WalletTransactionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.walletId, walletId) ||
                other.walletId == walletId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.categorie, categorie) ||
                other.categorie == categorie) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.transactionDate, transactionDate) ||
                other.transactionDate == transactionDate) &&
            const DeepCollectionEquality().equals(other.media, media));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      walletId,
      name,
      description,
      categorie,
      amount,
      transactionDate,
      const DeepCollectionEquality().hash(media));

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
      required final int walletId,
      final String? name,
      final String? description,
      final String? categorie,
      final String? amount,
      @Property(type: PropertyType.date) final DateTime? transactionDate,
      @Transient() final Uint8List? media}) = _$WalletTransactionImpl;
  _WalletTransaction._() : super._();

  @override
  @Id(assignable: true)
  int? get id;
  @override
  int get walletId;
  @override
  String? get name;
  @override
  String? get description;
  @override
  String? get categorie;
  @override
  String? get amount;
  @override
  @Property(type: PropertyType.date)
  DateTime? get transactionDate;
  @override
  @Transient()
  Uint8List? get media;
  @override
  @JsonKey(ignore: true)
  _$$WalletTransactionImplCopyWith<_$WalletTransactionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
