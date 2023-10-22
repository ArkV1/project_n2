import 'dart:ffi';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_n2/models/todo/todo_list.dart';
import 'package:project_n2/tools/enums/settings.dart';

import 'package:project_n2/models/user_data.dart';

import 'package:project_n2/data_manager.dart';
import 'package:project_n2/models/wallet/wallet.dart';
import 'package:project_n2/models/app_widget.dart';

// INIT
final userDataProvider = ChangeNotifierProvider<UserData>((ref) => UserData());

// final prefsProvider =
//     Provider<SharedPreferences>((ref) => throw UnimplementedError());

final dataManagerProvider = ChangeNotifierProvider<DataManager>(
  (ref) => DataManager.instance,
);

final walletsProvider = FutureProvider<List<Wallet>>(
    (ref) => ref.watch(dataManagerProvider).wallets);

final toDoListsProvider = FutureProvider<List<ToDoList>>(
    (ref) => ref.watch(dataManagerProvider).toDoLists);

final appWidgetsProvider = FutureProvider<List<AppWidget>>(
    (ref) => ref.watch(dataManagerProvider).appWidgets);

final screenEditingProvider = StateProvider<bool>((ref) => false);

final screenIndexProvider = StateProvider<int>((ref) => 0);

// final containerListProvider =
//     StateNotifierProvider<ContainerListState, List<AppWidget>>((ref) {
//   return ContainerListState();
// });

// class ContainerListState extends StateNotifier<List<AppWidget>> {
//   ContainerListState() : super(const []);

//   bool isEnabled(String id) {
//     return state.any((appWidget) => appWidget.id == id);
//   }

//   void addWidget(AppWidget widgetToAdd) {
//     // TODO: Replace state.length with your unique ID
//     state = [...state, widgetToAdd];
//   }

//   void removeWidget(
//     AppWidget widgetToRemove,
//   ) {
//     final newState = state;
//     newState.removeWhere(
//       (appWidget) {
//         return appWidget.id == widgetToRemove.id;
//       },
//     );
//     state = [...newState];
//     // state = state.map((appWidget) {
//     //   return appWidget.id == id ? appWidget(id) : appWidget;
//     // }).toList();
//   }

//   // void setAllColor(Color color) {F
//   //   state = state.map((model) => Model(model.id, color)).toList();
//   // }

//   // void setModelColor(Model model, Color color) {
//   //   final id = model.id;
//   //   state = state.map((model) {
//   //     return model.id == id ? Model(id, color) : model;
//   //   }).toList();
//   // }
// }

final componentMapProvider = StateProvider<Map<String, bool>>((ref) {
  final appComponentsNames =
      AppComponents.values.map((component) => component.name).toList();
  List<String> componentsBinaryBoolList =
      ref.read(dataManagerProvider).getStringList('appComponents') ?? [];
  List<bool> convertedBoolList = [];
  for (var i = 0; i < appComponentsNames.length; i++) {
    if (i < componentsBinaryBoolList.length) {
      convertedBoolList.add(componentsBinaryBoolList[i] == '0' ? false : true);
    } else {
      convertedBoolList.add(false);
    }
  }
  return Map<String, bool>.fromIterables(
    appComponentsNames,
    convertedBoolList,
  );
});

componentSwitch(WidgetRef ref, String component) {
  ref.read(componentMapProvider.notifier).update((componentMap) {
    componentMap[component] = !componentMap[component]!;
    ref.read(dataManagerProvider).setStringList(
          'appComponents',
          componentMap.values.map((e) => e ? '1' : '0').toList(),
        );
    return Map.from(componentMap);
  });
}
