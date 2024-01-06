import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_n2/models/app_settings.dart';

import '/tools/constants.dart';

class CategoryDropdown extends ConsumerStatefulWidget {
  final Set<String> categories;
  const CategoryDropdown({required this.categories, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CategoryDropdownState();
}

class _CategoryDropdownState extends ConsumerState<CategoryDropdown> {
  @override
  Widget build(BuildContext context) {
    //String backgroundListDropdownValue = getCurrentBackground(ref);
    return DropdownButtonFormField<String>(
      decoration: const InputDecoration(
        labelText: 'Backgrounds',
      ),
      //value: background,
      icon: const Icon(Icons.arrow_drop_down),
      elevation: 16,
      //style: const TextStyle(color: Colors.deepPurple),
      // underline: Container(
      //   height: 2,
      //   color: Colors.deepPurpleAccent,
      // ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        // ref.read(themeManagerProvider.notifier).setBackground(value!);
      },
      items: widget.categories.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            //style: TextStyle(color: Colors.grey),
            value,
          ),
        );
      }).toList(),
    );
  }
}
