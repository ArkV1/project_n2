import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/providers/providers.dart';

import '/tools/constants.dart';

//////////////////////////////////////////////////////////////////////////////////

final themeModeProvider = StateProvider<ThemeMode>(
  (ref) {
    final themeModeString = ref.read(prefsProvider).getString('theme');
    switch (themeModeString) {
      case null:
        return ThemeMode.system;
      case 'Light':
        return ThemeMode.light;
      case 'Dark':
        return ThemeMode.dark;
      case 'Black (OLED)':
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  },
);

//////////////////////////////////////////////////////////////////////////////////

final primaryColorProvider = StateProvider<Map<String, dynamic>>((ref) {
  final primaryColor = ref.read(prefsProvider).getString('primaryColor');
  if (primaryColor != null) {
    return primaryColorList
        .firstWhere((element) => element['color'] == primaryColor);
  } else {
    return primaryColorList
        .firstWhere((element) => element['color'] == 'Purple');
  }
});

final secondaryColorProvider = StateProvider<Map<String, dynamic>>((ref) {
  final secondaryColor = ref.read(prefsProvider).getString('secondaryColor');
  if (secondaryColor != null) {
    return secondaryColorList
        .firstWhere((element) => element['color'] == secondaryColor);
  } else {
    return secondaryColorList
        .firstWhere((element) => element['color'] == 'Amber');
  }
});

//////////////////////////////////////////////////////////////////////////////////

final backgroundProvider = StateProvider<String>((ref) =>
    ref.read(prefsProvider).getString('background') ?? 'V3 - Questions');
