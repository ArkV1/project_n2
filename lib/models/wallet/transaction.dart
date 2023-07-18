class Transaction {
  String? id;
  String walletId;
  String name;
  String amount;

  Transaction({
    this.id,
    required this.walletId,
    required this.name,
    required this.amount,
  });
}
