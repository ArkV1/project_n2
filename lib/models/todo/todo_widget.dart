// import 'dart:convert';

import '../app_widget.dart';

// import 'package:project_n2/models/wallet/wallet.dart';
import 'package:project_n2/tools/enums/widget_types.dart';

class ToDoWidget extends AppWidget {
  String toDoListId;
  ToDoWidgetType widgetType;

  ToDoWidget({
    required super.id,
    super.containedObjectType = ContainedObjectType.toDoList,
    super.parentId,
    super.parentIndex,
    required this.toDoListId,
    this.widgetType = ToDoWidgetType.classic,
  });

  factory ToDoWidget.fromMap(
    Map<String, dynamic> data,
  ) {
    return ToDoWidget(
      id: data['id'],
      parentId: data['parentId'],
      parentIndex: data['parentIndex'],
      toDoListId: data['containedObjectId'],
      widgetType: ToDoWidgetType.values[data['widgetType']],
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'parentId': parentId,
      'parentIndex': parentIndex,
      'containedObjectId': toDoListId,
      'widgetType': widgetType.index,
    };
  }

  // factory ToDoWidget.fromText(
  //   String encodedString,
  // ) {
  //   final valueMap = json.decode(encodedString);
  //   return ToDoWidget(
  //     id: valueMap['id'],
  //     wallet: Wallet.fromMap(valueMap['wallet']),
  //     widgetType: ToDoWidgetType.values[valueMap['widgetType']],
  //   );
  // }

  // String toText() {
  //   final valueMap = {
  //     'id': id,
  //     'wallet': wallet.toMap(),
  //     'widgetType': widgetType.index,
  //   };
  //   return jsonEncode(valueMap);
  // }
}
