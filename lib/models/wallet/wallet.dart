import 'dart:ffi';

import 'package:collection/collection.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:objectbox/objectbox.dart';
import 'package:project_n2/models/data_manager.dart';
import 'package:project_n2/objectbox.g.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'wallet_transaction.dart';

part 'wallet.freezed.dart';
part 'wallet.g.dart';

@freezed
class Wallet with _$Wallet {
  Wallet._();

  @Entity(realClass: Wallet)
  factory Wallet({
    @Id(assignable: true) int? id,
    required String name,
    required ToMany<WalletTransaction> transactionsRelation,
  }) = _Wallet;

  List<WalletTransaction>? get transactions => transactionsRelation.toList();

  // final transactions = ToMany<WalletTransaction>();
}

@riverpod
class Wallets extends _$Wallets {
  @override
  List<Wallet> build() {
    return getWallets();
  }

  // A method that retrieves all the wallets from Isar.
  List<Wallet> getWallets() {
    final wallets = db.box<Wallet>();
    return wallets.getAll();
  }

  void updateWallets() async {
    state = getWallets();
  }

  void insertWallet(Wallet wallet) {
    final wallets = db.box<Wallet>();
    // TODO Add cached id for improving speed and performance
    int? id = wallet.id;
    if (id == null || id == 0) {
      id = (wallets
                  .query()
                  .order(Wallet_.id, flags: Order.descending)
                  .build()
                  .findFirst()
                  ?.id ??
              0) +
          1;
    }
    wallets.put(wallet.copyWith(id: id));
    updateWallets();
  }

  Future<void> insertWalletTransaction(WalletTransaction transaction,
      {Wallet? wallet}) async {
    final transactions = db.box<WalletTransaction>();
    final wallets = db.box<Wallet>();
    // TODO Add cached id for improving speed and performance
    int? id = transaction.id;
    if (id == null || id == 0) {
      id = (transactions
                  .query()
                  .order(WalletTransaction_.id, flags: Order.descending)
                  .build()
                  .findFirst()
                  ?.id ??
              0) +
          1;
    }
    wallet ??= wallets.get(transaction.walletId);
    transaction.walletRelation.target = wallet;
    WalletTransaction addedTransaction =
        await transactions.putAndGetAsync(transaction.copyWith(id: id));
    wallet!.transactionsRelation.add(addedTransaction);
    wallets.put(wallet);
    // wallet!.transactionsLink.add(addedTransaction);
    // await wallet.transactionsLink.save();
    updateWallets();
  }

  Future<void> deleteWallet(Wallet wallet) async {
    final wallets = db.box<Wallet>();
    wallets.remove(wallet.id!);
    updateWallets();
  }

  Future<void> deleteWalletTransaction(
      WalletTransaction transactionToRemove) async {
    final transacions = db.box<WalletTransaction>();
    final wallets = db.box<Wallet>();
    await transacions.removeAsync(transactionToRemove.id!);
    updateWallets();
  }

  // Future<int> calculateTotal(Wallet wallet) async {
  //   return ref.read(databaseProvider.future).then((isar) async {
  //     final transactions = await isar.walletTransactions
  //         .where()
  //         .filter()
  //         .walletIdEqualTo(wallet.id)
  //         .findAll();
  //     int total = 0;
  //     for (var transaction in transactions) {
  //       total += int.tryParse(transaction.amount!) ?? 0;
  //     }
  //     return total;
  //   });
  // }
}

// @riverpod
// Future<Wallet?> wallet(WalletRef ref, {required int walletId}) async {
//   final walletsList = await ref.watch(walletsProvider.future);
//   return walletsList.firstWhereOrNull((wallet) => wallet.id == walletId);
//   // return ref.listen(walletsProvider.future, (previous, next) async {
//   //   final previousWallet = await previous?.then((previousWalletsList) =>
//   //       previousWalletsList.singleWhere((wallet) => wallet.id == walletId));
//   //   final nextWallet = await next.then((nextWalletsList) =>
//   //       nextWalletsList.singleWhere((wallet) => wallet.id == walletId));
//   //   if (previousWallet != nextWallet) {
//   //     return nextWallet;
//   //   } else {
//   //     return previousWallet;
//   //   }
//   // });

//   // final json = await http.get('api/user/$userId');
//   // return User.fromJson(json);
// }

@riverpod
class WalletById extends _$WalletById {
  @override
  FutureOr<Wallet?> build({required int walletId}) async {
    final walletsList = ref.watch(walletsProvider);
    return walletsList.firstWhereOrNull((wallet) => wallet.id == walletId);
  }
  // Add methods to mutate the state
}

@riverpod
class TotalOfWalletById extends _$TotalOfWalletById {
  @override
  FutureOr<int?> build({required int walletId}) async {
    return await ref
        .watch(walletByIdProvider(walletId: walletId).future)
        .then((wallet) {
      int total = 0;
      for (var transaction in wallet!.transactions!) {
        total += int.tryParse(transaction.amount!) ?? 0;
      }
      return total;
    });
  }
  // Add methods to mutate the state
}
