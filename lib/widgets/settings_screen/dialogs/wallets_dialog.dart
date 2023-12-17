import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:objectbox/objectbox.dart';
import 'package:project_n2/models/wallet/wallet_transaction.dart';
import 'package:project_n2/tools/enums/currencies.dart';

import 'package:project_n2/models/wallet/wallet.dart';

final _formKey = GlobalKey<FormState>();

class WalletsDialog extends ConsumerStatefulWidget {
  const WalletsDialog({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _WalletsDialogState();
}

class _WalletsDialogState extends ConsumerState<WalletsDialog> {
  TextEditingController walletsNameController = TextEditingController();

  Wallet? wallet;
  bool creation = false;
  bool listViewActions = true;
  bool advancedSettings = false;

  @override
  Widget build(BuildContext context) {
    //final userData = ref.watch(userDataProvider);
    final wallets = ref.watch(walletsProvider);
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
      content: Container(
        width: double.maxFinite,
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
                          DropdownButtonFormField<Currencies>(
                            focusNode: FocusNode(canRequestFocus: false),
                            //isExpanded: true,
                            decoration: const InputDecoration(
                              labelText: 'Currencies:',
                              prefixIcon: Icon(Icons.attach_money),
                            ),
                            value: Currencies.usd,
                            icon: const Icon(
                              Icons.arrow_drop_down,
                            ),
                            onChanged: (Currencies? category) {
                              //This is called when the user selects an item.
                              // setState(() {
                              //   ref.read(creationQuizProvider.notifier).category = category;
                              // });
                            },
                            items: Currencies.values
                                .map<DropdownMenuItem<Currencies>>(
                                    (Currencies currencie) {
                              return DropdownMenuItem<Currencies>(
                                value: currencie,
                                child: Text(
                                  currencie.name,
                                ),
                              );
                            }).toList(),
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
                                    advancedSettings
                                        ? Icons.arrow_drop_up
                                        : Icons.arrow_drop_down,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          if (advancedSettings)
                            const Text('Advanced settings enabled'),
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
                          ref.read(walletsProvider.notifier).insertWallet(
                                Wallet(
                                  name: walletsNameController.text,
                                  transactionsRelation:
                                      ToMany<WalletTransaction>(),
                                ),
                              );
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
                    padding: EdgeInsets.only(top: 48.0),
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
                                    this.wallet = wallet;
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
                                  ref
                                      .read(walletsProvider.notifier)
                                      .deleteWallet(wallet);
                                  // ref
                                  //     .read(dataManagerProvider)
                                  //     .deleteAppWidget(wallet.id!);
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
                                advancedSettings
                                    ? Icons.arrow_drop_up
                                    : Icons.arrow_drop_down,
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
                    value: wallets.first,
                    icon: const Icon(
                      Icons.arrow_drop_down,
                    ),
                    onChanged: (Wallet? wallet) {
                      //This is called when the user selects an item.
                      // setState(() {
                      //   ref.read(creationQuizProvider.notifier).category = category;
                      // });
                    },
                    items:
                        wallets.map<DropdownMenuItem<Wallet>>((Wallet wallet) {
                      return DropdownMenuItem<Wallet>(
                        value: wallet,
                        child: Text(
                          wallet.name,
                        ),
                      );
                    }).toList(),
                  ),
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
    );
  }
}
