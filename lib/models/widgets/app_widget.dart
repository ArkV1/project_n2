import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:project_n2/models/data_manager.dart';

import 'package:project_n2/models/widgets/widget_union.dart';

import 'package:project_n2/models/widgets/todo_widget.dart';
import 'package:project_n2/models/widgets/wallet_widget.dart';
import 'package:project_n2/tools/enums/widget_types.dart';

part 'app_widget.freezed.dart';
part 'app_widget.g.dart';

@freezed
@Collection(ignore: {'copyWith', 'widgetSettingsMap'})
class AppWidget with _$AppWidget {
  AppWidget._();
  factory AppWidget({
    @ignore @Default(Isar.autoIncrement) Id id,
    required String parentId,
    required int parentIndex,
    @enumerated required ContainedObjectType containedObjectType,
    Map<String, dynamic>? widgetSettingsMap,
  }) = _AppWidget;

  @override
  // ignore: recursive_getters
  Id get id => id;

  factory AppWidget.fromJson(Map<String, Object?> json) =>
      _$AppWidgetFromJson(json);

  final toDoWidgetLink = IsarLink<ToDoWidget>();
  @ignore
  ToDoWidget? get toDoWidget => toDoWidgetLink.value;

  final walletWidgetLink = IsarLink<WalletWidget>();
  @ignore
  WalletWidget? get walletWidget => walletWidgetLink.value;

  //@ignore
  // String? get parentId => appWidget.value?.parentId;
  // @ignore
  // int? get parentIndex => appWidget.value?.parentIndex;
  // @ignore
  // ContainedObjectType? get containedObjectType =>
  //     appWidget.value?.containedObjectType;
  // @ignore
  // Map<String, dynamic>? get widgetSettingsMap =>
  //     appWidget.value?.widgetSettingsMap;
}

@riverpod
class AppWidgets extends _$AppWidgets {
  @override
  FutureOr<List<AppWidget>> build() {
    return getAppWidgets();
  }

  Future<List<AppWidget>> getAppWidgets() async {
    return await ref
        .read(databaseProvider.future)
        .then((isar) => isar.appWidgets.where().findAll());
  }

  Future<void> updateAppWidgets() async {
    state = AsyncData(await getAppWidgets());
  }

  Future<void> insertAppWidget(
      AppWidget parentWidget, WidgetUnion childWidget) async {
    ref.read(databaseProvider.future).then((isar) async {
      // AppWidget addedParentWidget = parentWidget;
      await isar.writeTxnSync(() async {
        await childWidget.map(
          toDo: (unionToDo) async {
            final toDoWidget = unionToDo.toDoWidget;

            // SOLUTION that works with writeTxnSync
            parentWidget.toDoWidgetLink.value = toDoWidget;
            isar.appWidgets.putSync(parentWidget);
          },
          wallet: (unionWallet) async {
            final walletWidget = unionWallet.walletWidget;

            // SOLUTION that works with writeTxnSync
            parentWidget.walletWidgetLink.value = walletWidget;
            isar.appWidgets.putSync(parentWidget);

            // AppWidget addedAppWidget = await isar.appWidgets
            //     .put(parentWidget)
            //     .then((id) => parentWidget.copyWith(id: id));
            // addedAppWidget.walletWidgetLink.value = walletWidget;
            // WalletWidget addedWalletWidget = await isar.walletWidgets
            //     .put(walletWidget)
            //     .then((id) => walletWidget.copyWith(id: id));
            // await addedAppWidget.walletWidgetLink.save();
          },
        );
      });
      await updateAppWidgets();
    });
  }

  Future<void> reorderInParentList(int oldIndex, int newIndex,
      List<AppWidget> parentWidgetsList, bool notify) async {
    ref.watch(databaseProvider.future).then((isar) async {
      debugPrint('Old index: $oldIndex');
      debugPrint('New index: $newIndex');

      // Perform the in-memory reorder
      AppWidget movedWidget = parentWidgetsList.removeAt(oldIndex);
      parentWidgetsList.insert(newIndex, movedWidget);

      // Determine the range of affected indices
      int start = (oldIndex < newIndex) ? oldIndex : newIndex;
      int end = (oldIndex > newIndex) ? oldIndex : newIndex;

      // Update local state only for affected indices
      for (int i = start; i <= end; i++) {
        parentWidgetsList[i] = parentWidgetsList[i].copyWith(parentIndex: i);
      }

      await isar.writeTxn(() async {
        for (int i = start; i <= end; i++) {
          AppWidget widget = parentWidgetsList[i];
          await isar.appWidgets.put(widget);
        }
      });
      await updateAppWidgets();
    });
  }

  Future<void> deleteAppWidget(AppWidget appWidget) async {
    ref.watch(databaseProvider.future).then((isar) async {
      int? childWidgetId;
      switch (appWidget.containedObjectType) {
        case ContainedObjectType.toDoList:
          childWidgetId = appWidget.toDoWidgetLink.value!.id;
          break;
        case ContainedObjectType.wallet:
          childWidgetId = appWidget.walletWidgetLink.value!.id;
          break;
        case ContainedObjectType.other:
          // TODO: Handle this case.
          break;
      }
      await isar.writeTxn(() async {
        switch (appWidget.containedObjectType) {
          case ContainedObjectType.toDoList:
            await isar.toDoWidgets.delete(childWidgetId!);
            break;
          case ContainedObjectType.wallet:
            await isar.walletWidgets.delete(childWidgetId!);
            break;
          case ContainedObjectType.other:
            // TODO: Handle this case.
            break;
        }
        await isar.appWidgets.delete(appWidget.id);
      });
      await updateAppWidgets();
    });
  }
}


//@collection
// class AppWidget {
//   Id id = Isar.autoIncrement; // Isar uses integer IDs by default

//   String? parentId;
//   int? parentIndex;
//   late String containedObjectTypeString;

//   @ignore
//   ContainedObjectType get containedObjectType => ContainedObjectType.values
//       .firstWhere((e) => e.toString() == containedObjectTypeString);

//   @ignore
//   Map<String, dynamic>? widgetSettingsMap;

//   AppWidget({
//     this.parentId,
//     this.parentIndex,
//     required ContainedObjectType containedObjectType,
//     this.widgetSettingsMap,
//   }) {
//     containedObjectTypeString = containedObjectType.toString();
//   }

//   factory AppWidget.fromMap(Map<String, dynamic> data) {
//     return AppWidget(
//       parentId: data['parentId'],
//       parentIndex: data['parentIndex'],
//       containedObjectType: ContainedObjectType.values
//           .firstWhere((e) => e.toString() == data['containedObjectType']),
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       'parentId': parentId,
//       'parentIndex': parentIndex,
//       'containedObjectType': containedObjectTypeString,
//     };
//   }
// }
