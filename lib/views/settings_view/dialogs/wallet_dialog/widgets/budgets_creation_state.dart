import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:project_n2/models/wallet/wallet.dart';
import 'package:project_n2/models/wallet/wallet_budget.dart';
import 'package:project_n2/models/wallet/wallet_currency.dart';
import 'package:project_n2/shared/wallet/currency_dropdown.dart';
import 'package:project_n2/shared/wallet/recurrance_dropdown.dart';
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
  bool isRecurring = false;

  TextEditingController budgetNameController = TextEditingController();
  TextEditingController budgetAmountController = TextEditingController();

  final DateFormat dateFormatter = DateFormat('dd/MM/yyyy');
  final DateFormat timeFormatter = DateFormat('HH:mm');
  DateTime? selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = DateTime(
          picked.year,
          picked.month,
          picked.day,
          selectedDate != null ? selectedDate!.hour : 12,
          selectedDate != null ? selectedDate!.minute : 0,
        );
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    // TimeOfDay? selectedTime;
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(
        selectedDate ?? DateTime.now(),
      ),
    );

    if (picked != null) {
      selectedDate ??= DateTime.now();
      setState(() {
        selectedDate = DateTime(
          selectedDate!.year,
          selectedDate!.month,
          selectedDate!.day,
          picked.hour,
          picked.minute,
        );
      });
    }
    // if (picked != null && picked != selectedTime) {
    //   setState(() {
    //     selectedTime = picked;
    //   });
    // }
  }

  @override
  void initState() {
    if (widget.budget == null) {
      budget = WalletBudget.smart(
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
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: CheckboxListTile(
                  title: const Text('Budget'),
                  contentPadding: const EdgeInsets.only(left: 5.0),
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
              color: Theme.of(context).dividerColor.withOpacity(0.3),
              height: 0,
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
                  onSelected: (currency) {
                    budget = budget!.copyWith(currencyRelation: currency);
                    widget.onSaved(budget);
                  },
                ),
              ),
            if (isBudget)
              Column(children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: CheckboxListTile(
                      title: const Text('Recurrance'),
                      contentPadding: const EdgeInsets.only(left: 5.0),
                      visualDensity: VisualDensity.compact,
                      value: isRecurring,
                      onChanged: (value) {
                        if (value != null) {
                          setState(() {
                            // if (value == true) {
                            //   budget = budget!.copyWith(amount: 0);
                            //   widget.onSaved(budget);
                            // } else {
                            //   budget = budget!.copyWith(amount: null);
                            //   widget.onSaved(budget);
                            // }
                            isRecurring = value;
                          });
                        }
                      }),
                ),
                // const Padding(
                //   padding: EdgeInsets.only(top: 6.0, left: 12.0, right: 12.0),
                //   child: Row(
                //     children: [
                //       Text(
                //         'Recurrance',
                //         textAlign: TextAlign.start,
                //       ),
                //     ],
                //   ),
                // ),
                Divider(
                  height: 3,
                  color: Theme.of(context).dividerColor.withOpacity(0.4),
                ),
              ]),
            if (isBudget && isRecurring)
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: RecurranceDropdown(
                  recurrance: widget.budget?.timeUnits,
                  onSelected: (timeUnits, amount) {
                    budget = budget!.copyWith(
                      recurranceTimeUnitsIndex: timeUnits.index,
                      recurranceTimeUnitsAmount: amount,
                    );
                    widget.onSaved(budget);
                  },
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
            if (isBudget && isRecurring)
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 6.0, right: 12, left: 12, bottom: 4),
                    child: Row(
                      children: [
                        Text(
                          'Recurrance starting point',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 3,
                    color: Theme.of(context).dividerColor.withOpacity(0.4),
                  ),
                ],
              ),
            if (isBudget && isRecurring)
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: selectedDate == null ? 1 : 4,
                      child: TextField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          label: const Text(
                            'Time',
                            maxLines: 1,
                            softWrap: false,
                          ),
                          // hintText: '2021-01-01',
                          suffixIcon: Icon(
                            MdiIcons.clock,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          isDense: true,
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 8.0,
                            horizontal: 12.0,
                          ),
                        ),
                        controller: TextEditingController(
                          text: selectedDate == null ? '' : timeFormatter.format(selectedDate!),
                        ),
                        readOnly: true,
                        onTap: () => _selectTime(context),
                      ),
                    ),
                    const VerticalDivider(
                      width: 6,
                    ),
                    Expanded(
                      flex: selectedDate == null ? 1 : 5,
                      child: TextField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          label: const Text(
                            'Date',
                            maxLines: 1,
                            softWrap: false,
                          ),
                          // hintText: '2021-01-01',
                          suffixIcon: Icon(MdiIcons.calendar),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          isDense: true,
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 8.0,
                            horizontal: 12.0,
                          ),
                        ),
                        controller: TextEditingController(
                          text: selectedDate == null ? '' : dateFormatter.format(selectedDate!),
                        ),
                        readOnly: true,
                        onTap: () => _selectDate(context),
                      ),
                    ),
                  ],
                ),
              ),
            //
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Divider(
                height: 3,
                color: Theme.of(context).dividerColor.withOpacity(0.4),
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
                      ref.read(walletsProvider.notifier).insertWalletBudget(
                        widget.wallet!,
                        [
                          budget!.copyWith(
                            name: budgetNameController.text,
                            amount: isBudget ? double.parse(budgetAmountController.text) : null,
                          ),
                        ],
                      );
                      // WalletCurrency(
                      //   emoji: emojiController.text,www
                      //   code: shortNameController.text,
                      //   name: nameController.text,
                      //   symbol: symbolController.text,
                      // ),

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
