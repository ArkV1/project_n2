import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_n2/models/app_settings.dart';
import 'package:project_n2/models/shared_prefs.dart';
import '/providers/theme_providers.dart';

import '/tools/constants.dart';

class PrimaryColorDropdown extends ConsumerWidget {
  const PrimaryColorDropdown({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String primaryColorListDropdownValue =
        ref.watch(themeManagerProvider).primaryColor['color'];

    return DropdownButtonFormField<String>(
      decoration: const InputDecoration(
        labelText: 'Primary color',
      ),
      //const TextStyle(color: Colors.white),
      value: primaryColorListDropdownValue,
      icon: const Icon(Icons.arrow_drop_down),
      elevation: 16,
      //style: const TextStyle(color: Colors.deepPurple),
      // underline: Container(
      //   height: 2,
      //   color: Colors.deepPurpleAccent,
      // ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        ref.read(themeManagerProvider.notifier).setColor(value!);
        primaryColorListDropdownValue = value;
      },
      items: primaryColorList
          .map<DropdownMenuItem<String>>((Map<String, dynamic> map) {
        return DropdownMenuItem(
          value: map['color'],
          child: Container(
            alignment: Alignment.center,
            constraints: const BoxConstraints(minHeight: 48.0),
            color: Color(map['num']),
            child: Text(
              map['color'],
            ),
          ),
        );
      }).toList(),
    );
  }
}
