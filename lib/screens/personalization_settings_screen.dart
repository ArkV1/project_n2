import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_n2/models/app_settings.dart';

import '../widgets/personalization_settings_screen/dropdowns/theme_dropdown.dart';
import '../widgets/personalization_settings_screen/dropdowns/primary_color_dropdown.dart';
import '../widgets/personalization_settings_screen/dropdowns/secondary_color_dropdown.dart';

class PersonalizationSettingsScreen extends ConsumerStatefulWidget {
  const PersonalizationSettingsScreen({super.key});

  @override
  ConsumerState<PersonalizationSettingsScreen> createState() =>
      _PersonalizationSettingsScreenState();
}

class _PersonalizationSettingsScreenState
    extends ConsumerState<PersonalizationSettingsScreen> {
  //const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 1),
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(12)),
                child: const IntrinsicWidth(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ThemeDropdown(),
                      PrimaryColorDropdown(),
                      SecondaryColorDropdown(),
                    ],
                  ),
                ),
              ),
              const Spacer(flex: 1),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.keyboard_return),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
