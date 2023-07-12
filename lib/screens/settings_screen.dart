import 'package:flutter/material.dart';

import 'package:package_info_plus/package_info_plus.dart';
import 'package:project_n2/widgets/settings_screen/dialogs/wallet_widgets_dialog.dart';

import '../widgets/settings_screen/dialogs/wallets_dialog.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool showBugBounty = false;
  bool showDevInfo = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(flex: 1),
            IntrinsicWidth(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IntrinsicWidth(
                    child: Column(
                      children: [
                        const Center(
                            child: Text(
                          'Widgets',
                          textScaleFactor: 1.25,
                        )),
                        const Divider(),
                        // ListTile(
                        //   title: const Text('Total'),
                        //   trailing: Switch.adaptive(
                        //     value: showTotal,
                        //     onChanged: (newValue) {
                        //       setState(() {
                        //         showTotal = newValue;
                        //         debugPrint('showTotal: $showTotal');
                        //       });
                        //     },
                        //   ),
                        //   // onTap: () {},
                        // ),

                        ListTile(
                          title: const Text('Wallet widgets'),
                          trailing: const Icon(Icons.account_balance_wallet),
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) =>
                                  const WalletWidgetsDialog(),
                            );
                          },
                        ),

                        const Center(
                            child: Text(
                          'Wallets',
                          textScaleFactor: 1.25,
                        )),
                        const Divider(),
                        // ListTile(
                        //   title: const Text('Show Total'),
                        //   trailing: Switch.adaptive(
                        //     value: showTotal,
                        //     onChanged: (newValue) {
                        //       setState(() {
                        //         showTotal = newValue;
                        //         debugPrint('showTotal: $showTotal');
                        //       });
                        //     },
                        //   ),
                        //   // onTap: () {},
                        // ),
                        ListTile(
                          title: const Text('Manage wallets'),
                          trailing: const Icon(Icons.account_balance_wallet),
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) =>
                                  const WalletsDialog(),
                            );
                          },
                        ),

                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: [
                        //     Text('Expense Manager Module'),
                        //     Switch(
                        //       // This bool value toggles the switch.
                        //       value: modules.expenseManager!,
                        //       activeColor: Colors.purple,
                        //       onChanged: (bool value) {
                        //         // This is called when the user toggles the switch.
                        //         setState(() {
                        //           modules.toggleModule('Expense Manager');
                        //         });
                        //       },
                        //     ),
                        //   ],
                        // ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: [
                        //     Text('Calendar Module'),
                        //     Switch(
                        //       // This bool value toggles the switch.
                        //       value: modules.calendar!,
                        //       activeColor: Colors.purple,
                        //       onChanged: (bool value) {
                        //         // This is called when the user toggles the switch.
                        //         setState(() {
                        //           modules.toggleModule('Calendar');
                        //         });
                        //       },
                        //     ),
                        //   ],
                        // ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: [
                        //     Text('Notebook Module'),
                        //     Switch(
                        //       // This bool value toggles the switch.
                        //       value: modules.notebook!,
                        //       activeColor: Colors.purple,
                        //       onChanged: (bool value) {
                        //         // This is called when the user toggles the switch.
                        //         setState(() {
                        //           modules.toggleModule('Notebook');
                        //         });
                        //       },
                        //     ),
                        //   ],
                        // ),
                        const Divider(),

                        ListTile(
                          leading: const Icon(Icons.dashboard_customize),
                          title: const Text('Personalization'),
                          onTap: () => {
                            Navigator.pushNamed(
                                context, '/settings/personalization'),
                          },
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Visibility(
                        visible: showBugBounty,
                        child: Stack(
                          children: [
                            Container(
                              margin: const EdgeInsets.fromLTRB(48, 16, 48, 0),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 32, vertical: 32),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Column(
                                children: [
                                  Text(
                                    'We offer monetary rewards for potentially dangerous vulnerabilities and exploits found in our app.\n',
                                    textAlign: TextAlign.center,
                                  ),
                                  Text('Contact us: Ark.V@posteo.net'),
                                ],
                              ),
                            ),
                            Positioned(
                              top: 16,
                              right: 46,
                              child: IconButton(
                                icon: const Icon(Icons.close),
                                onPressed: () {
                                  setState(() {
                                    showBugBounty = false;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Visibility(
                        visible: showDevInfo && !showBugBounty,
                        child: Stack(
                          children: [
                            Column(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(top: 16),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 32, vertical: 16),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: FutureBuilder<PackageInfo>(
                                    future: PackageInfo.fromPlatform(),
                                    builder: (context, snapshot) {
                                      switch (snapshot.connectionState) {
                                        case ConnectionState.done:
                                          return Column(
                                            children: [
                                              Text(
                                                  'Version: ${snapshot.data!.version}'),
                                              Text(
                                                  'Build number: ${snapshot.data!.buildNumber}'),
                                            ],
                                          );
                                        default:
                                          return const Column(
                                            children: [
                                              Text('Version: 0.0.0'),
                                              Text('Build number: 0'),
                                            ],
                                          );
                                      }
                                    },
                                  ),
                                ),
                                Visibility(
                                  visible: !showBugBounty,
                                  child: Container(
                                    margin: const EdgeInsets.only(bottom: 16),
                                    child: TextButton(
                                        onPressed: () {
                                          setState(() {
                                            showBugBounty = true;
                                          });
                                        },
                                        child: const Text('Bug bounty')),
                                  ),
                                ),
                              ],
                            ),
                            Positioned(
                              top: 10,
                              right: -6,
                              child: IconButton(
                                icon: const Icon(Icons.close),
                                onPressed: () {
                                  setState(() {
                                    showDevInfo = false;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Visibility(
                        visible: !showDevInfo,
                        child: Container(
                          margin: const EdgeInsets.only(top: 16),
                          child: TextButton(
                              onPressed: () {
                                setState(() {
                                  showDevInfo = true;
                                });
                              },
                              child: const Text('About')),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(flex: 1),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.keyboard_return),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
