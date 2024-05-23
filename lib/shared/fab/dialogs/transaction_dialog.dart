import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:project_n2/models/app_settings.dart';
import 'package:project_n2/models/wallet/wallet.dart';
import 'package:project_n2/models/wallet/wallet_budget.dart';
import 'package:project_n2/models/wallet/wallet_transaction.dart';
import 'package:project_n2/objectbox.g.dart';
import 'package:project_n2/shared/fab/dialogs/dropdown/category_dropdown.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'transaction_dialog.g.dart';

class TransactionDialog extends ConsumerStatefulWidget {
  final WalletTransaction? transaction;
  const TransactionDialog({this.transaction, super.key});

  @override
  ConsumerState<TransactionDialog> createState() => _TransactionDialogState();
}

class _TransactionDialogState extends ConsumerState<TransactionDialog> {
  bool more = false;

  TextEditingController transactionNameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  WalletBudget? budget;
  String? category;

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
    super.initState();
    if (widget.transaction != null) {
      Future.microtask(
        () => ref.read(budgetValueProvider.notifier).setBudget(
              widget.transaction?.budget,
            ),
      );
      // Future.delayed(Duration.zero, () {
      //   ref.read(budgetValueProvider.notifier).setBudget(
      //         widget.transaction?.budget,
      //       );
      // });
      // WidgetsBinding.instance.addPostFrameCallback((_) {
      //   ref.read(budgetValueProvider.notifier).setBudget(
      //         widget.transaction?.budget,
      //       );
      // });
    }
  }

  @override
  Widget build(BuildContext context) {
    // final wallets = ref.watch(dataManagerProvider).wallets;
    final transaction = widget.transaction;
    WalletBudget? budget = ref.watch(budgetValueProvider);
    final wallets = ref.watch(walletsProvider);
    final currentWallet = wallets[ref.read(screenIndexProvider)];
    // TODO - fix this
    //  final Wallet? currentWallet =
    //     wallets.isEmpty ? null : wallets[ref.watch(screenIndexProvider)];
    if (transaction != null) {
      transactionNameController.text = widget.transaction!.name ?? '';
      amountController.text = widget.transaction!.amount?.toString() ?? '';
      category = widget.transaction!.category;
      selectedDate = widget.transaction!.date;
    }
    return AlertDialog(
      title: Text(
        transaction == null ? 'New transaction' : 'Edit transaction\nID: ${transaction.id}',
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                label: const Text('Transaction name'),
                hintText: 'Groceries',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(26.0),
                ),
                isDense: more ? true : false,
              ),
              controller: transactionNameController,
            ),
            if (more)
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    label: const Text('Description'),
                    hintText: 'Walmart',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(28.0),
                    ),
                  ),
                  controller: descriptionController,
                ),
              ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0, bottom: 8.0),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  label: const Text('Amount'),
                  hintText: '39.99',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(26.0),
                  ),
                  isDense: more ? true : false,
                ),
                controller: amountController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: CategoryDropdown(
                budget: budget,
                budgets: currentWallet.budgets ?? [],
                // category: category,
                // categories: currentWallet.categories ?? [],
              ),
            ),
            //
            if (more)
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: selectedDate == null ? 1 : 3,
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
                            borderRadius: BorderRadius.circular(26.0),
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
                      flex: selectedDate == null ? 1 : 4,
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
                            borderRadius: BorderRadius.circular(26.0),
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
            // ElevatedButton(
            //   onPressed: () => _selectDate(context),
            //   child: Text(selectedDate == null
            //       ? 'Select date'
            //       : formatter.format(selectedDate!)),
            // ),
            //
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      more = !more;
                    });
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text('More'),
                      Icon(
                        more ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: ElevatedButton(
                onPressed: () {
                  // int latestId = 0;
                  // try {
                  //   latestId = int.parse(currentWallet.transactions.last.id!);
                  // } on Exception catch (e) {
                  //   // TODO
                  // }
                  // print(currentWallet.id!);
                  print(amountController.text);
                  final formattedAmount = amountController.text.replaceAll(" ", "");
                  double amount = double.tryParse(formattedAmount) ?? 0;
                  // If the amount does not start with '+' or '-', make it negative
                  if (!formattedAmount.startsWith('+') && !formattedAmount.startsWith('-')) {
                    amount = -amount.abs();
                  }
                  if (widget.transaction == null) {
                    // CREATE NEW TRANSACTION
                    ref.read(walletsProvider.notifier).insertWalletTransaction(
                          currentWallet,
                          WalletTransaction.smart(
                            name: transactionNameController.text,
                            amount: amount,
                          ),
                          budget: budget,
                        );
                  } else {
                    // SAVE EDITED TRANSACTION
                    ref.read(walletsProvider.notifier).insertWalletTransaction(
                          currentWallet,
                          widget.transaction!.copyWith(
                            name: transactionNameController.text,
                            amount: amount,
                            // category: category,
                          ),
                          budget: budget,
                        );
                  }
                  Navigator.pop(context);
                },
                child: Text(transaction == null ? 'Add' : 'Save'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

@riverpod
class BudgetValue extends _$BudgetValue {
  @override
  WalletBudget? build() {
    return null;
  }

  void setBudget(WalletBudget? budget) {
    state = budget;
  }

  // Add methods to mutate the state
}
