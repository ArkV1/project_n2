// ignore_for_file: non_constant_identifier_names

import './transaction.dart';

class Wallet {
  final String walletName;
  final String defaultCurrency;
  final List<Transaction>? transactions;

  Wallet(
    this.walletName,
    this.defaultCurrency, [
    this.transactions,
  ]);

  factory Wallet.fromFirestore(
    Map<String, dynamic> data,
  ) {
    return Wallet(
      data['walletName'],
      data['defaultCurrency'],
      // List<Transaction>.from(
      //     data['questions'].map((x) => Transaction.fromFirestore(x))),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'walletName': walletName,
      'defaultCurrency': defaultCurrency,
      // if (transactions != null)
      //   'transactions':
      //       List<dynamic>.from(transactions!.map((x) => x.toFirestore())),
    };
  }
}
