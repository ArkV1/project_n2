import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:project_n2/models/wallet/wallet_currency.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:project_n2/views/settings_view/dialogs/wallet_dialog/wallets_dialog.dart';

class CurrenciesListView extends ConsumerStatefulWidget {
  final Function(WalletCurrency?) onSaved;
  const CurrenciesListView({required this.onSaved, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CurrenciesListViewState();
}

class _CurrenciesListViewState extends ConsumerState<CurrenciesListView> {
  bool editMode = false;

  @override
  Widget build(BuildContext context) {
    // Protect from overwriting the list
    // Which shouldnt be possible, but still happends when doing in-memory reorder
    final currencies = List.from(
      ref.watch(currenciesProvider),
    );

    void onReorder(oldIndex, newIndex) {
      newIndex = newIndex > oldIndex ? newIndex - 1 : newIndex;
      debugPrint('Old index: $oldIndex, New index: $newIndex');
      // Perform the in-memory reorder
      final movedWidget = currencies.removeAt(oldIndex);
      currencies.insert(newIndex, movedWidget);
      ref.read(currenciesProvider.notifier).reorder(oldIndex, newIndex);
    }

    return SizedBox(
      width: double.maxFinite,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (currencies.isEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32.0),
              child: ElevatedButton(
                onPressed: () {
                  ref.read(currenciesProvider.notifier).spawnDefaultCurrencies();
                },
                child: const Text('Add default currencies'),
              ),
            ),
          Flexible(
            child: ReorderableListView.builder(
              shrinkWrap: true,
              itemCount: currencies.length,
              itemBuilder: (context, index) {
                return AnimatedCrossFade(
                  key: ValueKey(currencies[index].id),
                  crossFadeState: editMode ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                  duration: const Duration(milliseconds: 300),
                  firstChild: ListTile(
                    key: ValueKey(currencies[index].id),
                    leading: Text(
                      currencies[index].emoji ?? '',
                      style: const TextStyle(fontSize: 22),
                    ),
                    title: Text(currencies[index].code),
                    subtitle: Text(currencies[index].name),
                    trailing: Text(
                      currencies[index].symbol,
                      style: GoogleFonts.notoSans(fontSize: 18),
                    ),
                    visualDensity: VisualDensity.compact,
                  ),
                  secondChild: ListTile(
                    contentPadding: const EdgeInsets.only(left: 12.0),
                    key: ValueKey(currencies[index].id),
                    leading: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.drag_handle),
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: Text(
                            currencies[index].emoji ?? '',
                            style: const TextStyle(fontSize: 22),
                          ),
                        ),
                      ],
                    ),
                    title: Text(
                      currencies[index].code,
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: Text(
                      currencies[index].name,
                      overflow: TextOverflow.ellipsis,
                    ),
                    // Replace for debuging subtitle
                    // subtitle: Text(
                    //   currencies[index].id!.toString(),
                    //   overflow: TextOverflow.ellipsis,
                    // ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Colors.grey,
                              width: 1,
                            ),
                          ),
                          child: InkWell(
                            customBorder: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            onTap: () {
                              //
                              widget.onSaved(currencies[index]);
                              ref
                                  .read(walletsDialogStateProvider.notifier)
                                  .setDialogState(WalletsDialogStates.currenciesCreation);
                            },
                            child: const Padding(
                              padding: EdgeInsets.all(3),
                              child: Icon(Icons.edit, size: 24),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Colors.grey,
                              width: 1,
                            ),
                          ),
                          child: InkWell(
                            customBorder: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            onTap: () {
                              ref
                                  .read(currenciesProvider.notifier)
                                  .deleteCurrency(currencies[index]);
                            },
                            child: const Padding(
                              padding: EdgeInsets.all(3),
                              child: Icon(color: Colors.red, Icons.delete_forever, size: 24),
                            ),
                          ),
                        ),
                      ],
                    ),
                    visualDensity: VisualDensity.compact,
                  ),
                );
              },
              onReorder: onReorder,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () => setState(() {
                    editMode = !editMode;
                  }),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FittedBox(child: Text(editMode ? 'Done' : 'Edit')),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Icon(editMode ? Icons.done : Icons.edit),
                      ),
                    ],
                  ),
                ),
              ),
              const VerticalDivider(),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    widget.onSaved(null);
                    ref
                        .read(walletsDialogStateProvider.notifier)
                        .setDialogState(WalletsDialogStates.currenciesCreation);
                  },
                  child: const FittedBox(
                    child: Row(
                      children: [
                        FittedBox(child: Text('Add')),
                        Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Icon(Icons.add_box_outlined),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(
                flex: 1,
              ),
              Expanded(
                flex: 3,
                child: ElevatedButton(
                  onPressed: () => ref
                      .read(walletsDialogStateProvider.notifier)
                      .setDialogState(WalletsDialogStates.walletsList),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Return'),
                      Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Icon(Icons.keyboard_return),
                      )
                    ],
                  ),
                ),
              ),
              const Spacer(
                flex: 1,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
