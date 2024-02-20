import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:objectbox/objectbox.dart';
import 'package:project_n2/models/wallet/wallet_budget.dart';
import 'package:project_n2/models/wallet/wallet_transaction.dart';
import 'package:project_n2/tools/constants.dart';

import 'package:project_n2/models/wallet/wallet.dart';
import 'package:project_n2/widgets/settings_screen/dialogs/currencies_dialog.dart';

final _formKey = GlobalKey<FormState>();

class WalletsDialog extends ConsumerStatefulWidget {
  final Wallet? wallet;
  const WalletsDialog({this.wallet, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _WalletsDialogState();
}

class _WalletsDialogState extends ConsumerState<WalletsDialog> {
  TextEditingController walletsNameController = TextEditingController();

  Wallet? shownWallet;
  bool creation = false;
  bool listViewActions = true;
  bool advancedSettings = false;

  @override
  Widget build(BuildContext context) {
    //final userData = ref.watch(userDataProvider);
    final wallets = ref.watch(walletsProvider);
    shownWallet != null
        ? walletsNameController.text = shownWallet!.name
        : walletsNameController.text = '';
    return AlertDialog(
      title: Row(
        children: [
          const Spacer(),
          const Expanded(
            flex: 5,
            child: Text(
              'Wallets managment',
              textAlign: TextAlign.center,
            ),
          ),
          Flexible(
            child: !creation
                ? Container(
                    margin: const EdgeInsets.only(left: 6),
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                    child: InkWell(
                      child: listViewActions
                          ? const Icon(Icons.settings_applications_outlined)
                          : const Icon(Icons.settings_applications),
                      onTap: () {
                        setState(() {
                          listViewActions = !listViewActions;
                        });
                      },
                    ),
                  )
                : Container(),
          ),
        ],
      ),
      content: SingleChildScrollView(
        child: Container(
          width: double.minPositive,
          constraints: const BoxConstraints(minHeight: 200),
          child: () {
            if (creation) {
              return Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IntrinsicWidth(
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        constraints: const BoxConstraints(minWidth: 225),
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
                            // TODO Default currency dropdown
                            // DropdownButtonFormField<Currencies>(
                            //   focusNode: FocusNode(canRequestFocus: false),
                            //   //isExpanded: true,
                            //   decoration: const InputDecoration(
                            //     labelText: 'Currencies:',
                            //     // prefixIcon: Icon(Icons.attach_money),
                            //   ),
                            //   value: Currencies.usd,
                            //   icon: const Icon(
                            //     Icons.arrow_drop_down,
                            //   ),
                            //   onChanged: (Currencies? category) {
                            //     //This is called when the user selects an item.
                            //     // setState(() {
                            //     //   ref.read(creationQuizProvider.notifier).category = category;
                            //     // });
                            //   },
                            //   items: Currencies.values
                            //       .map<DropdownMenuItem<Currencies>>((Currencies currencie) {
                            //     return DropdownMenuItem<Currencies>(
                            //       value: currencie,
                            //       child: Row(
                            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //         children: [
                            //           Text(
                            //             currencie.name,
                            //           ),
                            //           Text(
                            //             ' ${currencie.symbol}',
                            //           ),
                            //         ],
                            //       ),
                            //     );
                            //   }).toList(),
                            // ),
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
                                      advancedSettings
                                          ? Icons.arrow_drop_up
                                          : Icons.arrow_drop_down,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            if (advancedSettings) const Text('Advanced settings enabled'),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () => setState(() {
                            advancedSettings = false;
                            creation = false;
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
                        ElevatedButton(
                          onPressed: () => setState(() {
                            advancedSettings = false;
                            if (shownWallet == null) {
                              ref.read(walletsProvider.notifier).insertWallet(
                                    Wallet.smart(
                                      name: walletsNameController.text,
                                      // defaultCurrency: Currencies.usd,
                                      // categories: defaultCategories.toList(),
                                      // transactionsRelation:
                                      //     ToMany<WalletTransaction>(),
                                    ),
                                    budgets: defaultBudgets,
                                  );
                            } else {
                              ref.read(walletsProvider.notifier).insertWallet(
                                    shownWallet!.copyWith(
                                      name: walletsNameController.text,
                                    ),
                                  );
                            }
                            creation = false;
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
                  ],
                ),
              );
            } else {
              return Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (wallets.isEmpty)
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 36.0),
                      child: Text(
                        'No wallets added yet',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ListView(
                    shrinkWrap: true,
                    children: [
                      for (var wallet in wallets)
                        ListTile(
                          title: Text(wallet.name),
                          //subtitle: Text(wallet.defaultCurrency),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (listViewActions)
                                InkWell(
                                  child: Container(
                                    padding: const EdgeInsets.all(3),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.grey,
                                        width: 1,
                                      ),
                                    ),
                                    child: const Icon(Icons.edit),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      shownWallet = wallet;
                                      creation = true;
                                      // listViewActions = false;
                                    });
                                  },
                                ),
                              if (listViewActions)
                                InkWell(
                                  child: Container(
                                    margin: const EdgeInsets.only(left: 3),
                                    padding: const EdgeInsets.all(3),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.grey,
                                        width: 1,
                                      ),
                                    ),
                                    child: const Icon(Icons.remove),
                                  ),
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text(
                                            'Wallet removal',
                                            textAlign: TextAlign.center,
                                          ),
                                          content: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(bottom: 12.0),
                                                child: Text(
                                                  'Are you sure that you want to remove the "${wallet.name}" wallet?',
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children: [
                                                  ElevatedButton(
                                                    onPressed: () {
                                                      ref
                                                          .read(walletsProvider.notifier)
                                                          .deleteWallet(wallet);
                                                      Navigator.pop(context);
                                                    },
                                                    child: const Text(
                                                      'Confirm',
                                                      style: TextStyle(
                                                        color: Colors.red,
                                                      ),
                                                    ),
                                                  ),
                                                  ElevatedButton(
                                                    onPressed: () => Navigator.pop(context),
                                                    child: const Text('Cancel'),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                            ],
                          ),
                        ),
                      ///////////////////////////////////////////////////
                      if (listViewActions)
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
                    ],
                  ),
                  if (advancedSettings && listViewActions)
                    DropdownButtonFormField<Wallet>(
                      focusNode: FocusNode(canRequestFocus: false),
                      //isExpanded: true,
                      decoration: const InputDecoration(
                        labelText: 'Default wallet:',
                        prefixIcon: Icon(Icons.wallet),
                      ),
                      value: ref.read(defaultWalletProvider),
                      icon: const Icon(
                        Icons.arrow_drop_down,
                      ),
                      onChanged: (Wallet? wallet) {
                        if (wallet != null) {
                          ref
                              .read(defaultWalletProvider.notifier)
                              .setDefaultWallet(walletId: wallet.id);
                        }
                        //This is called when the user selects an item.
                        // setState(() {
                        //   ref.read(creationQuizProvider.notifier).category = category;
                        // });
                      },
                      items: wallets.map<DropdownMenuItem<Wallet>>((Wallet wallet) {
                        return DropdownMenuItem<Wallet>(
                          value: wallet,
                          child: Text(
                            wallet.name,
                          ),
                        );
                      }).toList(),
                    ),
                  if (advancedSettings && listViewActions)
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: ListTile(
                        contentPadding: const EdgeInsets.only(
                          left: 12.0,
                          right: 2.0,
                        ),
                        leading: const Icon(Icons.attach_money),
                        title: const Text('Currencies'),
                        trailing: const Icon(Icons.arrow_drop_down),
                        onTap: () {
                          context.push(
                            '/fast-dialog',
                            extra: const CurrenciesDialog(),
                          );
                        },
                      ),
                    ),
                  // if (advancedSettings && listViewActions)
                  //   DropdownButtonFormField<WalletBudget>(
                  //     focusNode: FocusNode(canRequestFocus: false),
                  //     //isExpanded: true,
                  //     decoration: const InputDecoration(
                  //       labelText: 'Currencies:',
                  //       prefixIcon: Icon(Icons.wallet),
                  //     ),
                  //     value: null,
                  //     icon: const Icon(
                  //       Icons.arrow_drop_down,
                  //     ),
                  //     onChanged: (WalletBudget? walletBudget) {
                  //       // if (wallet != null) {
                  //       //   ref
                  //       //       .read(defaultWalletProvider.notifier)
                  //       //       .setDefaultWallet(walletId: wallet.id);
                  //       // }
                  //       //This is called when the user selects an item.
                  //       // setState(() {
                  //       //   ref.read(creationQuizProvider.notifier).category = category;
                  //       // });
                  //     },
                  //     items: wallets.map<DropdownMenuItem<Wallet>>((Wallet wallet) {
                  //       return DropdownMenuItem<Wallet>(
                  //         value: wallet,
                  //         child: Text(
                  //           wallet.name,
                  //         ),
                  //       );
                  //     }).toList(),
                  //   ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () => Navigator.pop(context),
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
                        if (listViewActions)
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                advancedSettings = false;
                                shownWallet = null;
                                creation = true;
                                // listViewActions = false;
                              });

                              // ref.read(walletsProvider).addWallet(
                              //     Wallet('Wallet ${wallets.length + 1}', 'USD'));
                            },
                            child: const Row(
                              children: [
                                Text('Add wallet'),
                                Padding(
                                  padding: EdgeInsets.only(left: 6.0),
                                  child: Icon(Icons.add_box_outlined),
                                )
                              ],
                            ),
                          ),
                      ],
                    ),
                  )
                ],
              );
            }
          }(),
        ),
      ),
    );
  }
}
