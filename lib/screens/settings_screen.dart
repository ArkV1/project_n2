import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../models/module.dart';

import '../screens/personalization_settings_screen.dart';

class SettingsScreen extends StatefulWidget {
  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  //const SettingsScreen({super.key});
  void pageNavigation(BuildContext ctx, screen) async {
    await Navigator.of(ctx).push(
      MaterialPageRoute(
        builder: (_) {
          return screen;
        },
      ),
    ).then((value) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final modules = Provider.of<CustomModules>(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(flex: 1),
            IntrinsicWidth(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                      child: Text(
                    'Modules',
                    textScaleFactor: 1.1,
                  )),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Expense Manager Module'),
                      Switch(
                        // This bool value toggles the switch.
                        value: modules.expenseManager!,
                        activeColor: Colors.purple,
                        onChanged: (bool value) {
                          // This is called when the user toggles the switch.
                          setState(() {
                            modules.toggleModule('Expense Manager');
                          });
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Calendar Module'),
                      Switch(
                        // This bool value toggles the switch.
                        value: modules.calendar!,
                        activeColor: Colors.purple,
                        onChanged: (bool value) {
                          // This is called when the user toggles the switch.
                          setState(() {
                            modules.toggleModule('Calendar');
                          });
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Notebook Module'),
                      Switch(
                        // This bool value toggles the switch.
                        value: modules.notebook!,
                        activeColor: Colors.purple,
                        onChanged: (bool value) {
                          // This is called when the user toggles the switch.
                          setState(() {
                            modules.toggleModule('Notebook');
                          });
                        },
                      ),
                    ],
                  ),
                  Divider(),

                  ListTile(
                    leading: Icon(Icons.dashboard_customize),
                    title: Text('Personalization'),
                    onTap: () => {
                      pageNavigation(context, PersonalizationSettingsScreen()),
                    },
                  ),
                  // ElevatedButton(
                  //   onPressed: () =>
                  //       MyApp.of(context).changeTheme(ThemeMode.system),
                  //   child: Text('System Default'),
                  // ),
                  // ElevatedButton(
                  //   onPressed:
                  //       null, // () => MyApp.of(context).changeTheme(ThemeMode.dark, 'OLED'),
                  //   child: Text('Black (OLED)'),
                  // ),
                  // ElevatedButton(
                  //   onPressed: () =>
                  //       MyApp.of(context).changeTheme(ThemeMode.dark),
                  //   child: Text('Dark'),
                  // ),
                  // ElevatedButton(
                  //   onPressed: () =>
                  //       MyApp.of(context).changeTheme(ThemeMode.light),
                  //   child: Text('Light'),
                  // ),
                ],
              ),
            ),
            Spacer(flex: 1),
          ],
        ),
      ),
    );
  }
}
