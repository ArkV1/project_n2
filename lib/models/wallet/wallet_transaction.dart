import 'package:isar/isar.dart';
import 'dart:typed_data';

import 'package:project_n2/models/wallet/wallet.dart';

part 'wallet_transaction.g.dart';

@collection
class WalletTransaction {
  Id id = Isar.autoIncrement; // Isar uses integer IDs by default

  final int walletId;

  final String? name;
  final String? description;
  final String? categorie;
  final String? amount;
  final DateTime? transactionDate;
  @ignore
  final Uint8List? media;

  @Backlink(to: "transactionsLink")
  final wallets = IsarLinks<Wallet>();

  WalletTransaction({
    required this.walletId,
    this.name,
    this.description,
    this.categorie,
    this.amount,
    this.transactionDate,
    this.media,
  });

  // Convert the object from a map
  factory WalletTransaction.fromMap(Map<String, dynamic> data) {
    return WalletTransaction(
      walletId: data['walletId'],
      name: data['name'],
      description: data['description'],
      categorie: data['categorie'],
      amount: data['amount'],
      transactionDate: data['transactionDate'] != null
          ? DateTime.parse(data['transactionDate'])
          : null,
      // media: data['media'],
    );
  }

  // Convert the object to a map
  Map<String, dynamic> toMap() {
    return {
      'walletId': walletId,
      'name': name,
      'description': description,
      'categorie': categorie,
      'amount': amount,
      'transactionDate': transactionDate?.toString(),
      // 'media': media,
    };
  }
}
