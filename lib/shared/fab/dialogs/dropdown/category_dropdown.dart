import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_n2/core/models/app_settings.dart';
import 'package:project_n2/features/wallet/models/wallet_budget.dart';
import 'package:project_n2/shared/fab/dialogs/transaction_dialog.dart';

import '/tools/constants.dart';

class CategoryDropdown extends ConsumerStatefulWidget {
  final WalletBudget? budget;
  final List<WalletBudget> budgets;
  const CategoryDropdown({
    this.budget,
    required this.budgets,
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CategoryDropdownState();
}

class _CategoryDropdownState extends ConsumerState<CategoryDropdown> {
  WalletBudget? budget;

  @override
  Widget build(BuildContext context) {
    if (widget.budget == null) {
      budget = ref.watch(budgetValueProvider);
    } else {
      budget = widget.budget;
    }
    //String backgroundListDropdownValue = getCurrentBackground(ref);
    return DropdownButtonFormField<int>(
      decoration: InputDecoration(
        labelText: 'Category/Budget',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(26.0),
        ),
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
      ),
      value: budget?.id,
      icon: const Icon(Icons.arrow_drop_down),
      //style: const TextStyle(color: Colors.deepPurple),
      // underline: Container(
      //   height: 2,
      //   color: Colors.deepPurpleAccent,
      // ),
      onChanged: (int? value) {
        // TODO
        ref
            .read(budgetValueProvider.notifier)
            .setBudget(widget.budgets.firstWhere((element) => element.id == value));
        // ref.read(categoryValueProvider.notifier).setCategory(value!);
        // This is called when the user selects an item.
        // ref.read(themeManagerProvider.notifier).setBackground(value!);
      },
      items: widget.budgets.map<DropdownMenuItem<int>>((WalletBudget budget) {
        return DropdownMenuItem<int>(
          value: budget.id,
          child: Text(
            //style: TextStyle(color: Colors.grey),
            budget.name,
          ),
        );
      }).toList(),
    );
  }
}
