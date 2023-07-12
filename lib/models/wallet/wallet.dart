import 'dart:convert';

import '../transaction.dart';

class Wallet {
  String? id;

  final String name;
  //final String defaultCurrency;
  //final List<Transaction>? transactions;

  Wallet({
    required this.id,
    required this.name,
    //this.defaultCurrency, [
    //this.transactions,
    //]
  });

  factory Wallet.fromMap(
    Map<String, dynamic> data,
  ) {
    return Wallet(
      id: data['id'],
      name: data['name'],
      // List<Transaction>.from(
      //     data['questions'].map((x) => Transaction.fromFirestore(x))),
    );
  }

  factory Wallet.fromText(
    String encodedString,
  ) {
    final valueMap = json.decode(encodedString);
    return Wallet(
      id: valueMap['id'],
      name: valueMap['name'],
      // List<Transaction>.from(
      //     data['questions'].map((x) => Transaction.fromFirestore(x))),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      if (id != null) 'id': id,
      'name': name,
      // if (transactions != null)
      //   'transactions':
      //       List<dynamic>.from(transactions!.map((x) => x.toFirestore())),
    };
  }

  String toText() {
    final valueMap = {
      if (id != null) 'id': id,
      'name': name,
      // if (transactions != null)
      //   'transactions':
      //       List<dynamic>.from(transactions!.map((x) => x.toFirestore())),
    };
    return jsonEncode(valueMap);
  }
}
