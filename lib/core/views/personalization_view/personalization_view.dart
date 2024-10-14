import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_n2/core/models/app_settings.dart';

import 'widgets/theme_dropdown.dart';
import 'widgets/primary_color_dropdown.dart';
import 'widgets/secondary_color_dropdown.dart';

class PersonalizationView extends ConsumerStatefulWidget {
  const PersonalizationView({super.key});

  @override
  ConsumerState<PersonalizationView> createState() => _PersonalizationViewState();
}

class _PersonalizationViewState extends ConsumerState<PersonalizationView> {
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
