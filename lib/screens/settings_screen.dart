import 'package:flutter/material.dart';

import '../main.dart';

const List<String> themeList = <String>[
  'System Default',
  'Black (OLED)',
  'Dark',
  'Light'
];
const List<String> primaryColorList = <String>[
  'Primary Color 1',
  'Primary Color 2',
  'Primary Color 3',
  'Primary Color 4',
];
const List<String> accentColorList = <String>[
  'Accent Color 1',
  'Accent Color 2',
  'Accent Color 3',
  'Accent Color 4',
];

class SettingsScreen extends StatefulWidget {
  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  //const SettingsScreen({super.key});
  String themeListdropdownValue = themeList.first;
  String primaryColorListdropdownValue = primaryColorList.first;
  String accentColorListdropdownValue = accentColorList.first;

  bool expenseManager = false;
  bool calendar = false;
  bool notebook = false;

  @override
  Widget build(BuildContext context) {
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
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: 'Theme',
                    ),
                    value: themeListdropdownValue,
                    icon: const Icon(Icons.arrow_drop_down),
                    elevation: 16,
                    //style: const TextStyle(color: Colors.deepPurple),
                    // underline: Container(
                    //   height: 2,
                    //   color: Colors.deepPurpleAccent,
                    // ),
                    onChanged: (String? value) {
                      // This is called when the user selects an item.
                      setState(() {
                        switch (value) {
                          case 'System Default':
                            MyApp.of(context).changeTheme(ThemeMode.system);
                            break;
                          case 'Black (OLED)':
                            // () => MyApp.of(context).changeTheme(ThemeMode.dark, 'OLED'),
                            break;
                          case 'Dark':
                            MyApp.of(context).changeTheme(ThemeMode.dark);
                            break;
                          case 'Light':
                            MyApp.of(context).changeTheme(ThemeMode.light);
                            break;
                        }
                        themeListdropdownValue = value!;
                      });
                    },
                    items:
                        themeList.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        enabled: value == 'Black (OLED)' ? false : true,
                        value: value,
                        child: Text(
                          style: value == 'Black (OLED)'
                              ? TextStyle(color: Colors.grey)
                              : null,
                          value,
                        ),
                      );
                    }).toList(),
                  ),
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: 'Primary color',
                    ),
                    value: primaryColorListdropdownValue,
                    icon: const Icon(Icons.arrow_drop_down),
                    elevation: 16,
                    //style: const TextStyle(color: Colors.deepPurple),
                    // underline: Container(
                    //   height: 2,
                    //   color: Colors.deepPurpleAccent,
                    // ),
                    onChanged: (String? value) {
                      // This is called when the user selects an item.
                      setState(() {
                        switch (value) {
                          case 'Primary Color 1':
                            MyApp.of(context).changeColor(Colors.purple, false);
                            break;
                          case 'Primary Color 2':
                            MyApp.of(context).changeColor(Colors.pink, false);
                            break;
                          case 'Primary Color 3':
                            //MyApp.of(context).changeTheme(ThemeMode.dark);
                            break;
                          case 'Primary Color 4':
                            //MyApp.of(context).changeTheme(ThemeMode.light);
                            break;
                        }
                        primaryColorListdropdownValue = value!;
                      });
                    },
                    items: primaryColorList
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                        ),
                      );
                    }).toList(),
                  ),
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: 'Accent color',
                    ),
                    value: accentColorListdropdownValue,
                    icon: const Icon(Icons.arrow_drop_down),
                    elevation: 16,
                    //style: const TextStyle(color: Colors.deepPurple),
                    // underline: Container(
                    //   height: 2,
                    //   color: Colors.deepPurpleAccent,
                    // ),
                    onChanged: (String? value) {
                      // This is called when the user selects an item.
                      setState(() {
                        switch (value) {
                          case 'Accent Color 1':
                            //MyApp.of(context).changeTheme(ThemeMode.system);
                            break;
                          case 'Accent Color 2':
                            // () => MyApp.of(context).changeTheme(ThemeMode.dark, 'OLED'),
                            break;
                          case 'Accent Color 3':
                            //MyApp.of(context).changeTheme(ThemeMode.dark);
                            break;
                          case 'Accent Color 4':
                            //MyApp.of(context).changeTheme(ThemeMode.light);
                            break;
                        }
                        accentColorListdropdownValue = value!;
                      });
                    },
                    items: accentColorList
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                        ),
                      );
                    }).toList(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Expense Manager Module'),
                      Switch(
                        // This bool value toggles the switch.
                        value: expenseManager,
                        activeColor: Colors.purple,
                        onChanged: (bool value) {
                          // This is called when the user toggles the switch.
                          setState(() {
                            expenseManager = value;
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
                        value: calendar,
                        activeColor: Colors.purple,
                        onChanged: (bool value) {
                          // This is called when the user toggles the switch.
                          setState(() {
                            calendar = value;
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
                        value: notebook,
                        activeColor: Colors.purple,
                        onChanged: (bool value) {
                          // This is called when the user toggles the switch.
                          setState(() {
                            notebook = value;
                          });
                        },
                      ),
                    ],
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
