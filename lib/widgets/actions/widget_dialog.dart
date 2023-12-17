import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_n2/models/wallet/wallet.dart';
import 'package:project_n2/models/widgets/app_widget.dart';
import 'package:project_n2/models/widgets/todo_widget.dart';
import 'package:project_n2/models/widgets/wallet_widget.dart';
import 'package:project_n2/models/widgets/widget_union.dart';
import 'package:project_n2/tools/enums/settings.dart';
import 'package:project_n2/tools/enums/widget_types.dart';

class AppWidgetDialog extends ConsumerStatefulWidget {
  final int screenIndex;
  const AppWidgetDialog(this.screenIndex, {super.key});

  @override
  ConsumerState<AppWidgetDialog> createState() => _AppWidgetDialogState();
}

class _AppWidgetDialogState extends ConsumerState<AppWidgetDialog> {
  //TextEditingController appWidgetController = TextEditingController();

  ContainedObjectType? widgetType;
  WalletWidgetType? widgetTypeWidget;

  @override
  Widget build(BuildContext context) {
    final appWidgets = ref.watch(appWidgetsProvider).value!;
    return Builder(builder: (context) {
      return AlertDialog(
        title: Text(
            'Add widget to ${Screen.values[widget.screenIndex].publicName}'),
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
            DropdownButtonFormField<ContainedObjectType>(
              value: widgetType,
              onChanged: (value) {
                setState(() {
                  widgetType = value;
                });
              },
              items: ContainedObjectType.values
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
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: DropdownButtonFormField<WalletWidgetType>(
                  value: widgetTypeWidget,
                  onChanged: (value) {
                    setState(() {
                      widgetTypeWidget = value;
                    });
                  },
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
                              .where((appWidget) =>
                                  appWidget.parentId == 'mainScreen')
                              .length,
                          containedObjectTypeIndex:
                              ContainedObjectType.wallet.index);
                      unionWidget = WidgetUnion.wallet(WalletWidget(
                        walletId: ref.read(walletsProvider).value!.first.id!,
                        widgetTypeIndex: widgetType!.index,
                      ));
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
                        containedObjectTypeIndex:
                            ContainedObjectType.other.index,
                        parentId: 'mainScreen',
                        parentIndex: appWidgets
                            .where((appWidget) =>
                                appWidget.parentId == 'mainScreen')
                            .length,
                      );
                      break;
                    case null:
                      // TODO: Handle this case.
                      break;
                  }

                  ref
                      .read(appWidgetsProvider.notifier)
                      .insertAppWidget(appWidget, unionWidget);

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
