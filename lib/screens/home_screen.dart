import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_n2/data_manager.dart';
import 'package:project_n2/models/app_widget.dart';
import 'package:project_n2/models/todo/todo_list.dart';
import 'package:project_n2/models/todo/todo_widget.dart';
import 'package:project_n2/models/wallet/wallet.dart';
import 'package:project_n2/models/wallet/wallet_widget.dart';
import 'package:project_n2/providers/providers.dart';
import 'package:project_n2/tools/enums/widget_types.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  late List<Wallet> wallets;
  late List<ToDoList> toDoLists;
  late List<AppWidget> appWidgets;

  // @override
  // void initState() {
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    // ref.listen<DataManager>(dataManagerProvider,
    //     (prevDataManager, newDataManager) {
    //   // Check if the specific piece of state you're interested in has changed
    //   if (prevDataManager!.wallets != newDataManager.wallets) {
    //     // Execute side-effect or call setState (if necessary)
    //     setState(() {
    //       wallets = newDataManager.wallets;
    //     });
    //   }
    //   if (prevDataManager.toDoLists != newDataManager.toDoLists) {
    //     setState(() {
    //       toDoLists = newDataManager.toDoLists;
    //     });
    //     // Execute side-effect or call setState (if necessary)
    //   }
    //   if (prevDataManager.appWidgets != newDataManager.appWidgets) {
    //     // Execute side-effect or call setState (if necessary)
    //     setState(() {
    //       appWidgets = newDataManager.appWidgets;
    //     });
    //   }
    // });
    print('ui refresh');
    // componentMap = ref.read(componentMapProvider);
    final isEditing = ref.watch(screenEditingProvider);
    final dataManager = ref.watch(dataManagerProvider);
    wallets = dataManager.wallets;
    toDoLists = dataManager.toDoLists;
    appWidgets = dataManager.appWidgets;
    final mainScreenWidgets = List<AppWidget>.from(
        appWidgets.where((widget) => widget.parentId == 'mainScreen'));
    mainScreenWidgets.sort((a, b) => a.parentIndex!.compareTo(b.parentIndex!));

    void onReorder(int oldIndex, int newIndex) {
      newIndex = newIndex > oldIndex ? newIndex - 1 : newIndex;
      ref
          .read(dataManagerProvider)
          .reorderInParentList(oldIndex, newIndex, mainScreenWidgets, false);
    }

    return mainScreenWidgets.isNotEmpty
        ? Center(
            child: ReorderableListView.builder(
              key: const ValueKey('mainScreen'),
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              onReorder: onReorder,
              // onReorderEnd: ((_) {}),
              itemBuilder: (context, index) {
                final appWidget = mainScreenWidgets[index];
                return GestureDetector(
                  key: ValueKey('${mainScreenWidgets[index].id}rootContainer'),
                  // WORKAROUND TO DISABLE REORDERING
                  onLongPress: isEditing ? null : () {},
                  child: Row(
                    children: [
                      AnimatedCrossFade(
                        key: ValueKey(
                            '${mainScreenWidgets[index].id}dragHandle'),
                        duration: const Duration(milliseconds: 125),
                        firstChild: const Icon(
                          Icons.drag_handle,
                        ),
                        secondChild: const SizedBox.shrink(),
                        crossFadeState: isEditing
                            ? CrossFadeState.showFirst
                            : CrossFadeState.showSecond,
                      ),
                      Expanded(
                        child: Builder(builder: (context) {
                          if (appWidget is WalletWidget) {
                            final wallet = wallets.singleWhere(
                                (element) => element.id == appWidget.walletId);
                            switch (appWidget.widgetType) {
                              case WalletWidgetType.total:
                                return Container(
                                  // decoration: const BoxDecoration(
                                  //   border: Border(
                                  //     bottom: BorderSide(color: Colors.grey),
                                  //   ),
                                  // ),
                                  child: Card(
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 6.0),
                                      child: Column(
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 16.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Text(
                                                  'Total',
                                                ),
                                              ],
                                            ),
                                          ),
                                          ListTile(
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                              horizontal: 48,
                                            ),
                                            title: Text(wallet.name),
                                            trailing: const Text('Subtitle'),
                                            visualDensity:
                                                VisualDensity.comfortable,
                                            // dense: true,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              case WalletWidgetType.lastTransaction:
                                return Container(
                                  // decoration: const BoxDecoration(
                                  //   border: Border(
                                  //     bottom: BorderSide(color: Colors.grey),
                                  //   ),
                                  // ),
                                  child: Card(
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 6.0),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 16.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                const Text(
                                                  'Latest transactions',
                                                ),
                                                Text(wallet.name),
                                              ],
                                            ),
                                          ),
                                          for (var currentTransaction in wallet
                                              .transactions
                                              .toList()
                                              .reversed
                                              .take(5))
                                            ListTile(
                                              contentPadding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 32,
                                              ),
                                              title: Text(
                                                  currentTransaction.name ??
                                                      'Undefined name'),
                                              trailing: Text(
                                                currentTransaction.amount ??
                                                    '0',
                                              ),
                                              visualDensity:
                                                  VisualDensity.compact,
                                              dense: true,
                                            ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              default:
                                return Text(
                                  'Unknown wallet widget of type: ${appWidget.containedObjectType}',
                                );
                            }
                          } else if (appWidget is ToDoWidget) {
                            final toDoList = toDoLists.singleWhere((element) =>
                                element.id == appWidget.toDoListId);
                            return Container(
                              // decoration: const BoxDecoration(
                              //   border: Border(
                              //     bottom: BorderSide(color: Colors.grey),
                              //   ),
                              // ),
                              key: UniqueKey(),
                              child: Card(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 4.0),
                                      child: Text(toDoList.name),
                                    ),
                                    const ListTile(
                                      title: Text('Title'),
                                      subtitle: Text('Subtitle'),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          } else {
                            return Text(
                              'Unknown widget of type: ${appWidget.containedObjectType}',
                            );
                          }
                        }),
                      ),
                      AnimatedCrossFade(
                        key: ValueKey(
                            '${mainScreenWidgets[index].id}removeButton'),
                        duration: const Duration(milliseconds: 125),
                        firstChild: IntrinsicHeight(
                          child: Container(
                            padding: EdgeInsets.zero,
                            margin: const EdgeInsets.only(right: 4.0),
                            child: Column(
                              children: [
                                if (appWidget is WalletWidget &&
                                    appWidget.widgetType.hasSettings)
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      padding: EdgeInsets.zero,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    onPressed: () {
                                      ref
                                          .read(dataManagerProvider)
                                          .insertAppWidget(appWidget);
                                    },
                                    child: const Icon(
                                      Icons.settings,
                                    ),
                                  ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    foregroundColor: Colors.red,
                                  ),
                                  onPressed: () {
                                    ref
                                        .read(dataManagerProvider)
                                        .deleteAppWidget(
                                          mainScreenWidgets[index],
                                        );
                                    // ref.read(dataManagerProvider).deleteWalletTransaction(
                                    //       wallets[i].transactions[y],
                                    //       wallets[i].id!,
                                    //     );
                                    // ref.read(dataManagerProvider).deleteToDoTask(
                                    //     toDoLists[i].tasks[y], toDoLists[i].id!);
                                  },
                                  child: const Icon(
                                    Icons.delete,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        secondChild: const SizedBox.shrink(),
                        crossFadeState: isEditing
                            ? CrossFadeState.showFirst
                            : CrossFadeState.showSecond,
                      ),
                    ],
                  ),
                );
              },
              itemCount: mainScreenWidgets.length,
            ),
          )
        : const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('No widgets chosen'),
            ],
          );
  }
}
