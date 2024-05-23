import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:objectbox/objectbox.dart';

import 'package:project_n2/models/wallet/wallet.dart';
import 'package:project_n2/models/wallet/wallet_transaction.dart';

part 'wallet_budget.freezed.dart';

// enum Recurrance {
//   none(publicName: 'None'),
//   daily(publicName: 'Daily'),
//   weekly(publicName: 'Weekly'),
//   monthly(publicName: 'Monthly'),
//   quarterly(publicName: 'Quarterly'),
//   halfYearly(publicName: 'Half-Yearly'),
//   yearly(publicName: 'Yearly'),
//   custom(publicName: 'Custom');

//   const Recurrance({
//     required this.publicName,
//   });

//   final String publicName;
// }

enum TimeUnits {
  hours(publicName: 'Hours'),
  days(publicName: 'Days'),
  weeks(publicName: 'Weeks'),
  months(publicName: 'Months'),
  quarters(publicName: 'Quarters'),
  halfYears(publicName: 'Half-Years'),
  years(publicName: 'Years'),
  ;

  const TimeUnits({
    required this.publicName,
  });

  final String publicName;
}

@freezed
class WalletBudget with _$WalletBudget {
  WalletBudget._();

  @Entity(realClass: WalletBudget)
  factory WalletBudget({
    @Id(assignable: true) @Default(0) int? id,
    required String name,
    required ToOne<Wallet> walletRelation,
    double? amount,
    required ToOne<Wallet> currencyRelation,
    int? recurranceTimeUnitsIndex,
    int? recurranceTimeUnitsAmount,
    required ToMany<WalletTransaction> transactionsRelation,
  }) = _WalletBudget;

  factory WalletBudget.smart({
    @Id(assignable: true) @Default(0) int? id,
    required String name,
    double? amount,
    TimeUnits? timeUnits,
    int? recurranceTimeUnitsAmount,
  }) {
    return WalletBudget(
      id: id,
      name: name,
      amount: amount,
      recurranceTimeUnitsIndex: timeUnits?.index,
      recurranceTimeUnitsAmount: recurranceTimeUnitsAmount,
      walletRelation: ToOne<Wallet>(),
      currencyRelation: ToOne<Wallet>(),
      transactionsRelation: ToMany<WalletTransaction>(),
    );
  }

  bool get isCategory => amount == null;
  Wallet? get wallet => walletRelation.target;
  List<WalletTransaction>? get transactions => transactionsRelation.toList();

  TimeUnits? get timeUnits {
    // _ensureStableEnumValues();
    return TimeUnits.values[recurranceTimeUnitsIndex ?? 0];
  }

  // Recurrance? get reccurrance {
  //   // _ensureStableEnumValues();
  //   return Recurrance.values[recurranceInDays ?? 0];
  // }

  // void _ensureStableEnumValues() {
  //   assert(Recurrance.none.index == 0);
  //   assert(Recurrance.custom.index == 1);
  //   assert(Recurrance.daily.index == 2);
  //   assert(Recurrance.weekly.index == 3);
  //   assert(Recurrance.monthly.index == 4);
  //   assert(Recurrance.quarterly.index == 5);
  //   assert(Recurrance.halfYearly.index == 6);
  //   assert(Recurrance.yearly.index == 7);
  // }
}
