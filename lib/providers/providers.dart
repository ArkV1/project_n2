import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:project_n2/models/user_data.dart';

import 'package:project_n2/models/data_manager.dart';
import 'package:project_n2/models/wallet/wallet.dart';
import 'package:project_n2/models/app_widget.dart';

import 'package:project_n2/tools/enums/screens.dart';

// INIT
final prefsProvider =
    Provider<SharedPreferences>((ref) => throw UnimplementedError());

final userDataProvider = ChangeNotifierProvider<UserData>((ref) => UserData());

final dataManagerProvider =
    ChangeNotifierProvider<DataManager>((ref) => DataManager());

final walletsProvider = FutureProvider<List<Wallet>>(
    (ref) => ref.watch(dataManagerProvider).wallets);

final appWidgetsProvider = FutureProvider<List<AppWidget>>(
    (ref) => ref.watch(dataManagerProvider).appWidgets);

final currentScreenProvider = StateProvider<Screen>((ref) => Screen.home); 

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
