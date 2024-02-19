import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:objectbox/objectbox.dart';

import 'package:project_n2/models/wallet/wallet.dart';
import 'package:project_n2/models/wallet/wallet_transaction.dart';

part 'wallet_budget.freezed.dart';

enum Recurrance {
  unknown,
  none,
  daily,
  weekly,
  monthly,
  quarterly,
  halfYearly,
  yearly,
}

@freezed
class WalletBudget with _$WalletBudget {
  WalletBudget._();

  @Entity(realClass: WalletBudget)
  factory WalletBudget({
    @Id(assignable: true) @Default(0) int? id,
    required String name,
    double? amount,
    int? recurranceIndex,
    required ToOne<Wallet> walletRelation,
    required ToMany<WalletTransaction> transactionsRelation,
  }) = _WalletBudget;

  factory WalletBudget.def({
    @Id(assignable: true) @Default(0) int? id,
    required String name,
    double? amount,
    int? recurranceIndex,
  }) {
    return WalletBudget(
      id: id,
      name: name,
      amount: amount,
      recurranceIndex: recurranceIndex,
      walletRelation: ToOne<Wallet>(),
      transactionsRelation: ToMany<WalletTransaction>(),
    );
  }

  Wallet? get wallet => walletRelation.target;
  List<WalletTransaction>? get transactions => transactionsRelation.toList();

  Recurrance? get reccurrance {
    _ensureStableEnumValues();
    return Recurrance.values[recurranceIndex ?? 0];
  }

  void _ensureStableEnumValues() {
    assert(Recurrance.unknown.index == 0);
    assert(Recurrance.none.index == 1);
    assert(Recurrance.daily.index == 2);
    assert(Recurrance.weekly.index == 3);
    assert(Recurrance.monthly.index == 4);
    assert(Recurrance.quarterly.index == 5);
    assert(Recurrance.halfYearly.index == 6);
    assert(Recurrance.yearly.index == 7);
  }
}
