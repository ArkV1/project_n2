import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_n2/models/wallet/wallet_currency.dart';
import 'package:project_n2/views/settings_view/dialogs/wallet_dialog/wallets_dialog.dart';

final _formKey = GlobalKey<FormState>();

enum ChosenField { none, emoji, code, name, symbol }

class CurrenciesCreationView extends ConsumerStatefulWidget {
  final WalletCurrency? currency;
  const CurrenciesCreationView({required this.currency, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CurrenciesCreationViewState();
}

class _CurrenciesCreationViewState extends ConsumerState<CurrenciesCreationView> {
  TextEditingController emojiController = TextEditingController();
  TextEditingController shortNameController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController symbolController = TextEditingController();

  ChosenField? chosenField = ChosenField.none;

  @override
  void initState() {
    if (widget.currency != null) {
      emojiController.text = widget.currency!.emoji ?? '';
      shortNameController.text = widget.currency!.code;
      nameController.text = widget.currency!.name;
      symbolController.text = widget.currency!.symbol;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        width: double.maxFinite,
        constraints: const BoxConstraints(minWidth: 250),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: LayoutBuilder(builder: (ctx, cons) {
                    if (chosenField == ChosenField.none) {
                      cons = BoxConstraints(maxWidth: cons.maxWidth * 1.05);
                    }
                    return Row(
                      children: [
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          padding: const EdgeInsets.only(right: 8.0),
                          width: chosenField == ChosenField.emoji
                              ? cons.maxWidth / 4.85
                              : cons.maxWidth / 6,
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Emoji',
                              labelStyle: TextStyle(fontSize: 12),
                              hintText: '  💵 ',
                              errorMaxLines: 3,
                              errorStyle: TextStyle(
                                overflow: TextOverflow.visible,
                              ),
                            ),
                            controller: emojiController,
                            onTap: () {
                              setState(() {
                                chosenField = ChosenField.emoji;
                              });
                            },
                          ),
                        ),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          padding: const EdgeInsets.only(right: 8.0),
                          width: chosenField == ChosenField.code
                              ? cons.maxWidth / 4.35
                              : cons.maxWidth / 5.25,
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Code',
                              labelStyle: TextStyle(fontSize: 12, overflow: TextOverflow.fade),
                              hintText: '  USD  ',
                              errorMaxLines: 3,
                              errorStyle: TextStyle(
                                overflow: TextOverflow.visible,
                              ),
                            ),
                            controller: shortNameController,
                            onTap: () {
                              setState(() {
                                chosenField = ChosenField.code;
                              });
                            },
                          ),
                        ),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          padding: const EdgeInsets.only(right: 8.0),
                          width: chosenField == ChosenField.name
                              ? cons.maxWidth / 2.1
                              : cons.maxWidth / 2.35,
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: chosenField == ChosenField.name ? 'Name' : 'Name',
                              labelStyle: const TextStyle(fontSize: 12),
                              hintText: ' United States Dollar',
                              hintStyle: const TextStyle(fontSize: 12),
                              errorMaxLines: 3,
                              errorStyle: const TextStyle(
                                overflow: TextOverflow.visible,
                              ),
                            ),
                            controller: nameController,
                            onTap: () {
                              setState(() {
                                chosenField = ChosenField.name;
                              });
                            },
                          ),
                        ),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          width: chosenField == ChosenField.symbol
                              ? cons.maxWidth / 5
                              : cons.maxWidth / 6,
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: chosenField == ChosenField.symbol ? 'Symbol' : 'Symbol',
                              labelStyle: const TextStyle(fontSize: 12),
                              hintText: '   \$',
                              hintStyle: const TextStyle(fontSize: 12),
                              errorMaxLines: 3,
                              errorStyle: const TextStyle(
                                overflow: TextOverflow.visible,
                              ),
                            ),
                            controller: symbolController,
                            onTap: () {
                              setState(() {
                                chosenField = ChosenField.symbol;
                              });
                            },
                          ),
                        ),
                      ],
                    );
                  }),
                )
                //
              ],
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
            //       controller: currencyNameController,
            //     ),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => setState(() {
                      ref.read(currenciesProvider.notifier).insertCurrency(
                            WalletCurrency(
                              emoji: emojiController.text,
                              code: shortNameController.text,
                              name: nameController.text,
                              symbol: symbolController.text,
                            ),
                          );
                      ref
                          .read(walletsDialogStateProvider.notifier)
                          .setDialogState(WalletsDialogStates.currenciesList);
                    }),
                    child: const Row(
                      children: [
                        Text('Add currency'),
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
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () => setState(() {
                      ref
                          .read(walletsDialogStateProvider.notifier)
                          .setDialogState(WalletsDialogStates.currenciesList);
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
