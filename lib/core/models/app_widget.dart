import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
// ignore: unnecessary_import
import 'package:objectbox/objectbox.dart'; // Removal breaks objectbox's annotations

import 'package:project_n2/core/models/objectbox.dart';

import 'package:project_n2/tools/enums/widget_types.dart';

import 'package:project_n2/objectbox.g.dart';

part 'app_widget.freezed.dart';
part 'app_widget.g.dart';

@freezed
class AppWidget with _$AppWidget {
  AppWidget._();

  @Entity(realClass: AppWidget)
  factory AppWidget({
    @Id(assignable: true) @Default(0) int? id,
    required String parentId,
    required int parentIndex,
    required int containedObjectTypeIndex,
    required int containedObjectId,
    required int widgetTypeIndex,
    Map<String, dynamic>? widgetSettingsMap,
  }) = _AppWidget;

  ContainedObjectType? get containedObjectType {
    _ensureStableEnumValues();
    return ContainedObjectType.values[containedObjectTypeIndex];
  }

  dynamic get widgetType {
    _ensureStableEnumValues();
    switch (containedObjectType) {
      case ContainedObjectType.wallet:
        return WalletWidgetType.values[widgetTypeIndex];
      case ContainedObjectType.toDoList:
        return ToDoWidgetType.values[widgetTypeIndex];
      case ContainedObjectType.calendar:
        return CalendarWidgetType.values[widgetTypeIndex];
      case ContainedObjectType.other:
        return null;
      default:
        return null;
    }
  }

  void _ensureStableEnumValues() {
    assert(ContainedObjectType.unknown.index == 0);
    assert(ContainedObjectType.toDoList.index == 1);
    assert(ContainedObjectType.wallet.index == 2);
    assert(ContainedObjectType.other.index == 3);
  }
}

@Riverpod(keepAlive: true)
class AppWidgets extends _$AppWidgets {
  @override
  FutureOr<List<AppWidget>> build() {
    return getAppWidgets();
  }

  Future<List<AppWidget>> getAppWidgets() async {
    final appWidgets = db.box<AppWidget>();
    return appWidgets.getAll();
  }

  Future<void> updateAppWidgets() async {
    debugPrint('AppWidgets REFRESHED');
    state = AsyncData(await getAppWidgets());
  }

  Future<void> insertAppWidget(AppWidget parentWidget) async {
    final appWidgets = db.box<AppWidget>();
    int? parentWidgetId = parentWidget.id;
    // TODO Add cached id for improving speed and performance
    if (parentWidgetId == null || parentWidgetId == 0) {
      parentWidgetId = (appWidgets
                  .query()
                  .order(AppWidget_.id, flags: Order.descending)
                  .build()
                  .findFirst()
                  ?.id ??
              0) +
          1;
    }
    parentWidget = parentWidget.copyWith(id: parentWidgetId);
    parentWidget = await appWidgets.putAndGetAsync(parentWidget);
    // await childWidget.map(
    //   toDo: (unionToDo) async {
    //     final toDoWidget = unionToDo.toDoWidget;
    //     final toDoWidgets = db.box<ToDoWidget>();
    //     int? childWidgetId = parentWidget.id;
    //     // TODO Add cached id for improving speed and performance
    //     if (childWidgetId == null || childWidgetId == 0) {
    //       childWidgetId = (toDoWidgets
    //                   .query()
    //                   .order(ToDoWidget_.id, flags: Order.descending)
    //                   .build()
    //                   .findFirst()
    //                   ?.id ??
    //               0) +
    //           1;
    //     }
    //     // ToDoWidget addedChildWidget = await toDoWidgets
    //     //     .putAndGetAsync(toDoWidget.copyWith(id: childWidgetId));
    //     // parentWidget.toDoWidgetRelation.target = addedChildWidget;
    //   },
    //   wallet: (unionWallet) async {
    //     WalletWidget walletWidget = unionWallet.walletWidget;
    //     final walletWidgets = db.box<WalletWidget>();
    //     int? childWidgetId = parentWidget.id;
    //     // TODO Add cached id for improving speed and performance
    //     if (childWidgetId == null || childWidgetId == 0) {
    //       childWidgetId = (walletWidgets
    //                   .query()
    //                   .order(WalletWidget_.id, flags: Order.descending)
    //                   .build()
    //                   .findFirst()
    //                   ?.id ??
    //               0) +
    //           1;
    //     }
    //     walletWidget = walletWidget.copyWith(id: childWidgetId);

    //     WalletWidget addedChildWidget = await walletWidgets.putAndGetAsync(walletWidget);
    //     parentWidget.walletWidgetRelation.target = addedChildWidget;
    //   },
    // );
    await appWidgets.putAsync(parentWidget);
    await updateAppWidgets();
  }

  Future<void> reorderInParentList(
      int oldIndex, int newIndex, List<AppWidget> parentWidgetsList) async {
    debugPrint('Old index: $oldIndex');
    debugPrint('New index: $newIndex');

    final appWidgets = db.box<AppWidget>();

    // // Perform the in-memory reorder
    // AppWidget movedWidget = parentWidgetsList.removeAt(oldIndex);
    // parentWidgetsList.insert(newIndex, movedWidget);

    // Determine the range of affected indices
    int start = (oldIndex < newIndex) ? oldIndex : newIndex;
    int end = (oldIndex > newIndex) ? oldIndex : newIndex;

    // Update local state only for affected indices
    for (int i = start; i <= end; i++) {
      parentWidgetsList[i] = parentWidgetsList[i].copyWith(parentIndex: i);
    }
    await appWidgets.putManyAsync(parentWidgetsList);
    await updateAppWidgets();
  }

  Future<void> deleteAppWidget(AppWidget appWidget) async {
    int? childWidgetId;
    switch (appWidget.containedObjectType) {
      case ContainedObjectType.unknown:
        break;
      case ContainedObjectType.toDoList:
        // childWidgetId =
        //     appWidget.toDoWidgetRelation.hasValue ? appWidget.toDoWidgetRelation.targetId : null;
        break;
      case ContainedObjectType.wallet:
        // childWidgetId = appWidget.walletWidgetRelation.hasValue
        //     ? appWidget.walletWidgetRelation.targetId
        //     : null;
        break;
      case ContainedObjectType.calendar:
        // childWidgetId = appWidget.calendarWidgetRelation.hasValue
        //     ? appWidget.calendarWidgetRelation.targetId
        //     : null;
        break;
      case ContainedObjectType.other:
        // TODO: Handle this case.
        break;
      case null:
      // TODO: Handle this case.
    }
    switch (appWidget.containedObjectType) {
      case ContainedObjectType.unknown:
        break;
      case ContainedObjectType.toDoList:
        // if (childWidgetId != null) {
        //   final toDoWidgets = db.box<ToDoWidget>();
        //   await toDoWidgets.removeAsync(childWidgetId);
        // }
        break;
      case ContainedObjectType.wallet:
        // if (childWidgetId != null) {
        //   final walletWidgets = db.box<WalletWidget>();
        //   await walletWidgets.removeAsync(childWidgetId);
        // }
        break;
      case ContainedObjectType.calendar:
        // if (childWidgetId != null) {
        //   final calendarWidgets = db.box<CalendarWidget>();
        //   await calendarWidgets.removeAsync(childWidgetId);
        // }
        break;
      case ContainedObjectType.other:
        // TODO: Handle this case.
        break;
      case null:
      // TODO: Handle this case.
    }
    final appWidgets = db.box<AppWidget>();
    await appWidgets.removeAsync(appWidget.id!);
    await updateAppWidgets();
  }
}

@Riverpod(dependencies: [AppWidgets])
class AppWidgetByParentId extends _$AppWidgetByParentId {
  @override
  FutureOr<List<AppWidget>> build({required String parentId}) async {
    debugPrint('AppWidgetByParentId REFRESHED');
    final appWidgets = await ref.watch(appWidgetsProvider.future);
    print(appWidgets);
    final sortedList = appWidgets.where((appWidget) => appWidget.parentId == parentId).toList()
      ..sort(
        (a, b) => a.parentIndex.compareTo(b.parentIndex),
      );
    return sortedList;
  }
  // Add methods to mutate the state
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
