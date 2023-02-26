class Transaction {
  final String title;
  final double amount;
  final DateTime date;
  final String? currency;

  Transaction(this.title, this.amount, this.date, [this.currency]);

  factory Transaction.fromFirestore(
    Map<String, dynamic> data,
  ) {
    return Transaction(
      data['title'],
      data['amount'],
      data['date'].toDate(),
      data['currency'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      "title": title,
      "amount": amount,
      "date": date,
      if (currency != null) "currency": currency,
    };
  }
}
