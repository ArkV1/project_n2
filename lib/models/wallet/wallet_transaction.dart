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
    @Id(assignable: true) @Default(0) int? id,
    required int walletId,
    String? name,
    String? description,
    String? categorie,
    String? amount,
    @Property(type: PropertyType.date) DateTime? transactionDate,
    @Transient() Uint8List? media,
  }) = _WalletTransaction;

  final wallet = ToOne<Wallet>();
}
