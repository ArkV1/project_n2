// import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:objectbox/objectbox.dart';

import 'app_widget.dart';

// import 'package:project_n2/models/wallet/wallet.dart';
import 'package:project_n2/tools/enums/widget_types.dart';

part 'todo_widget.freezed.dart';
// part 'todo_widget.g.dart';

@freezed
class ToDoWidget with _$ToDoWidget {
  ToDoWidget._();

  @Entity(realClass: ToDoWidget)
  factory ToDoWidget({
    @Id(assignable: true) @Default(0) int? id,
    required int toDoListId,
    required int widgetTypeIndex,
    required ToOne<AppWidget> appWidgetRelation,
  }) = _ToDoWidget;

  AppWidget? get appWidget {
    return appWidgetRelation.target;
  }

  ToDoWidgetType? get widgetType {
    _ensureStableEnumValues();
    return ToDoWidgetType.values[widgetTypeIndex];
  }

  void _ensureStableEnumValues() {
    assert(ToDoWidgetType.unknown.index == 0);
    assert(ToDoWidgetType.classic.index == 1);
    assert(ToDoWidgetType.expanded.index == 2);
  }
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
