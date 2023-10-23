// import 'dart:convert';

import 'package:isar/isar.dart';

import '../app_widget.dart';

// import 'package:project_n2/models/wallet/wallet.dart';
import 'package:project_n2/tools/enums/widget_types.dart';

part 'todo_widget.g.dart';

@collection
class ToDoWidget extends AppWidget {
  int toDoListId;

  @enumerated
  ToDoWidgetType widgetType;

  ToDoWidget({
    super.parentId,
    super.parentIndex,
    required this.toDoListId,
    this.widgetType = ToDoWidgetType.classic,
    super.containedObjectType = ContainedObjectType.toDoList,
  });

  factory ToDoWidget.fromMap(Map<String, dynamic> data) {
    return ToDoWidget(
      parentId: data['parentId'],
      parentIndex: data['parentIndex'],
      toDoListId: data['containedObjectId'],
      widgetType: ToDoWidgetType.values[data['widgetType']],
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'parentId': parentId,
      'parentIndex': parentIndex,
      'containedObjectId': toDoListId,
      'widgetType': widgetType.index,
    };
  }
}
