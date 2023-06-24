import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/providers/providers.dart';
import '/providers/theme_providers.dart';

import '/tools/constants.dart';

getCurrentTheme(WidgetRef ref) {
  final themeMode = ref.read(themeModeProvider);
  switch (themeMode) {
    case ThemeMode.system:
      return themeList[0];
    case ThemeMode.light:
      return themeList[1];
    case ThemeMode.dark:
      return themeList[2];
    default:
      return themeList[0];
  }
}

class ThemeDropdown extends ConsumerWidget {
  const ThemeDropdown({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String themeListDropdownValue = getCurrentTheme(ref);
    return DropdownButtonFormField<String>(
      decoration: const InputDecoration(
        labelText: 'Theme',
      ),
      value: themeListDropdownValue,
      icon: const Icon(Icons.arrow_drop_down),
      elevation: 16,
      //style: const TextStyle(color: Colors.deepPurple),
      // underline: Container(
      //   height: 2,
      //   color: Colors.deepPurpleAccent,
      // ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        final prefs = ref.read(prefsProvider);

        switch (value) {
          case 'System Default':
            ref.read(themeModeProvider.notifier).state = ThemeMode.system;
            prefs.remove('theme');
            break;
          case 'Light':
            ref.read(themeModeProvider.notifier).state = ThemeMode.light;
            prefs.setString('theme', 'Light');
            break;
          case 'Dark':
            ref.read(themeModeProvider.notifier).state = ThemeMode.dark;
            prefs.setString('theme', 'Dark');
            break;
          case 'Black (OLED)':
            ref.read(themeModeProvider.notifier).state = ThemeMode.dark;
            prefs.setString('theme', 'Black (OLED)');
            break;
        }
        themeListDropdownValue = value!;
      },
      items: themeList.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          enabled: value == 'Black (OLED)' ? false : true,
          value: value,
          child: Text(
            style: value == 'Black (OLED)'
                ? const TextStyle(color: Colors.grey)
                : null,
            value,
          ),
        );
      }).toList(),
    );
  }
}
