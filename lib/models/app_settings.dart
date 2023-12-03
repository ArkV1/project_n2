import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:project_n2/models/data_manager.dart';
import 'package:project_n2/models/shared_prefs.dart';
import 'package:project_n2/tools/enums/settings.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '/tools/constants.dart';

part 'app_settings.freezed.dart';
part 'app_settings.g.dart';

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
  FutureOr<CustomTheme> build() {
    return initialize();
  }

  Future<CustomTheme> initialize() async {
    return await ref.read(sharedPrefsProvider.future).then((_) async {
      debugPrint('Initializing Theme');
      final prefs = ref.read(sharedPrefsProvider.notifier);
      // Ergonomics
      final ergonomicsString = await prefs.getString('ergonomics');
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
      final themeModeString = await prefs.getString('theme');
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
      final primaryColorString = await prefs.getString('primaryColor');
      Map primaryColor;
      final primaryContrastingColorString =
          await prefs.getString('primaryContrastingColor');
      Map primaryContrastingColor;

      if (primaryColorString != null) {
        primaryColor = primaryColorList
            .firstWhere((element) => element['color'] == primaryColorString);
      } else {
        primaryColor = primaryColorList
            .firstWhere((element) => element['color'] == 'Grey');
      }
      if (primaryContrastingColorString != null) {
        primaryContrastingColor = secondaryColorList.firstWhere(
            (element) => element['color'] == primaryContrastingColorString);
      } else {
        primaryContrastingColor = secondaryColorList
            .firstWhere((element) => element['color'] == 'Grey');
      }
      //////////////////////////////////////////////////////////////////////////////////
      return CustomTheme(
        ergonomics: ergonomics,
        themeMode: themeMode,
        primaryColor: primaryColor,
        primaryContrastingColor: primaryContrastingColor,
      );
    });
  }

  setThemeMode(ThemeModes themeMode) async {
    final prefs = ref.watch(sharedPrefsProvider.notifier);
    switch (themeMode) {
      case ThemeModes.system:
        await prefs.remove('theme');
        state = AsyncData(state.value!.copyWith(themeMode: ThemeMode.system));
        break;
      case ThemeModes.light:
        await prefs.setString('theme', 'Light');
        state = AsyncData(state.value!.copyWith(themeMode: ThemeMode.light));
        break;
      case ThemeModes.dark:
        await prefs.setString('theme', 'Dark');
        state = AsyncData(state.value!.copyWith(themeMode: ThemeMode.dark));
        break;
      case ThemeModes.black:
        await prefs.setString('theme', 'Black (OLED)');
        state =
            state = AsyncData(state.value!.copyWith(themeMode: ThemeMode.dark));
        break;
    }
  }

  void setColor(
    String newColor, {
    bool isContrastingColor = false,
  }) async {
    final prefs = ref.watch(sharedPrefsProvider.notifier);
    if (!isContrastingColor) {
      final primaryColor = primaryColorList
          .firstWhere((element) => element['color'] == newColor);
      state = AsyncData(state.value!.copyWith(primaryColor: primaryColor));
      prefs.setString('primaryColor', primaryColor['color']);
    } else {
      final primaryContrastingColor = secondaryColorList
          .firstWhere((element) => element['color'] == newColor);
      state = AsyncData(state.value!
          .copyWith(primaryContrastingColor: primaryContrastingColor));
      prefs.setString(
          'primaryContrastingColor', primaryContrastingColor['color']);
    }
  }

  void setErgonomics(Ergonomics ergonomics) async {
    final prefs = ref.watch(sharedPrefsProvider.notifier);
    state = AsyncData(state.value!.copyWith(ergonomics: ergonomics));
    prefs.setString('ergonomics', ergonomics.text);
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
  Future<Map<String, bool>> build() async {
    final appComponentsNames =
        AppComponents.values.map((component) => component.name).toList();
    List<String> componentsBinaryBoolList = await ref
            .read(sharedPrefsProvider.notifier)
            .getStringList('appComponents') ??
        [];
    List<bool> convertedBoolList = [];
    for (var i = 0; i < appComponentsNames.length; i++) {
      if (i < componentsBinaryBoolList.length) {
        convertedBoolList
            .add(componentsBinaryBoolList[i] == '0' ? false : true);
      } else {
        convertedBoolList.add(false);
      }
    }
    return Map<String, bool>.fromIterables(
      appComponentsNames,
      convertedBoolList,
    );
  }

  componentSwitch(String component) {
    final componentMap = state.value!;
    componentMap[component] = !componentMap[component]!;
    ref.read(sharedPrefsProvider.notifier).setStringList(
          'appComponents',
          componentMap.values.map((e) => e ? '1' : '0').toList(),
        );

    state = AsyncData(Map.from(componentMap));
  }
}
