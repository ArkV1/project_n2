import 'dart:convert';

class WalletTransacton {
  String? id;
  String walletId;
  String name;
  String amount;

  WalletTransacton({
    this.id,
    required this.walletId,
    required this.name,
    required this.amount,
  });

  factory WalletTransacton.fromMap(
    Map<String, dynamic> data,
  ) {
    return WalletTransacton(
      id: data['id'],
      walletId: data['walletId'],
      name: data['name'],
      amount: data['amount'],
      // complete: data['complete'] == 1,
      // creationDate: DateTime.parse(data['creationDate']),
      // completionDate: data['completionDate'] != null
      //     ? DateTime.parse(data['completionDate'])
      //     : null,
    );
  }

  factory WalletTransacton.fromText(
    String encodedString,
  ) {
    final valueMap = json.decode(encodedString);
    return WalletTransacton.fromMap(valueMap);
  }

  Map<String, dynamic> toMap() {
    return {
      if (id != null) 'id': id,
      'walletId': walletId,
      'name': name,
      'amount': amount,
      // 'complete': complete ? 1 : 0,
      // 'creationDate': creationDate.toString(),
      // if (completionDate != null) 'completionDate': completionDate.toString(),
    };
  }

  String toText() {
    final valueMap = toMap();
    return jsonEncode(valueMap);
  }
}
