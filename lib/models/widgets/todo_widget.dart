// import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

import 'app_widget.dart';

// import 'package:project_n2/models/wallet/wallet.dart';
import 'package:project_n2/tools/enums/widget_types.dart';

part 'todo_widget.freezed.dart';
part 'todo_widget.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class ToDoWidget with _$ToDoWidget {
  ToDoWidget._();
  factory ToDoWidget({
    @ignore @Default(Isar.autoIncrement) Id id,
    required int toDoListId,
    @enumerated required ToDoWidgetType widgetType,
  }) = _ToDoWidget;

  @override
  // ignore: recursive_getters
  Id get id => id;

  @Backlink(to: "toDoWidgetLink")
  final appWidget = IsarLink<AppWidget>();

  // @ignore
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


// @collection
// class ToDoWidget extends AppWidget {
//   int toDoListId;

//   @enumerated
//   ToDoWidgetType widgetType;

//   ToDoWidget({
//     super.parentId,
//     super.parentIndex,
//     required this.toDoListId,
//     this.widgetType = ToDoWidgetType.classic,
//     super.containedObjectType = ContainedObjectType.toDoList,
//   });

//   factory ToDoWidget.fromMap(Map<String, dynamic> data) {
//     return ToDoWidget(
//       parentId: data['parentId'],
//       parentIndex: data['parentIndex'],
//       toDoListId: data['containedObjectId'],
//       widgetType: ToDoWidgetType.values[data['widgetType']],
//     );
//   }

//   @override
//   Map<String, dynamic> toMap() {
//     return {
//       'parentId': parentId,
//       'parentIndex': parentIndex,
//       'containedObjectId': toDoListId,
//       'widgetType': widgetType.index,
//     };
//   }
// }
