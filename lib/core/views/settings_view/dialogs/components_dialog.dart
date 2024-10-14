import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_n2/core/models/app_settings.dart';
import 'package:project_n2/core/models/app_components.dart';
import 'package:project_n2/tools/enums/currencies.dart';
import 'package:project_n2/tools/enums/settings.dart';

import '../../../../features/wallet/models/wallet.dart';

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
    final components = ref.watch(componentMapProvider);
    return AlertDialog(
      title: const Text(
        "App's components",
        textAlign: TextAlign.center,
      ),
      content: SizedBox(
        width: double.minPositive,
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
            for (var component in AppComponents.values)
              Column(
                children: [
                  // Add headers for categories if needed
                  if (component == AppComponents.todo)
                    const Column(
                      children: [
                        Center(
                          child: Text('Time Management'),
                        ),
                        Divider(),
                      ],
                    ),
                  if (component == AppComponents.wallet)
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
                    title: Text(component.publicName),
                    subtitle: complexityAndEfficency(component),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (components.containsKey(component.name))
                          Switch(
                            value: components[component.name]!,
                            onChanged: (value) {
                              setState(() {
                                ref.read(componentMapProvider.notifier).componentSwitch(component.name);
                                if (value) {
                                  debugPrint('${component.name.toUpperCase()} ENABLED');
                                } else {
                                  debugPrint('${component.name.toUpperCase()} DISABLED');
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

  Widget complexityAndEfficency(AppComponent component) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text(
              'Efficiency: ',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            Text(
              component.efficiency,
              style: TextStyle(
                fontSize: 12,
                color: _getColorForValue(component.efficiency),
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
              component.complexity,
              style: TextStyle(
                fontSize: 12,
                color: _getColorForValue(component.complexity),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Color? _getColorForValue(String value) {
    switch (value.toLowerCase()) {
      case 'low':
        return positiveColor;
      case 'medium':
        return mediumColor;
      case 'high':
        return negativeColor;
      default:
        return Colors.grey;
    }
  }
}
