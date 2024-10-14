import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_n2/core/models/app_settings.dart';

import '/tools/constants.dart';

class SecondaryColorDropdown extends ConsumerWidget {
  const SecondaryColorDropdown({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String secondaryColorListDropdownValue =
        ref.watch(themeManagerProvider).primaryContrastingColor['color'];

    return DropdownButtonFormField<String>(
      decoration: const InputDecoration(
        labelText: 'Accent color',
      ),
      value: secondaryColorListDropdownValue,
      icon: const Icon(Icons.arrow_drop_down),
      elevation: 16,
      //style: const TextStyle(color: Colors.deepPurple),
      // underline: Container(
      //   height: 2,
      //   color: Colors.deepPurpleAccent,
      // ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        ref.read(themeManagerProvider.notifier).setColor(value!, isContrastingColor: true);
        secondaryColorListDropdownValue = value;
      },
      items: secondaryColorList.map<DropdownMenuItem<String>>((Map<String, dynamic> map) {
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
