import 'dart:io';
import 'package:path_provider/path_provider.dart';

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:project_n2/core/models/shared_prefs.dart';
import 'package:project_n2/core/models/app_components.dart';
import 'package:project_n2/tools/enums/settings.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '/tools/constants.dart';

part 'app_settings.freezed.dart';
part 'app_settings.g.dart';

enum ReorderingStates {
  awaiting,
  reordering;
}

enum ThemeModes {
  system(text: 'System Default'),
  light(text: 'Light'),
  dark(text: 'Dark'),
  black(text: 'Black (OLED)');

  const ThemeModes({
    required this.text,
  });

  final String text;
}

enum Ergonomics {
  right(text: 'Right-handed'),
  left(text: 'Left-handed');
  // other(text: 'Other');

  const Ergonomics({
    required this.text,
  });

  final String text;
}

@freezed
class CustomTheme with _$CustomTheme {
  factory CustomTheme({
    required Ergonomics ergonomics,
    required ThemeMode themeMode,
    required Map primaryColor,
    required Map primaryContrastingColor,
  }) = _CustomTheme;

  // factory CustomTheme.fromJson(Map<String, dynamic> json) =>
  //     _$CustomThemeFromJson(json);
}

@Riverpod(keepAlive: true)
class ThemeManager extends _$ThemeManager {
  @override
  CustomTheme build() {
    return initialize();
  }

  CustomTheme initialize() {
    debugPrint('Initializing Theme');
    final prefs = ref.read(sharedPrefsProvider.notifier);
    // Ergonomics
    final ergonomicsString = prefs.getString('ergonomics');
    Ergonomics ergonomics;
    switch (ergonomicsString) {
      case null:
        ergonomics = Ergonomics.right;
        break;
      case 'Right-handed':
        ergonomics = Ergonomics.right;
        break;
      case 'Left-handed':
        ergonomics = Ergonomics.left;
        break;
      // case 'Other':
      //   return Ergonomics.other;
      default:
        ergonomics = Ergonomics.right;
    }
    // ThemeMode
    final themeModeString = prefs.getString('theme');
    ThemeMode themeMode;
    switch (themeModeString) {
      case null:
        themeMode = ThemeMode.system;
        break;
      case 'Light':
        themeMode = ThemeMode.light;
        break;
      case 'Dark':
        themeMode = ThemeMode.dark;
        break;
      case 'Black (OLED)':
        themeMode = ThemeMode.dark;
        break;
      default:
        themeMode = ThemeMode.system;
        break;
    }
    // Colors
    final primaryColorString = prefs.getString('primaryColor');
    Map primaryColor;
    final primaryContrastingColorString = prefs.getString('primaryContrastingColor');
    Map primaryContrastingColor;

    if (primaryColorString != null) {
      primaryColor =
          primaryColorList.firstWhere((element) => element['color'] == primaryColorString);
    } else {
      primaryColor = primaryColorList.firstWhere((element) => element['color'] == 'Grey');
    }
    if (primaryContrastingColorString != null) {
      primaryContrastingColor = secondaryColorList
          .firstWhere((element) => element['color'] == primaryContrastingColorString);
    } else {
      primaryContrastingColor =
          secondaryColorList.firstWhere((element) => element['color'] == 'Grey');
    }
    //////////////////////////////////////////////////////////////////////////////////
    return CustomTheme(
      ergonomics: ergonomics,
      themeMode: themeMode,
      primaryColor: primaryColor,
      primaryContrastingColor: primaryContrastingColor,
    );
  }

  setThemeMode(ThemeModes themeMode) async {
    final prefs = ref.watch(sharedPrefsProvider.notifier);
    switch (themeMode) {
      case ThemeModes.system:
        prefs.remove('theme');
        state = state.copyWith(themeMode: ThemeMode.system);
        break;
      case ThemeModes.light:
        prefs.setString('theme', 'Light');
        state = state.copyWith(themeMode: ThemeMode.light);
        break;
      case ThemeModes.dark:
        prefs.setString('theme', 'Dark');
        state = state.copyWith(themeMode: ThemeMode.dark);
        break;
      case ThemeModes.black:
        prefs.setString('theme', 'Black (OLED)');
        state = state = state.copyWith(themeMode: ThemeMode.dark);
        break;
    }
  }

  void setColor(
    String newColor, {
    bool isContrastingColor = false,
  }) async {
    final prefs = ref.watch(sharedPrefsProvider.notifier);
    if (!isContrastingColor) {
      final primaryColor = primaryColorList.firstWhere((element) => element['color'] == newColor);
      state = state.copyWith(primaryColor: primaryColor);
      prefs.setString('primaryColor', primaryColor['color']);
    } else {
      final primaryContrastingColor =
          secondaryColorList.firstWhere((element) => element['color'] == newColor);
      state = state.copyWith(primaryContrastingColor: primaryContrastingColor);
      prefs.setString('primaryContrastingColor', primaryContrastingColor['color']);
    }
  }

  void setErgonomics(Ergonomics ergonomics) async {
    final prefs = ref.watch(sharedPrefsProvider.notifier);
    state = state.copyWith(ergonomics: ergonomics);
    prefs.setString('ergonomics', ergonomics.text);
  }
}

@riverpod
class ReorderingState extends _$ReorderingState {
  @override
  ReorderingStates build() {
    return ReorderingStates.awaiting;
  }

  void changeState({required ReorderingStates value}) {
    state = value;
  }
}

@riverpod
class ScreenEditing extends _$ScreenEditing {
  @override
  bool build() {
    return false;
  }

  void toggle({bool? optionalValue}) {
    optionalValue != null ? state = optionalValue : state = !state;
  }
}

@riverpod
class WidgetEditing extends _$WidgetEditing {
  @override
  bool build() {
    return false;
  }

  void toggle({bool? optionalValue}) {
    optionalValue != null ? state = optionalValue : state = !state;
  }
}

@riverpod
class ScreenIndex extends _$ScreenIndex {
  @override
  int build() {
    return 0;
  }

  void changeIndex(int value) {
    state = value;
  }
}

@Riverpod(keepAlive: true)
class ComponentMap extends _$ComponentMap {
  @override
  Map<String, bool> build() {
    final componentNames = AppComponents.values.map((c) => c.name).toList();
    List<String> componentsBinaryBoolList =
        ref.read(sharedPrefsProvider.notifier).getStringList('appComponents') ?? [];
    List<bool> convertedBoolList = [];
    for (var i = 0; i < componentNames.length; i++) {
      if (i < componentsBinaryBoolList.length) {
        convertedBoolList.add(componentsBinaryBoolList[i] == '0' ? false : true);
      } else {
        convertedBoolList.add(false);
      }
    }
    return Map<String, bool>.fromIterables(
      componentNames,
      convertedBoolList,
    );
  }

  componentSwitch(String component) {
    final componentMap = state;
    componentMap[component] = !componentMap[component]!;
    ref.read(sharedPrefsProvider.notifier).setStringList(
          'appComponents',
          componentMap.values.map((e) => e ? '1' : '0').toList(),
        );

    state = Map.from(componentMap);
  }
}

@riverpod
class CurrentDirectory extends _$CurrentDirectory {
  @override
  Future<Directory> build() {
    return getApplicationDocumentsDirectory();
  }

  // Add methods to mutate the state}
}
