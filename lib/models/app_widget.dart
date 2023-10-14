import 'package:project_n2/tools/enums/widget_types.dart';

class AppWidget {
  String id;
  String? parentId;
  int? parentIndex;
  ContainedObjectType containedObjectType;

  AppWidget({
    required this.id,
    this.parentId,
    this.parentIndex,
    required this.containedObjectType,
  });

  factory AppWidget.fromMap(
    Map<String, dynamic> data,
  ) {
    return AppWidget(
      id: data['id'],
      parentId: data['childOfId'],
      parentIndex: data['parentIndex'],
      containedObjectType:
          ContainedObjectType.values.byName(data['containedObjectType']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'parentId': parentId,
      'parentIndex': parentIndex,
      'containedObjectType': containedObjectType.name,
    };
  }
}
