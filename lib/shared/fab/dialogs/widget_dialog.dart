import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_n2/models/app_settings.dart';
import 'package:project_n2/models/wallet/wallet.dart';
import 'package:project_n2/models/widgets/app_widget.dart';
import 'package:project_n2/models/widgets/todo_widget.dart';
import 'package:project_n2/models/widgets/wallet_widget.dart';
import 'package:project_n2/models/widgets/widget_union.dart';
import 'package:project_n2/objectbox.g.dart';
import 'package:project_n2/tools/enums/app_components.dart';
import 'package:project_n2/tools/enums/settings.dart';
import 'package:project_n2/tools/enums/widget_types.dart';
import 'package:project_n2/views/settings_view/dialogs/components_dialog.dart';
import 'package:project_n2/views/settings_view/dialogs/wallet_dialog/wallets_dialog.dart';

class AppWidgetDialog extends ConsumerStatefulWidget {
  final String routePath;
  final int? screenIndex;
  const AppWidgetDialog(this.routePath, {this.screenIndex, super.key});

  @override
  ConsumerState<AppWidgetDialog> createState() => _AppWidgetDialogState();
}

class _AppWidgetDialogState extends ConsumerState<AppWidgetDialog> {
  //TextEditingController appWidgetController = TextEditingController();

  ContainedObjectType? widgetType;
  WalletWidgetType? widgetTypeWidget;
  Wallet? widgetWallet;

  @override
  Widget build(BuildContext context) {
    print(widgetWallet);
    final componentMap = ref.watch(componentMapProvider);
    final appWidgets = ref.watch(appWidgetsProvider).value!;
    final wallets = ref.watch(walletsProvider);
    return Builder(builder: (context) {
      return AlertDialog(
        title: Text(
          'Add widget to\n${Screens.fromPath(widget.routePath)?.publicName ?? 'Unknown'} screen',
          textAlign: TextAlign.center,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            //Text('AppWidget name'),
            // TextField(
            //   keyboardType: TextInputType.text,
            //   decoration: const InputDecoration(
            //     hintText: 'Order groceries',
            //   ),
            //   controller: appWidgetController,
            // ),
            if (!componentMap.containsValue(true))
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: TextButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => const ComponentsDialog(),
                    ).then((value) => setState(() {}));
                  },
                  child: const Text('No components enabled'),
                ),
              ),
            DropdownButtonFormField<ContainedObjectType>(
              value: widgetType,
              onChanged: (value) {
                setState(() {
                  // First, set the widgetType to the new value
                  widgetType = value;
                  // Then, based on new widgetType set the appropriate default values
                  switch (widgetType) {
                    case ContainedObjectType.wallet:
                      widgetWallet ??= ref.read(defaultWalletProvider);
                      break;
                    case ContainedObjectType.toDoList:
                      widgetWallet = null;
                      break;
                    case ContainedObjectType.other:
                      break;
                    case ContainedObjectType.unknown:
                      break;
                    case null:
                      debugPrint('ContainedObjectType is null');
                      break;
                  }
                });
              },
              items: ContainedObjectType.values
                  .where((containedObjectType) {
                    switch (containedObjectType) {
                      case ContainedObjectType.wallet:
                        return componentMap[AppComponents.wallet.name] ?? false;
                      case ContainedObjectType.toDoList:
                        return componentMap[AppComponents.todo.name] ?? false;
                      case ContainedObjectType.other:
                        return false;
                      case ContainedObjectType.unknown:
                        return false;
                    }
                  })
                  .map((type) => DropdownMenuItem<ContainedObjectType>(
                        value: type,
                        child: Text(type.publicName),
                      ))
                  .toList(),
              decoration: const InputDecoration(
                labelText: 'Widgets by Object Type',
                border: OutlineInputBorder(),
              ),
            ),
            if (widgetType == ContainedObjectType.wallet)
              Column(
                children: [
                  if (wallets.isEmpty)
                    TextButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) => const WalletsDialog(),
                        ).then((value) => setState(() {
                              widgetWallet = ref.read(defaultWalletProvider);
                            }));
                      },
                      child: const Text('No wallets available'),
                    ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: DropdownButtonFormField<int>(
                      disabledHint: Text(widgetWallet?.name ?? 'No wallets'),
                      value: widgetWallet?.id!,
                      onChanged: (value) {
                        setState(() {
                          widgetWallet = ref.read(walletByIdProvider(walletId: value));
                        });
                      },
                      items: wallets.map((wallet) {
                        return DropdownMenuItem<int>(
                          value: wallet.id!,
                          child: Text(wallet.name),
                        );
                      }).toList(),
                      decoration: const InputDecoration(
                        labelText: 'Wallets',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: DropdownButtonFormField<WalletWidgetType>(
                      value: widgetTypeWidget,
                      onChanged: widgetWallet != null
                          ? (value) {
                              setState(() {
                                widgetTypeWidget = value;
                              });
                            }
                          : null,
                      items: WalletWidgetType.values
                          .map((type) => DropdownMenuItem<WalletWidgetType>(
                                value: type,
                                child: Text(type.publicName),
                              ))
                          .toList(),
                      decoration: const InputDecoration(
                        labelText: 'Widgets types',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: ElevatedButton(
                onPressed: () {
                  late AppWidget appWidget;
                  late WidgetUnion unionWidget;
                  switch (widgetType) {
                    case ContainedObjectType.wallet:
                      appWidget = AppWidget(
                        parentId: 'mainScreen',
                        parentIndex: appWidgets
                            .where((appWidget) => appWidget.parentId == 'mainScreen')
                            .length,
                        containedObjectTypeIndex: ContainedObjectType.wallet.index,
                        toDoWidgetRelation: ToOne<ToDoWidget>(),
                        walletWidgetRelation: ToOne<WalletWidget>(),
                      );
                      unionWidget = WidgetUnion.wallet(
                        WalletWidget(
                          walletId: widgetWallet!.id!,
                          widgetTypeIndex: widgetTypeWidget!.index,
                          appWidgetRelation: ToOne<AppWidget>(),
                        ),
                      );

                      // appWidget = WalletWidget(
                      //   walletId:
                      //       ref.read(dataManagerProvider).wallets.first.id,
                      //   parentId: 'mainScreen',
                      //   parentIndex: appWidgets
                      //       .where((appWidget) =>
                      //           appWidget.parentId == 'mainScreen')
                      //       .length,
                      //   widgetType: widgetTypeWidget!,
                      // );
                      break;
                    case ContainedObjectType.toDoList:
                      // appWidget = ToDoWidget(
                      //   toDoListId:
                      //       ref.read(dataManagerProvider).toDoLists.first.id,
                      //   containedObjectType: ContainedObjectType.wallet,
                      //   parentId: 'mainScreen',
                      //   parentIndex: appWidgets
                      //       .where((appWidget) =>
                      //           appWidget.parentId == 'mainScreen')
                      //       .length,
                      // );
                      break;
                    case ContainedObjectType.other:
                      appWidget = AppWidget(
                        containedObjectTypeIndex: ContainedObjectType.other.index,
                        parentId: 'mainScreen',
                        parentIndex: appWidgets
                            .where((appWidget) => appWidget.parentId == 'mainScreen')
                            .length,
                        walletWidgetRelation: ToOne<WalletWidget>(),
                        toDoWidgetRelation: ToOne<ToDoWidget>(),
                      );
                      break;
                    case null:
                      // TODO: Handle this case.
                      break;
                    case ContainedObjectType.unknown:
                    // TODO: Handle this case.
                  }
                  // print(appWidget);
                  // print(unionWidget);
                  ref.read(appWidgetsProvider.notifier).insertAppWidget(
                        appWidget,
                        unionWidget,
                      );

                  // ref.read(dataManagerProvider).insertAppWidgetByListID(
                  //       AppWidget(
                  //         id: currentList.tasks.length.toString(),
                  //         task: AppWidgetController.text,
                  //         toDoListId: currentList.id!,
                  //       ),
                  //       currentList.id!,
                  //     );
                  Navigator.pop(context);
                },
                child: const Text('Add'),
              ),
            ),
          ],
        ),
      );
    });
  }
}
