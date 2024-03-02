import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:project_n2/models/wallet/wallet.dart';
import 'package:project_n2/views/settings_view/dialogs/wallet_dialog/wallets_dialog.dart';

final _formKey = GlobalKey<FormState>();

class WalletsCreationView extends ConsumerStatefulWidget {
  final Wallet? wallet;

  const WalletsCreationView({this.wallet, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _WalletsCreationViewState();
}

class _WalletsCreationViewState extends ConsumerState<WalletsCreationView> {
  TextEditingController walletsNameController = TextEditingController();

  bool advancedSettings = false;

  @override
  Widget build(BuildContext context) {
    widget.wallet != null
        ? walletsNameController.text = widget.wallet!.name
        : walletsNameController.text = '';
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IntrinsicWidth(
            child: Container(
              constraints: const BoxConstraints(minWidth: 250),
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Wallet's name",
                      errorMaxLines: 3,
                      errorStyle: TextStyle(
                        overflow: TextOverflow.visible,
                      ),
                    ),
                    controller: walletsNameController,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Column(
                      children: [
                        ListTile(
                          contentPadding: const EdgeInsets.only(
                            left: 16.0,
                            right: 16.0,
                          ),
                          leading: const Icon(Icons.money_rounded),
                          title: const Text(
                            'Categories\n  Budgets',
                            // textAlign: TextAlign.start,
                          ),
                          trailing: const Icon(Icons.savings_outlined),
                          onTap: () {
                            ref
                                .read(walletsDialogStateProvider.notifier)
                                .setDialogState(WalletsDialogStates.budgetsList);
                          },
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          advancedSettings = !advancedSettings;
                        });
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text('Advanced settings'),
                          Icon(
                            advancedSettings ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (advancedSettings) const Text('Adavanced settings enabled'),
                ],
              ),
            ),
          ),

          ///////////////////////////////////////////////////////////////////////////
          // const Padding(
          //   padding: EdgeInsets.only(top: 48.0),
          //   child: Text(
          //     'Adding wallet',
          //     textAlign: TextAlign.center,
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => setState(() {
                    advancedSettings = false;
                    ref
                        .read(walletsDialogStateProvider.notifier)
                        .setDialogState(WalletsDialogStates.walletsList);
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
                const VerticalDivider(),
                ElevatedButton(
                  onPressed: () => setState(() {
                    advancedSettings = false;
                    if (widget.wallet == null) {
                      ref.read(walletsProvider.notifier).insertWallet(
                            Wallet.smart(
                              name: walletsNameController.text,
                              // defaultCurrency: Currencies.usd
                              // categories: defaultCategories.toList(),
                              // transactionsRelation:
                              //     ToMany<WalletTransaction>(),
                            ),
                            budgets: defaultBudgets,
                          );
                    } else {
                      ref.read(walletsProvider.notifier).insertWallet(
                            widget.wallet!.copyWith(
                              name: walletsNameController.text,
                            ),
                          );
                    }
                    ref
                        .read(walletsDialogStateProvider.notifier)
                        .setDialogState(WalletsDialogStates.walletsList);
                  }),
                  child: const Row(
                    children: [
                      Text('Add wallet'),
                      Padding(
                        padding: EdgeInsets.only(left: 6.0),
                        child: Icon(Icons.add_box_outlined),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
