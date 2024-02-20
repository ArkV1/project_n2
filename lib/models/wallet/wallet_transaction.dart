import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:objectbox/objectbox.dart';

import 'package:project_n2/models/wallet/wallet.dart';
import 'package:project_n2/models/wallet/wallet_currency.dart';
import 'package:project_n2/models/wallet/wallet_budget.dart';

import 'package:project_n2/widgets/actions/dialogs/transaction_dialog.dart';

part 'wallet_transaction.freezed.dart';

@freezed
class WalletTransaction with _$WalletTransaction {
  WalletTransaction._();

  @Entity(realClass: WalletTransaction)
  factory WalletTransaction({
    @Id(assignable: true) int? id,
    String? name,
    String? description,
    double? amount,
    @Property(type: PropertyType.date) DateTime? date,
    @Transient() Uint8List? media,
    required ToOne<Wallet> walletRelation,
    required ToOne<WalletCurrency> currencyRelation,
    required ToOne<WalletBudget> walletBudgetRelation,
  }) = _WalletTransaction;

  factory WalletTransaction.smart({
    @Id(assignable: true) int? id,
    String? name,
    String? description,
    double? amount,
    @Property(type: PropertyType.date) DateTime? date,
    @Transient() Uint8List? media,
  }) {
    return WalletTransaction(
      id: id,
      name: name,
      description: description,
      // category: category,
      amount: amount,
      // optionalCurrencyIndex: optionalCurrency != null
      //     ? Currencies.values.indexOf(optionalCurrency)
      //     : null,
      date: date,
      media: media,
      walletRelation: ToOne<Wallet>(),
      currencyRelation: ToOne<WalletCurrency>(),
      walletBudgetRelation: ToOne<WalletBudget>(),
    );
  }

  Wallet? get wallet => walletRelation.target;
  WalletCurrency? get currency => currencyRelation.target;
  String? get category => walletBudgetRelation.target?.name;
  WalletBudget? get budget => walletBudgetRelation.target;

  //final wallet = ToOne<Wallet>();
}
