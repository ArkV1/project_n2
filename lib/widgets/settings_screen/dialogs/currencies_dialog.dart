import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_n2/models/wallet/wallet_currency.dart';

class CurrenciesDialog extends ConsumerStatefulWidget {
  const CurrenciesDialog({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CurrenciesDialogState();
}

class _CurrenciesDialogState extends ConsumerState<CurrenciesDialog> {
  @override
  Widget build(BuildContext context) {
    final currencies = ref.watch(currenciesProvider);
    return AlertDialog(
      title: Row(
        children: [
          const Spacer(),
          const Text('Currencies', textAlign: TextAlign.center),
          Expanded(
            child: currencies.isEmpty
                ? IconButton(
                    icon: const Icon(Icons.restore_page),
                    onPressed: () {
                      ref.read(currenciesProvider.notifier).spawnDefaultCurrencies();
                    },
                  )
                : Container(),
          ),
        ],
      ),
      content: SizedBox(
        width: double.minPositive,
        child: ReorderableListView(
          shrinkWrap: true,
          children: [
            for (final currency in currencies)
              ListTile(
                key: ValueKey(currency.id),
                leading: Text(
                  currency.flagEmoji ?? '',
                  style: const TextStyle(fontSize: 22),
                ),
                title: Text(currency.name),
                trailing: Text(
                  currency.symbol,
                  style: GoogleFonts.notoSans(fontSize: 18),
                ),
              ),
          ],
          onReorder: (oldIndex, newIndex) {
            // ref.read(currenciesProvider.notifier).reorder(oldIndex, newIndex);
          },
        ),
      ),
    );
  }
}
