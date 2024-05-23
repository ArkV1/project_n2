import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_n2/models/wallet/wallet.dart';
import 'package:project_n2/models/wallet/wallet_currency.dart';

class CurrencyDropdown extends ConsumerStatefulWidget {
  final WalletCurrency? currency;
  final Null Function(dynamic currency) onSelected;

  const CurrencyDropdown({
    required this.currency,
    required this.onSelected,
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CurrencyDropdownState();
}

class _CurrencyDropdownState extends ConsumerState<CurrencyDropdown> {
  @override
  Widget build(BuildContext context) {
    final currencies = ref.watch(currenciesProvider);
    return DropdownMenu(
      label: const Text('Currency'),
      initialSelection: widget.currency?.id ?? currencies.first.id!,
      expandedInsets: EdgeInsets.zero,
      dropdownMenuEntries: currencies.map<DropdownMenuEntry<int>>((WalletCurrency currency) {
        return DropdownMenuEntry<int>(
          value: currency.id!,
          leadingIcon: Text(currency.emoji ?? ''),
          label: currency.code,
          labelWidget: Text(currency.name),
          trailingIcon: Text(currency.symbol, style: GoogleFonts.notoSans()),
        );
      }).toList(),
    );
  }
}
