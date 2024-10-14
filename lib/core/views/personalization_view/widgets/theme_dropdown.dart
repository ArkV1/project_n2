import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_n2/core/models/app_settings.dart';

class ThemeDropdown extends ConsumerWidget {
  const ThemeDropdown({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // String themeListDropdownValue = getCurrentTheme(ref);
    ThemeModes themeListDropdownValue = ThemeModes.values
        .byName(ref.watch(themeManagerProvider).themeMode.name);
    return DropdownButtonFormField<ThemeModes>(
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
      onChanged: (ThemeModes? value) {
        // This is called when the user selects an item.
        // final prefs = ref.read(dataManagerProvider);
        ref.read(themeManagerProvider.notifier).setThemeMode(value!);
      },
      items: ThemeModes.values
          .map<DropdownMenuItem<ThemeModes>>((ThemeModes value) {
        return DropdownMenuItem<ThemeModes>(
          enabled: value == ThemeModes.black ? false : true,
          value: value,
          child: Text(
            style: value == ThemeModes.black
                ? const TextStyle(color: Colors.grey)
                : null,
            value.text,
          ),
        );
      }).toList(),
    );
  }
}
