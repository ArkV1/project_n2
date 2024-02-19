import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_n2/models/app_settings.dart';
import 'package:project_n2/models/widgets/app_widget.dart';
import 'package:project_n2/tools/enums/widget_types.dart';
import 'package:project_n2/widgets/app_widgets/wallet_widget.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  late AsyncValue<List<AppWidget>> mainScreenWidgets;
  List<AppWidget> mainScreenWidgetsUI = [];

  @override
  void initState() {
    super.initState();
    mainScreenWidgets = ref.read(appWidgetByParentIdProvider(parentId: 'mainScreen'));
  }

  @override
  Widget build(BuildContext context) {
    final widgetEditig = ref.watch(widgetEditingProvider);

    // ref.listen(appWidgetByParentIdProvider(parentId: 'mainScreen'),
    //     (previous, next) {
    //   // THERE IS A PROBLEM WITH VALUES NOT UPDATING
    //   // TODO SAVE LIST ON ISEDITING CHANGE
    //   if (previous != null && previous.value != null) {
    //     Set<int> idsFromList1 =
    //         Set.from(previous.value!.map((item) => item.id));
    //     Set<int> idsFromList2 = Set.from(next.value!.map((item) => item.id));
    //     if (idsFromList1.length == idsFromList2.length &&
    //         idsFromList1.containsAll(idsFromList2)) {
    //       return;
    //     }
    //   }

    //   setState(() {
    //     mainScreenWidgets = next;
    //   });
    // });

    final mainScreenWidgets = ref.watch(appWidgetByParentIdProvider(parentId: 'mainScreen'));

    return mainScreenWidgets.when(data: (widgets) {
      mainScreenWidgetsUI = List<AppWidget>.from(widgets);
      void onReorder(int oldIndex, int newIndex) {
        newIndex = newIndex > oldIndex ? newIndex - 1 : newIndex;
        // Perform the in-memory reorder
        AppWidget movedWidget = mainScreenWidgetsUI.removeAt(oldIndex);
        mainScreenWidgetsUI.insert(newIndex, movedWidget);
        ref
            .read(appWidgetsProvider.notifier)
            .reorderInParentList(oldIndex, newIndex, mainScreenWidgetsUI);
      }

      return widgets.isNotEmpty
          ? Center(
              child: ReorderableList(
                key: const ValueKey('mainScreen'),
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                onReorder: onReorder,
                // onReorderEnd: ((_) {}),
                itemBuilder: (context, index) {
                  final appWidget = widgets
                      .singleWhere((appWidget) => mainScreenWidgetsUI[index].id == appWidget.id);
                  //final appWidget = widgets[index];
                  return ReorderableDragStartListener(
                    key: ValueKey('${widgets[index].id}rootContainer'),
                    index: index,
                    enabled: widgetEditig,
                    child: Row(
                      children: [
                        AnimatedCrossFade(
                          key: ValueKey('${widgets[index].id}dragHandle'),
                          duration: const Duration(milliseconds: 125),
                          firstChild: const Icon(
                            Icons.drag_handle,
                          ),
                          secondChild: const SizedBox.shrink(),
                          crossFadeState:
                              widgetEditig ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                        ),
                        Expanded(
                          child: Builder(builder: (context) {
                            if (appWidget.containedObjectType == ContainedObjectType.wallet) {
                              return WalletWidgetBuilder(
                                appWidget: appWidget,
                              );
                            } else if (appWidget.containedObjectType ==
                                ContainedObjectType.toDoList) {
                              return const Text('ToDo Widgets are WIP');
                              // final toDoWidget = appWidget.toDoWidget!;
                              // final toDoList = toDoLists.singleWhere(
                              //     (element) =>
                              //         element.id == toDoWidget.toDoListId);
                              // return ToDoWidgetBuilder(
                              //   toDoWidget: toDoWidget,
                              //   toDoList: toDoList,
                              // );
                            } else {
                              return Text(
                                'Unknown widget of type: ${appWidget.containedObjectType}',
                              );
                            }
                          }),
                        ),
                        AnimatedCrossFade(
                          key: ValueKey('${widgets[index].id}removeButton'),
                          duration: const Duration(milliseconds: 125),
                          firstChild: IntrinsicHeight(
                            child: Container(
                              padding: EdgeInsets.zero,
                              margin: const EdgeInsets.only(right: 4.0),
                              child: Column(
                                children: [
                                  // if (appWidget.containedObjectType ==
                                  //         ContainedObjectType.wallet &&
                                  //     appWidget
                                  //         .walletWidget!.widgetType.hasSettings)
                                  //   ElevatedButton(
                                  //     style: ElevatedButton.styleFrom(
                                  //       padding: EdgeInsets.zero,
                                  //       shape: RoundedRectangleBorder(
                                  //         borderRadius: BorderRadius.circular(10),
                                  //       ),
                                  //     ),
                                  //     onPressed: () {
                                  //       // ref
                                  //       //     .read(dataManagerProvider)
                                  //       //     .insertAppWidget(appWidget);
                                  //     },
                                  //     child: const Icon(
                                  //       Icons.settings,
                                  //     ),
                                  //   ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      padding: EdgeInsets.zero,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      foregroundColor: Colors.red,
                                    ),
                                    onPressed: () {
                                      ref.read(appWidgetsProvider.notifier).deleteAppWidget(
                                            widgets[index],
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
                          crossFadeState:
                              widgetEditig ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                        ),
                      ],
                    ),
                  );
                },
                itemCount: widgets.length,
              ),
            )
          : const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('No widgets chosen'),
              ],
            );
    }, error: (error, stacktrace) {
      debugPrint(stacktrace.toString());
      return Text(error.toString());
    }, loading: () {
      return const Center(child: CircularProgressIndicator());
    });
  }
}
