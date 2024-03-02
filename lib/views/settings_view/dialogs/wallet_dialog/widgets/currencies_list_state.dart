import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:project_n2/models/wallet/wallet_currency.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:project_n2/views/settings_view/dialogs/wallet_dialog/wallets_dialog.dart';

class CurrenciesListView extends ConsumerStatefulWidget {
  const CurrenciesListView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CurrenciesListViewState();
}

class _CurrenciesListViewState extends ConsumerState<CurrenciesListView> {
  bool editMode = false;

  @override
  Widget build(BuildContext context) {
    final currencies = ref.watch(currenciesProvider);
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        children: [
          Expanded(
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
                      currencies[index].flagEmoji ?? '',
                      style: const TextStyle(fontSize: 22),
                    ),
                    title: Text(currencies[index].shortName),
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
                            currencies[index].flagEmoji ?? '',
                            style: const TextStyle(fontSize: 22),
                          ),
                        ),
                      ],
                    ),
                    title: Text(
                      currencies[index].shortName,
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: Text(
                      currencies[index].name,
                      overflow: TextOverflow.ellipsis,
                    ),
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
                            onTap: () {},
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
                            onTap: () {},
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
              // shrinkWrap: true,
              // children: [
              //   for (final currency in currencies)
              //     ListTile(
              //       key: ValueKey(currency.id),
              //       leading: Text(
              //         currency.flagEmoji ?? '',
              //         style: const TextStyle(fontSize: 22),
              //       ),
              //       title: Text(currency.name),
              //       trailing: Text(
              //         currency.symbol,
              //         style: GoogleFonts.notoSans(fontSize: 18),
              //       ),
              //     ),
              // ],
              onReorder: (oldIndex, newIndex) {
                // ref.read(currenciesProvider.notifier).reorder(oldIndex, newIndex);
              },
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
          )
        ],
      ),
    );
  }
}
