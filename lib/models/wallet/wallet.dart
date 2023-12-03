import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';
import 'package:project_n2/models/data_manager.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'wallet_transaction.dart';

part 'wallet.freezed.dart';
part 'wallet.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class Wallet with _$Wallet {
  Wallet._();
  factory Wallet({
    @ignore @Default(Isar.autoIncrement) Id id,
    required String name,
  }) = _Wallet;

  @override
  // ignore: recursive_getters
  Id get id => id;

  // factory Wallet.fromJson(Map<String, dynamic> json) => _$WalletFromJson(json);

  final transactionsLink = IsarLinks<WalletTransaction>();

  @ignore
  List<WalletTransaction> get transactions => transactionsLink.toList();
}

@riverpod
class Wallets extends _$Wallets {
  @override
  FutureOr<List<Wallet>> build() {
    return getWallets();
  }

  // A method that retrieves all the wallets from Isar.
  Future<List<Wallet>> getWallets() async {
    return ref.read(databaseProvider.future).then((isar) {
      return isar.wallets.where().findAll();
    });
  }

  Future<void> updateWallets() async {
    return ref.read(databaseProvider.future).then((isar) async {
      state = AsyncData(await isar.wallets.where().findAll());
    });
  }

  Future<void> insertWallet(Wallet wallet) async {
    ref.read(databaseProvider.future).then((isar) async {
      await isar.writeTxn(() async {
        await isar.wallets.put(wallet);
      });
      await updateWallets();
    });
  }

  Future<void> insertWalletTransaction(WalletTransaction transaction) async {
    ref.read(databaseProvider.future).then((isar) async {
      await isar.writeTxn(() async {
        WalletTransaction addedTransaction = await isar.walletTransactions
            .put(transaction)
            .then((id) => transaction.copyWith(id: id));
        final wallet = await isar.wallets.get(transaction.walletId);
        wallet!.transactionsLink.add(addedTransaction);
        await wallet.transactionsLink.save();
      });
      await updateWallets();
    });
  }

  Future<void> deleteWallet(Wallet wallet) async {
    ref.read(databaseProvider.future).then((isar) async {
      await isar.writeTxn(() async {
        isar.wallets.delete(wallet.id);
      });
      await updateWallets();
    });
  }

  Future<void> deleteWalletTransaction(
      WalletTransaction transactionToRemove) async {
    ref.read(databaseProvider.future).then((isar) async {
      final wallet = await isar.wallets.get(transactionToRemove.walletId);
      await isar.writeTxn(() async {
        await isar.walletTransactions.delete(transactionToRemove.id);
        wallet!.transactionsLink.remove(transactionToRemove);
        await wallet.transactionsLink.save();
      });
      await updateWallets();
    });
  }

  Future<int> calculateTotal(Wallet wallet) async {
    return ref.read(databaseProvider.future).then((isar) async {
      final transactions = await isar.walletTransactions
          .where()
          .filter()
          .walletIdEqualTo(wallet.id)
          .findAll();
      int total = 0;
      for (var transaction in transactions) {
        total += int.tryParse(transaction.amount!) ?? 0;
      }
      return total;
    });
  }
}
