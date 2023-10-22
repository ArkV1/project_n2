import 'package:isar/isar.dart';
import 'wallet_transaction.dart';

part 'wallet.g.dart';

@collection
class Wallet {
  Id id = Isar.autoIncrement; // Isar uses integer IDs by default

  final String name;

  final transactionsLink = IsarLinks<WalletTransaction>();

  @ignore
  List<WalletTransaction> get transactions => transactionsLink.toList();

  Wallet({
    required this.name,
    //required this.transactions,
  });

  // Convert the object from a map
  factory Wallet.fromMap(Map<String, dynamic> data) {
    return Wallet(
      name: data['name'],
      // transactions: (data['transactions'] as List)
      //     .map((x) => WalletTransacton.fromMap(x))
      //     .toList(),
    );
  }

  // Convert the object to a map
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      // 'transactions': transactions.map((x) => x.toMap()).toList(),
    };
  }
}
