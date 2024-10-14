import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_n2/models/app_settings.dart';
import 'package:project_n2/tools/enums/app_components.dart';
import 'package:project_n2/tools/enums/currencies.dart';
import 'package:project_n2/tools/enums/settings.dart';

import '../../../models/wallet/wallet.dart';

// import '../../../models/wallet.dart';

final _formKey = GlobalKey<FormState>();

class ComponentsDialog extends ConsumerStatefulWidget {
  const ComponentsDialog({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ComponentsDialogState();
}

class _ComponentsDialogState extends ConsumerState<ComponentsDialog> {
  final positiveColor = Colors.green[600];
  final mediumColor = Colors.yellow[700];
  final negativeColor = Colors.red[600];
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
              Column(
                children: [
                  // Header for time category
                  if (AppComponents.values[i] == AppComponents.todo)
                    const Column(
                      children: [
                        Center(
                          child: Text('Time Management'),
                        ),
                        Divider(),
                      ],
                    ),
                  // Header for finance category
                  if (AppComponents.values[i] == AppComponents.wallet)
                    const Column(
                      children: [
                        Center(
                          child: Padding(
                            padding: EdgeInsets.only(top: 8.0),
                            child: Text('Finance Management'),
                          ),
                        ),
                        Divider(),
                      ],
                    ),
                  ListTile(
                    title: Text(AppComponents.values[i].publicName),
                    subtitle: complexityAndEfficency(AppComponents.values[i]),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (components.containsKey(AppComponents.values[i].name))
                          Switch(
                            value: components[AppComponents.values[i].name]!,
                            onChanged: (value) {
                              final component = AppComponents.values[i].name;
                              setState(() {
                                ref.read(componentMapProvider.notifier).componentSwitch(component);
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
              )
          ],
        ),
      ),
    );
  }

  Widget complexityAndEfficency(AppComponents component) {
    switch (component) {
      case AppComponents.todo:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text(
                  'Efficency: ',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                Text(
                  'Medium',
                  style: TextStyle(
                    fontSize: 12,
                    color: mediumColor,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const Text(
                  'Complexity: ',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                Text(
                  'Low',
                  style: TextStyle(
                    fontSize: 12,
                    color: positiveColor,
                  ),
                ),
              ],
            ),
          ],
        );
      case AppComponents.calendar:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text(
                  'Efficency: ',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                Text(
                  'High',
                  style: TextStyle(
                    fontSize: 12,
                    color: positiveColor,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const Text(
                  'Complexity: ',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                Text(
                  'Medium',
                  style: TextStyle(
                    fontSize: 12,
                    color: mediumColor,
                  ),
                ),
              ],
            ),
          ],
        );
      case AppComponents.wallet:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text(
                  'Efficency: ',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                Text(
                  'High',
                  style: TextStyle(
                    fontSize: 12,
                    color: positiveColor,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const Text(
                  'Complexity: ',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                Text(
                  'Medium',
                  style: TextStyle(
                    fontSize: 12,
                    color: mediumColor,
                  ),
                ),
              ],
            ),
          ],
        );
      default:
        return const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Efficency: ',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                Text(
                  'Unknown',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'Complexity: ',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                Text(
                  'Unknown',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        );
    }
  }
}
