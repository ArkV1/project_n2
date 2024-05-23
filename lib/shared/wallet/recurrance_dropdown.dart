import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_n2/models/wallet/wallet.dart';
import 'package:project_n2/models/wallet/wallet_budget.dart';
import 'package:project_n2/models/wallet/wallet_currency.dart';

class RecurranceDropdown extends ConsumerStatefulWidget {
  final TimeUnits? recurrance;
  final Function(TimeUnits timeUnits, int? amount) onSelected;

  const RecurranceDropdown({
    required this.recurrance,
    required this.onSelected,
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RecurranceDropdownState();
}

class _RecurranceDropdownState extends ConsumerState<RecurranceDropdown> {
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final recurrancies = TimeUnits.values;
    final currencies = ref.watch(currenciesProvider);
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: DropdownMenu(
            label: const Text('Time Units'),
            initialSelection: widget.recurrance?.index ?? TimeUnits.months.index,
            expandedInsets: EdgeInsets.zero,
            dropdownMenuEntries: recurrancies.map<DropdownMenuEntry<int>>((TimeUnits recurrance) {
              return DropdownMenuEntry<int>(
                value: recurrance.index,
                label: recurrance.publicName,
              );
            }).toList(),
            onSelected: (int? index) {
              widget.onSelected(recurrancies[index!], int.tryParse(amountController.text));
            },
          ),
        ),
        const VerticalDivider(
          width: 6,
        ),
        Expanded(
          flex: 4,
          child: TextField(
            controller: amountController,
            decoration: InputDecoration(
              labelText: '${widget.recurrance?.publicName ?? ''} amount',
              labelStyle: TextStyle(
                fontSize: 14,
              ),
              border: const OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }
}
