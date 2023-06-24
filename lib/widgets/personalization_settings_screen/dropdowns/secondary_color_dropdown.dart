import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/providers/providers.dart';
import '/providers/theme_providers.dart';

import '/tools/constants.dart';

class SecondaryColorDropdown extends ConsumerWidget {
  const SecondaryColorDropdown({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(secondaryColorProvider);
    String secondaryColorListDropdownValue =
        ref.read(secondaryColorProvider)['color'];
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
        final prefs = ref.read(prefsProvider);
        if (value != null) {
          prefs.setString('secondaryColor', value);
        }
        ref.read(secondaryColorProvider.notifier).state = secondaryColorList
            .singleWhere((element) => element['color'] == value!);
        secondaryColorListDropdownValue = value!;
      },
      items: secondaryColorList
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
