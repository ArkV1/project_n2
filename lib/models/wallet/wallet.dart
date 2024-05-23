import 'dart:ffi';

import 'package:collection/collection.dart';

// Static class model, db model, provider
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:objectbox/objectbox.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
//

import 'package:project_n2/models/objectbox.dart';
import 'package:project_n2/models/shared_prefs.dart';
import 'package:project_n2/models/wallet/wallet_currency.dart';
import 'package:project_n2/objectbox.g.dart';

import 'package:project_n2/models/wallet/wallet_transaction.dart';
import 'package:project_n2/models/wallet/wallet_budget.dart';

part 'wallet.freezed.dart';
part 'wallet.g.dart';

@freezed
class Wallet with _$Wallet {
  Wallet._();

  @Entity(realClass: Wallet)
  factory Wallet({
    @Id(assignable: true) int? id,
    required String name,
    // required List<String> categories,
    // required int? defaultCurrencyIndex,
    required ToOne<WalletCurrency> defaultCurrencyRelation,
    required ToMany<WalletBudget> budgetsRelation,
    required ToMany<WalletTransaction> transactionsRelation,
  }) = _Wallet;

  factory Wallet.smart({
    @Id(assignable: true) @Default(0) int? id,
    required String name,
    // required Currencies defaultCurrency,
  }) {
    return Wallet(
      id: id,
      name: name,
      defaultCurrencyRelation: ToOne<WalletCurrency>(),
      budgetsRelation: ToMany<WalletBudget>(),
      transactionsRelation: ToMany<WalletTransaction>(),
    );
  }

  WalletCurrency? get defaultCurrency => defaultCurrencyRelation.target;
  List<String>? get categories => budgets?.map((e) => e.name).toList();
  List<WalletBudget>? get budgets => budgetsRelation.toList();
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
    // _ensureStableEnumValues();
    final wallets = db.box<Wallet>();
    return wallets.getAll();
  }

  void updateWallets() async {
    state = getWallets();
  }

  void insertWallet(Wallet wallet, {List<WalletBudget>? budgets}) async {
    final wallets = db.box<Wallet>();
    // TODO Add cached id for improving speed and performance
    int? id = wallet.id;
    if (id == null || id == 0) {
      id = (wallets.query().order(Wallet_.id, flags: Order.descending).build().findFirst()?.id ??
              0) +
          1;
    }
    wallet = await wallets.putAndGetAsync(wallet.copyWith(id: id));
    if (budgets != null) {
      insertWalletBudget(wallet, budgets, silent: true);
    }
    updateWallets();
  }

  Future<void> insertWalletTransaction(
    Wallet wallet,
    WalletTransaction transaction, {
    WalletBudget? budget,
  }) async {
    print(budget);
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
    // wallet ??= wallets.get(transaction.walletId);
    transaction.walletRelation.target = wallet;
    if (budget != null) transaction.walletBudgetRelation.target = budget;
    wallet.transactionsRelation.add(
      await transactions.putAndGetAsync(
        transaction.copyWith(id: id),
      ),
    );
    wallets.put(wallet);
    // wallet!.transactionsLink.add(addedTransaction);
    // await wallet.transactionsLink.save();
    updateWallets();
  }

  Future<void> insertWalletBudget(Wallet wallet, List<WalletBudget> budgetsToInsert,
      {bool silent = false}) async {
    final wallets = db.box<Wallet>();
    final budgets = db.box<WalletBudget>();
    // TODO Add cached id for improving speed and performance
    for (var budget in budgetsToInsert) {
      int? id = budget.id;
      if (id == null || id == 0) {
        id = (budgets
                    .query()
                    .order(WalletBudget_.id, flags: Order.descending)
                    .build()
                    .findFirst()
                    ?.id ??
                0) +
            1;
      }
      budget.walletRelation.target = wallet;
      wallet.budgetsRelation.add(
        await budgets.putAndGetAsync(
          budget.copyWith(id: id),
        ),
      );
    }
    wallets.put(wallet);
    // budgets.put(budget.copyWith(id: id));
    if (!silent) updateWallets();
  }

  Future<void> setDefaultCurrency(Wallet wallet, WalletCurrency currency) async {
    wallet.defaultCurrencyRelation.target = currency;
    final wallets = db.box<Wallet>();
    wallets.put(wallet);
    updateWallets();
  }

  Future<void> deleteWallet(Wallet wallet) async {
    final wallets = db.box<Wallet>();
    wallets.remove(wallet.id!);
    updateWallets();
  }

  Future<void> deleteWalletTransaction(WalletTransaction transactionToRemove) async {
    final transacions = db.box<WalletTransaction>();
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

  // void _ensureStableEnumValues() {
  //   assert(Currencies.usd.index == 0);
  //   assert(Currencies.eur.index == 1);
  //   assert(Currencies.gbp.index == 2);
  //   assert(Currencies.jpy.index == 3);
  //   assert(Currencies.cad.index == 4);
  //   assert(Currencies.aud.index == 5);
  //   assert(Currencies.chf.index == 6);
  //   assert(Currencies.cny.index == 7);
  //   assert(Currencies.inr.index == 8);
  //   assert(Currencies.rub.index == 9);
  //   assert(Currencies.nis.index == 10);
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
  Wallet? build({required int? walletId}) {
    final walletsList = ref.watch(walletsProvider);
    return walletsList.firstWhereOrNull((wallet) => wallet.id == walletId);
  }
  // Add methods to mutate the state
}

@riverpod
class DefaultWallet extends _$DefaultWallet {
  @override
  Wallet? build() {
    final defaultWalletId = ref.read(sharedPrefsProvider.notifier).getInt('defaultWalletId');
    return defaultWalletId != null
        ? ref.read(walletByIdProvider(walletId: defaultWalletId))
        : ref.read(walletsProvider).firstOrNull;
  }

  // Add methods to mutate the state
  setDefaultWallet({required int? walletId}) {
    final newDefaultWallet = ref.read(walletByIdProvider(walletId: walletId));
    if (newDefaultWallet != null) {
      ref.read(sharedPrefsProvider.notifier).setInt('defaultWalletId', walletId!);
      state = newDefaultWallet;
    }
  }
}

@riverpod
class TotalOfWalletById extends _$TotalOfWalletById {
  @override
  FutureOr<double?> build({required int walletId}) async {
    final wallet = ref.watch(walletByIdProvider(walletId: walletId));
    double total = 0;
    for (var transaction in wallet!.transactions!) {
      total += transaction.amount ?? 0;
    }
    return total;
  }
  // Add methods to mutate the state
}

Set<String> defaultCategories = {
  'Food',
  'Transport',
  'Entertainment',
  'Shopping',
  'Health',
  'Education',
  'Gifts',
  'Other',
};

final defaultBudgets = defaultCategories
    .map(
      (category) => WalletBudget.smart(
        name: category,
      ),
    )
    .toList();
