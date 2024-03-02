import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_n2/models/wallet/wallet_budget.dart';
import 'package:project_n2/models/wallet/wallet_currency.dart';
import 'package:project_n2/views/settings_view/dialogs/wallet_dialog/widgets/budgets_creation_state.dart';
import 'package:project_n2/views/settings_view/dialogs/wallet_dialog/widgets/budgets_list_state.dart';
import 'package:project_n2/views/settings_view/dialogs/wallet_dialog/widgets/currencies_creation_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:project_n2/models/wallet/wallet.dart';

import 'package:project_n2/views/settings_view/dialogs/wallet_dialog/widgets/wallets_list_state.dart';
import 'package:project_n2/views/settings_view/dialogs/wallet_dialog/widgets/wallets_creation_state.dart';
import 'package:project_n2/views/settings_view/dialogs/wallet_dialog/widgets/currencies_list_state.dart';

part 'wallets_dialog.g.dart';

enum WalletsDialogStates {
  walletsList,
  walletsCreation,
  budgetsList,
  budgetsCreation,
  currenciesList,
  currenciesCreation,
}

class WalletsDialog extends ConsumerStatefulWidget {
  const WalletsDialog({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _WalletsDialogState();
}

class _WalletsDialogState extends ConsumerState<WalletsDialog> {
  Wallet? wallet;
  WalletCurrency? currency;
  WalletBudget? budget;
  bool advancedSettings = false;

  @override
  Widget build(BuildContext context) {
    final dialogState = ref.watch(walletsDialogStateProvider);
    return AlertDialog(
      title: Center(
        child: () {
          switch (dialogState) {
            case WalletsDialogStates.walletsCreation:
              return Text(
                wallet != null ? 'Edit wallet' : 'Create wallet',
                textAlign: TextAlign.center,
              );
            case WalletsDialogStates.currenciesList:
              return const Text(
                'Currencies',
                textAlign: TextAlign.center,
              );
            case WalletsDialogStates.currenciesCreation:
              return const Text(
                'Create currency',
                textAlign: TextAlign.center,
              );
            case WalletsDialogStates.budgetsList:
              return const Text(
                'Categories | Budgets',
                textAlign: TextAlign.center,
              );
            case WalletsDialogStates.budgetsCreation:
              if (budget == null || budget!.isCategory) {
                return Text(
                  budget != null ? 'Edit category' : 'Create category',
                  textAlign: TextAlign.center,
                );
              } else {
                return Text(
                  budget != null ? 'Edit budget' : 'Create budget',
                  textAlign: TextAlign.center,
                );
              }
            default:
              return const Text('Wallets managment');
          }
        }(),
      ),
      content: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: () {
          switch (dialogState) {
            case WalletsDialogStates.walletsCreation:
              return WalletsCreationView(
                wallet: wallet,
              );
            case WalletsDialogStates.walletsList:
              return WalletsListView(
                onSaved: (Wallet? wallet) => this.wallet = wallet,
              );
            case WalletsDialogStates.budgetsList:
              return BudgetsListView(
                wallet: wallet,
                onSaved: (WalletBudget? budget) => this.budget = budget,
              );
            case WalletsDialogStates.budgetsCreation:
              return BudgetsCreationView(
                wallet: wallet,
                budget: budget,
                onSaved: (WalletBudget? budget) => setState(() => this.budget = budget),
              );
            case WalletsDialogStates.currenciesList:
              return const CurrenciesListView();
            case WalletsDialogStates.currenciesCreation:
              return CurrenciesCreationView(
                currency: currency,
              );
          }
        }(),
        // () {
        //   if (dialogState == DialogState.creation) {
        //     return WalletsCreationView(wallet: wallet);
        //   } else {
        //     return const WalletsListView();
        //   }
        // }(),
      ),
      // scrollable: true,
    );
  }
}

@riverpod
class WalletsDialogState extends _$WalletsDialogState {
  @override
  WalletsDialogStates build() {
    return WalletsDialogStates.walletsList;
  }

  setDialogState(WalletsDialogStates dialogState) {
    state = dialogState;
  }
}
