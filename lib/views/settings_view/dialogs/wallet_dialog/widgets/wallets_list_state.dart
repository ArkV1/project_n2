import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:project_n2/models/wallet/wallet.dart';
import 'package:project_n2/views/settings_view/dialogs/wallet_dialog/wallets_dialog.dart';

class WalletsListView extends ConsumerStatefulWidget {
  final Function(Wallet?) onSaved;

  const WalletsListView({required this.onSaved, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _WalletsListViewState();
}

class _WalletsListViewState extends ConsumerState<WalletsListView> {
  bool advancedSettings = false;

  @override
  Widget build(BuildContext context) {
    final wallets = ref.watch(walletsProvider);
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
        Column(
          children: [
            for (var wallet in wallets)
              ListTile(
                contentPadding: const EdgeInsets.only(left: 16.0, right: 8.0),
                title: Text(wallet.name),
                //subtitle: Text(wallet.defaultCurrency),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
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
                        child: const Padding(
                          padding: EdgeInsets.all(3),
                          child: Icon(Icons.edit, size: 24),
                        ),
                        onTap: () {
                          setState(() {
                            // wallet = wallet;
                            widget.onSaved(wallet);
                            ref
                                .read(walletsDialogStateProvider.notifier)
                                .setDialogState(WalletsDialogStates.walletsCreation);
                            // listViewActions = false;
                          });
                        },
                      ),
                    ),
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
                        child: const Padding(
                          padding: EdgeInsets.all(3),
                          child: Icon(color: Colors.red, Icons.delete_forever, size: 24),
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
                                            ref.read(walletsProvider.notifier).deleteWallet(wallet);
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
                    ),
                  ],
                ),
              ),
            ///////////////////////////////////////////////////
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
        if (advancedSettings)
          Column(
            children: [
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
                    ref.read(defaultWalletProvider.notifier).setDefaultWallet(walletId: wallet.id);
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
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: ListTile(
                  contentPadding: const EdgeInsets.only(
                    left: 12.0,
                    right: 12.0,
                  ),
                  leading: const Icon(Icons.attach_money),
                  title: const Text('Currencies'),
                  trailing: const Icon(Icons.sync),
                  onTap: () {
                    ref
                        .read(walletsDialogStateProvider.notifier)
                        .setDialogState(WalletsDialogStates.currenciesList);
                  },
                ),
              ),
            ],
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
              const VerticalDivider(),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    print('Add wallet');
                    advancedSettings = false;
                    widget.onSaved(null);
                    ref
                        .read(walletsDialogStateProvider.notifier)
                        .setDialogState(WalletsDialogStates.walletsCreation);
                    // listViewActions = false;
                  });

                  // ref.read(walletsProvider).addWallet(
                  //     Wallet('Wallet ${wallets.length + 1}', 'USD'));
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Add wallet'),
                    Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Icon(Icons.add_box_outlined),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
