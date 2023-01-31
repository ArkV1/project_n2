import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../models/theme.dart';

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

class PersonalizationSettingsScreen extends StatefulWidget {
  @override
  State<PersonalizationSettingsScreen> createState() =>
      _PersonalizationSettingsScreenState();
}

class _PersonalizationSettingsScreenState
    extends State<PersonalizationSettingsScreen> {
  //const SettingsScreen({super.key});

  bool expenseManager = false;
  bool calendar = false;
  bool notebook = false;

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<CustomTheme>(context);
    String themeListdropdownValue = themeList.first;
    String primaryColorListdropdownValue = primaryColorList.first;
    String accentColorListdropdownValue = accentColorList.first;
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
                            theme.changeTheme(ThemeMode.system);
                            break;
                          case 'Black (OLED)':
                            // theme.changeTheme(ThemeMode.dark, 'OLED');
                            break;
                          case 'Dark':
                            theme.changeTheme(ThemeMode.dark);
                            break;
                          case 'Light':
                            theme.changeTheme(ThemeMode.light);
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
                            theme.changeColor(Colors.purple, false);
                            break;
                          case 'Primary Color 2':
                            theme.changeColor(Colors.pink, false);
                            break;
                          case 'Primary Color 3':
                            // theme.changeColor(Colors.pink, false);
                            break;
                          case 'Primary Color 4':
                            // theme.changeColor(Colors.pink, false);
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
                            theme.changeColor(Colors.amber, true);
                            break;
                          case 'Accent Color 2':
                            theme.changeColor(Colors.red, true);
                            break;
                          case 'Accent Color 3':
                            // theme.changeColor(Colors.red, true);
                            break;
                          case 'Accent Color 4':
                            // theme.changeColor(Colors.red, true);
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
