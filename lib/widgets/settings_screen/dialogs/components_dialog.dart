import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_n2/models/app_settings.dart';
import 'package:project_n2/tools/enums/currencies.dart';
import 'package:project_n2/tools/enums/settings.dart';

import '../../../models/wallet/wallet.dart';

// import '../../../models/wallet.dart';

final _formKey = GlobalKey<FormState>();

class ComponentsDialog extends ConsumerStatefulWidget {
  const ComponentsDialog({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ComponentsDialogState();
}

class _ComponentsDialogState extends ConsumerState<ComponentsDialog> {
  //TextEditingController ComponentsNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //final userData = ref.watch(userDataProvider);
    final components = ref.watch(componentMapProvider);
    return AlertDialog(
      title: const Text(
        "App's components",
        textAlign: TextAlign.center,
      ),
      content: SizedBox(
        width: double.minPositive,
        //constraints: const BoxConstraints(minHeight: 100),
        child: ListView(
          shrinkWrap: true,
          children: [
            if (AppComponents.values.isEmpty)
              const Padding(
                padding: EdgeInsets.only(top: 48.0),
                child: Text(
                  'No app components',
                  textAlign: TextAlign.center,
                ),
              ),
            for (var i = 0; i < AppComponents.values.length; i++)
              ListTile(
                title: Text(AppComponents.values[i].publicName),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (components.containsKey(AppComponents.values[i].name))
                      Switch(
                        value: components[AppComponents.values[i].name]!,
                        onChanged: (value) {
                          final component = AppComponents.values[i].name;
                          setState(() {
                            ref
                                .read(componentMapProvider.notifier)
                                .componentSwitch(component);
                            if (value) {
                              debugPrint('${component.toUpperCase()} ENABLED');
                            } else {
                              debugPrint('${component.toUpperCase()} DISABLED');
                            }
                          });
                        },
                      ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
