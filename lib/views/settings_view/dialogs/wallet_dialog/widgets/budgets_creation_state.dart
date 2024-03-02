import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_n2/models/wallet/wallet.dart';
import 'package:project_n2/models/wallet/wallet_budget.dart';
import 'package:project_n2/models/wallet/wallet_currency.dart';
import 'package:project_n2/shared/wallet/currency_dropdown.dart';
import 'package:project_n2/views/settings_view/dialogs/wallet_dialog/wallets_dialog.dart';

final _formKey = GlobalKey<FormState>();

class BudgetsCreationView extends ConsumerStatefulWidget {
  final Wallet? wallet;
  final WalletBudget? budget;
  final Function(WalletBudget?) onSaved;
  const BudgetsCreationView({
    required this.wallet,
    required this.budget,
    required this.onSaved,
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BudgetsCreationViewState();
}

class _BudgetsCreationViewState extends ConsumerState<BudgetsCreationView> {
  WalletBudget? budget;

  bool isBudget = false;

  TextEditingController budgetNameController = TextEditingController();
  TextEditingController budgetAmountController = TextEditingController();

  @override
  void initState() {
    if (widget.budget == null) {
      budget = WalletBudget.def(
        name: '',
      );
    } else {
      budget = widget.budget;
      budget!.amount != null ? isBudget = true : isBudget = false;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    budget != null ? budgetNameController.text = budget!.name : budgetNameController.text = '';
    return Form(
      key: _formKey,
      child: Container(
        width: double.minPositive,
        constraints: const BoxConstraints(minWidth: 250),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: isBudget ? 'Budget' : 'Category',
                labelStyle: const TextStyle(fontSize: 12),
                hintText: 'Food, Transport, etc.',
                errorMaxLines: 3,
                errorStyle: const TextStyle(
                  overflow: TextOverflow.visible,
                ),
              ),
              controller: budgetNameController,
              onTap: () {
                //
              },
            ),
            if (isBudget)
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Budget's amount",
                  labelStyle: TextStyle(fontSize: 12),
                  hintText: '3000',
                  errorMaxLines: 3,
                  errorStyle: TextStyle(
                    overflow: TextOverflow.visible,
                  ),
                ),
                controller: budgetAmountController,
                onTap: () {
                  //
                },
              ),
            if (isBudget)
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: CurrencyDropdown(
                  currency: widget.wallet?.defaultCurrency,
                ),
              ),

            // IntrinsicWidth(
            //   child: Container(
            //     constraints: const BoxConstraints(minWidth: 250),
            //     child: TextFormField(
            //       decoration: const InputDecoration(
            //         labelText: "Currency's name",
            //         errorMaxLines: 3,
            //         errorStyle: TextStyle(
            //           overflow: TextOverflow.visible,
            //         ),
            //       ),
            //       controller: budgetNameController,
            //     ),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: CheckboxListTile(
                  title: const Text('Budget'),
                  contentPadding: const EdgeInsets.only(left: 8.0),
                  visualDensity: VisualDensity.compact,
                  value: isBudget,
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        if (value == true) {
                          budget = budget!.copyWith(amount: 0);
                          widget.onSaved(budget);
                        } else {
                          budget = budget!.copyWith(amount: null);
                          widget.onSaved(budget);
                        }
                        isBudget = value;
                      });
                    }
                  }),
            ),
            //
            Divider(
              color: Theme.of(context).dividerColor.withOpacity(0.2),
              height: 8,
            ),
            //
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () => setState(() {
                      ref
                          .read(walletsDialogStateProvider.notifier)
                          .setDialogState(WalletsDialogStates.budgetsList);
                    }),
                    child: Row(
                      children: [
                        Text('Add ${isBudget ? 'Budget' : 'Category'}'),
                        const Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Icon(Icons.add_box_outlined),
                        )
                      ],
                    ),
                  ),
                  // const VerticalDivider(),
                  // ElevatedButton(
                  //   onPressed: () => setState(() {
                  //     if (widget.currency == null) {
                  //       // ref.read(currenciesProvider.notifier).insertCurrency(
                  //       //       Wallet.smart(
                  //       //         name: walletsNameController.text,
                  //       //         // defaultCurrency: Currencies.usd,
                  //       //         // categories: defaultCategories.toList(),
                  //       //         // transactionsRelation:
                  //       //         //     ToMany<WalletTransaction>(),
                  //       //       ),
                  //       //       budgets: defaultBudgets,
                  //       //     );
                  //     } else {
                  //       // ref.read(currenciesProvider.notifier).insertCurrency(
                  //       //       widget.wallet!.copyWith(
                  //       //         name: walletsNameController.text,
                  //       //       ),
                  //       //     );
                  //     }
                  //     // ref
                  //     //     .read(walletsDialogStateProvider.notifier)
                  //     //     .setDialogState(WalletsDialogStates.currenciesList);
                  //   }),
                  //   child: const Row(
                  //     children: [
                  //       Text('Add currency'),
                  //       Padding(
                  //         padding: EdgeInsets.only(left: 6.0),
                  //         child: Icon(Icons.add_box_outlined),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
            //
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () => setState(() {
                      ref
                          .read(walletsDialogStateProvider.notifier)
                          .setDialogState(WalletsDialogStates.budgetsList);
                    }),
                    child: const Row(
                      children: [
                        Text('Return'),
                        Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Icon(Icons.keyboard_return),
                        )
                      ],
                    ),
                  ),
                  // const VerticalDivider(),
                  // ElevatedButton(
                  //   onPressed: () => setState(() {
                  //     if (widget.currency == null) {
                  //       // ref.read(currenciesProvider.notifier).insertCurrency(
                  //       //       Wallet.smart(
                  //       //         name: walletsNameController.text,
                  //       //         // defaultCurrency: Currencies.usd,
                  //       //         // categories: defaultCategories.toList(),
                  //       //         // transactionsRelation:
                  //       //         //     ToMany<WalletTransaction>(),
                  //       //       ),
                  //       //       budgets: defaultBudgets,
                  //       //     );
                  //     } else {
                  //       // ref.read(currenciesProvider.notifier).insertCurrency(
                  //       //       widget.wallet!.copyWith(
                  //       //         name: walletsNameController.text,
                  //       //       ),
                  //       //     );
                  //     }
                  //     // ref
                  //     //     .read(walletsDialogStateProvider.notifier)
                  //     //     .setDialogState(WalletsDialogStates.currenciesList);
                  //   }),
                  //   child: const Row(
                  //     children: [
                  //       Text('Add currency'),
                  //       Padding(
                  //         padding: EdgeInsets.only(left: 6.0),
                  //         child: Icon(Icons.add_box_outlined),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
