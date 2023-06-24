import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../providers/user_data_providers.dart';
import 'package:project_n2/tools/enums/currencies.dart';

import '../../../models/wallet.dart';

// import '../../../models/wallet.dart';

final _formKey = GlobalKey<FormState>();

class WalletWidgetsDialog extends ConsumerStatefulWidget {
  const WalletWidgetsDialog({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _WalletWidgetsDialogState();
}

class _WalletWidgetsDialogState extends ConsumerState<WalletWidgetsDialog> {
  bool widgetsSettings = false;
  //bool listViewActions = false;

  @override
  Widget build(BuildContext context) {
    final userData = ref.watch(userDataProvider);
    final walletWidgets = ref.watch(walletWidgetsProvider);
    final wallets = userData.wallets;
    return AlertDialog(
        title: Row(
          children: [
            const Spacer(),
            const Expanded(
              flex: 5,
              child: Text(
                'Wallet widgets',
                textAlign: TextAlign.center,
              ),
            ),
            Flexible(
              child: Container(
                margin: const EdgeInsets.only(left: 6),
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 1,
                  ),
                ),
                child: InkWell(
                  child: widgetsSettings
                      ? const Icon(Icons.settings_applications_outlined)
                      : const Icon(Icons.settings_applications),
                  onTap: () {
                    setState(() {
                      widgetsSettings = !widgetsSettings;
                    });
                  },
                ),
              ),
            ),
          ],
        ),
        content: Container(
          width: double.maxFinite,
          constraints: const BoxConstraints(minHeight: 200),
          child: () {
            if (widgetsSettings) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ListView(
                    shrinkWrap: true,
                    children: [
                      for (var i = 0; i < wallets.length; i++)
                        ListTile(
                          title: Text(wallets[i].walletName),
                          subtitle: Text(wallets[i].defaultCurrency),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Switch(
                                value:
                                    walletWidgets.containsKey(i) ? true : false,
                                onChanged: (value) {
                                  setState(() {
                                    if (value) {
                                      ref
                                          .read(walletWidgetsProvider)
                                          .addEntries(<int, dynamic>{
                                            i: true,
                                          }.entries);
                                    } else {
                                      ref
                                          .read(walletWidgetsProvider)
                                          .removeWhere(
                                              (key, value) => key == i);
                                    }
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () => setState(() {
                          widgetsSettings = false;
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
                    ],
                  ),
                ],
              );
            } else {
              return Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ListView(
                    shrinkWrap: true,
                    children: [
                      if (walletWidgets.isEmpty)
                        const ListTile(
                          title: Padding(
                            padding: EdgeInsets.only(top: 48.0),
                            child: Text(
                              'No widgets chosen',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      for (var i = 0; i < wallets.length; i++)
                        if (walletWidgets.containsKey(i))
                          ListTile(
                            title: Text(wallets[i].walletName),
                            subtitle: Text(wallets[i].defaultCurrency),
                          ),
                    ],
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
                        // if (!widgetsSettings)
                        //   ElevatedButton(
                        //     onPressed: () {
                        //       setState(() {
                        //         widgetsSettings = true;
                        //       });
                        //       // ref.read(walletsProvider).addWallet(
                        //       //     Wallet('Wallet ${wallets.length + 1}', 'USD'));
                        //     },
                        //     child: const Row(
                        //       children: [
                        //         Text('Show wallets'),
                        //         Padding(
                        //           padding: EdgeInsets.only(left: 6.0),
                        //           child: Icon(Icons.add_box_outlined),
                        //         )
                        //       ],
                        //     ),
                        //   ),
                      ],
                    ),
                  )
                ],
              );
            }
          }(),
        ));
  }
}
