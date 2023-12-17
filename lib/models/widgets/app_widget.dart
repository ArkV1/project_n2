import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:objectbox/objectbox.dart';
import 'package:project_n2/tools/enums/widget_types.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:project_n2/models/data_manager.dart';

import 'package:project_n2/models/widgets/widget_union.dart';

import 'package:project_n2/models/widgets/todo_widget.dart';
import 'package:project_n2/models/widgets/wallet_widget.dart';
import 'package:project_n2/tools/enums/widget_types.dart';

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
    Map<String, dynamic>? widgetSettingsMap,
  }) = _AppWidget;

  // final subWidget = ToOne<WidgetUnion>();

  final toDoWidgetRelation = ToOne<ToDoWidget>();
  ToDoWidget get toDoWidget => toDoWidgetRelation.target!;

  final walletWidgetRelation = ToOne<WalletWidget>();
  WalletWidget get walletWidget => walletWidgetRelation.target!;

  ContainedObjectType? get containedObjectType {
    _ensureStableEnumValues();
    return ContainedObjectType.values[containedObjectTypeIndex];
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

  Future<void> insertAppWidget(
      AppWidget parentWidget, WidgetUnion childWidget) async {
    final appWidgets = db.box<AppWidget>();
    await childWidget.map(
      toDo: (unionToDo) async {
        final toDoWidget = unionToDo.toDoWidget;
        parentWidget.toDoWidgetRelation.target = toDoWidget;
        appWidgets.putAsync(parentWidget);
      },
      wallet: (unionWallet) async {
        final walletWidget = unionWallet.walletWidget;
        parentWidget.walletWidgetRelation.target = walletWidget;
        appWidgets.putAsync(parentWidget);
      },
    );

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

    for (int i = start; i <= end; i++) {
      AppWidget widget = parentWidgetsList[i];
      await appWidgets.putAsync(widget);
    }

    await updateAppWidgets();
  }

  Future<void> deleteAppWidget(AppWidget appWidget) async {
    int? childWidgetId;
    switch (appWidget.containedObjectType) {
      case ContainedObjectType.unknown:
        break;
      case ContainedObjectType.toDoList:
        childWidgetId = appWidget.toDoWidgetRelation.targetId;
        break;
      case ContainedObjectType.wallet:
        childWidgetId = appWidget.walletWidgetRelation.targetId;
        break;
      case ContainedObjectType.other:
        // TODO: Handle this case.
        break;
    }
    switch (appWidget.containedObjectType) {
      case ContainedObjectType.unknown:
        break;
      case ContainedObjectType.toDoList:
        final toDoWidgets = db.box<ToDoWidget>();
        await toDoWidgets.removeAsync(childWidgetId!);
        break;
      case ContainedObjectType.wallet:
        final walletWidgets = db.box<WalletWidget>();
        await walletWidgets.removeAsync(childWidgetId!);
        break;
      case ContainedObjectType.other:
        // TODO: Handle this case.
        break;
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
    final sortedList =
        appWidgets.where((appWidget) => appWidget.parentId == parentId).toList()
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
