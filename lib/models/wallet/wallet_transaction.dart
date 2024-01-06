import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:objectbox/objectbox.dart';
import 'dart:typed_data';

import 'package:project_n2/models/wallet/wallet.dart';

part 'wallet_transaction.freezed.dart';

@freezed
class WalletTransaction with _$WalletTransaction {
  WalletTransaction._();

  @Entity(realClass: WalletTransaction)
  factory WalletTransaction({
    @Id(assignable: true) int? id,
    required int walletId,
    String? name,
    String? description,
    String? category,
    String? amount,
    String? optionalCurrency,
    @Property(type: PropertyType.date) DateTime? transactionDate,
    @Transient() Uint8List? media,
    required ToOne<Wallet> walletRelation,
  }) = _WalletTransaction;

  Wallet? get wallet => walletRelation.target;

  //final wallet = ToOne<Wallet>();
}
