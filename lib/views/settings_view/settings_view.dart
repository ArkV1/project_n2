import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:project_n2/models/app_settings.dart';
import 'package:project_n2/tools/enums/settings.dart';
import 'package:project_n2/views/settings_view/dialogs/components_dialog.dart';
import 'package:project_n2/views/settings_view/dialogs/database_manager_dialog.dart';
import 'package:project_n2/views/settings_view/dialogs/todo_dialog.dart';
import 'package:project_n2/views/settings_view/dialogs/wallet_dialog/wallets_dialog.dart';

class SettingsView extends ConsumerStatefulWidget {
  const SettingsView({super.key});

  @override
  ConsumerState<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends ConsumerState<SettingsView> {
  bool showBugBounty = false;
  bool showDevInfo = false;

  @override
  Widget build(BuildContext context) {
    final components = ref.watch(componentMapProvider);
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
                          'Database',
                          textScaler: TextScaler.linear(1.25),
                        )),
                        const Divider(),
                        ListTile(
                          title: const Text('Database Manager'),
                          trailing: Icon(MdiIcons.database),
                          onTap: () {
                            context.push(
                              '/fast-dialog',
                              extra: const DatabaseManagerDialog(),
                            );
                          },
                        ),
                        const Center(
                            child: Text(
                          'App settings',
                          textScaleFactor: 1.25,
                        )),
                        const Divider(),
                        ListTile(
                          title: const Text('Components'),
                          trailing: const Icon(Icons.apps),
                          enabled: true,
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) => const ComponentsDialog(),
                            );
                          },
                        ),
                        // const Center(
                        //     child: Text(
                        //   'Widgets',
                        //   textScaleFactor: 1.25,
                        // )),
                        // const Divider(),
                        // const Center(
                        //     child: Text(
                        //   'Main Screen',
                        //   textScaleFactor: 1.15,
                        // )),
                        // // ListTile(
                        // //   title: const Text('Total'),
                        // //   trailing: Switch.adaptive(
                        // //     value: showTotal,
                        // //     onChanged: (newValue) {
                        // //       setState(() {
                        // //         showTotal = newValue;
                        // //         debugPrint('showTotal: $showTotal');
                        // //       });
                        // //     },
                        // //   ),
                        // //   // onTap: () {},
                        // // ),
                        // for (var i = 0; i < AppComponents.values.length; i++)
                        //   ListTile(
                        //     title: Text(
                        //         '${AppComponents.values[i].publicName} widgets'),
                        //     trailing: const Icon(Icons.account_balance_wallet),
                        //     enabled: false,
                        //     onTap: () {
                        //       showDialog(
                        //         context: context,
                        //         builder: (BuildContext context) =>
                        //             const WalletWidgetsDialog(),
                        //       );
                        //     },
                        //   ),
                        if (components.containsValue(true))
                          const Column(
                            children: [
                              Center(
                                  child: Text(
                                'Components',
                                textScaleFactor: 1.25,
                              )),
                              Divider(),
                            ],
                          ),
                        for (var i = 0; i < AppComponents.values.length; i++)
                          if (components.containsKey(AppComponents.values[i].name) &&
                              components[AppComponents.values[i].name]!)
                            ListTile(
                              title: Text(
                                'Manage \n${AppComponents.values[i].publicName}',
                              ),
                              trailing: () {
                                switch (AppComponents.values[i]) {
                                  case AppComponents.todo:
                                    return const Icon(Icons.format_list_bulleted);
                                  case AppComponents.calendar:
                                    return const Icon(Icons.calendar_month);
                                  case AppComponents.wallet:
                                    return const Icon(Icons.account_balance_wallet);
                                  // case AppComponents.notebook:
                                  //   return const Icon(Icons.edit_note);
                                  // case AppComponents.calendar:
                                  //   return const Icon(Icons.calendar_today);
                                  // case AppComponents.converter:
                                  //   return const Icon(Icons.currency_exchange);
                                }
                              }(),
                              onTap: () {
                                switch (AppComponents.values[i]) {
                                  case AppComponents.todo:
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) => const ToDoListsDialog(),
                                    );
                                    break;
                                  case AppComponents.calendar:
                                    // showDialog(
                                    //   context: context,
                                    //   builder: (BuildContext context) => const ToDoListsDialog(),
                                    // );
                                    break;
                                  case AppComponents.wallet:
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) => const WalletsDialog(),
                                    );
                                    break;
                                  // case AppComponents.notebook:
                                  //   // TODO: Handle this case.
                                  //   break;
                                  // case AppComponents.calendar:
                                  //   // TODO: Handle this case.
                                  //   break;
                                  // case AppComponents.converter:
                                  //   // TODO: Handle this case.
                                  //   break;
                                }
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
                          onTap: () => {context.push(Screens.personaliztion.path)},
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
                              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
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
                                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
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
                                              Text('Version: ${snapshot.data!.version}'),
                                              Text('Build number: ${snapshot.data!.buildNumber}'),
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
