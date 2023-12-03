import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';
import 'dart:typed_data';

import 'package:project_n2/models/wallet/wallet.dart';

part 'wallet_transaction.freezed.dart';
part 'wallet_transaction.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class WalletTransaction with _$WalletTransaction {
  WalletTransaction._();
  factory WalletTransaction({
    @ignore @Default(Isar.autoIncrement) Id id,
    required int walletId,
    String? name,
    String? description,
    String? categorie,
    String? amount,
    DateTime? transactionDate,
    @ignore Uint8List? media,
  }) = _WalletTransaction;

  @override
  // ignore: recursive_getters
  Id get id => id;

  // factory WalletTransaction.fromJson(Map<String, dynamic> json) =>
  //     _$WalletTransactionFromJson(json);

  @Backlink(to: 'transactionsLink')
  final wallets = IsarLinks<Wallet>();
}
