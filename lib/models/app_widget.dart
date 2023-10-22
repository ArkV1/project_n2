//import 'package:isar/isar.dart';
import 'package:isar/isar.dart';
import 'package:project_n2/tools/enums/widget_types.dart';

//part 'app_widget.g.dart';

//@collection
class AppWidget {
  Id id = Isar.autoIncrement; // Isar uses integer IDs by default

  String? parentId;
  int? parentIndex;
  late String containedObjectTypeString;

  @ignore
  ContainedObjectType get containedObjectType => ContainedObjectType.values
      .firstWhere((e) => e.toString() == containedObjectTypeString);

  @ignore
  Map<String, dynamic>? widgetSettingsMap;

  AppWidget({
    this.parentId,
    this.parentIndex,
    required ContainedObjectType containedObjectType,
    this.widgetSettingsMap,
  }) {
    containedObjectTypeString = containedObjectType.toString();
  }

  factory AppWidget.fromMap(Map<String, dynamic> data) {
    return AppWidget(
      parentId: data['parentId'],
      parentIndex: data['parentIndex'],
      containedObjectType: ContainedObjectType.values
          .firstWhere((e) => e.toString() == data['containedObjectType']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'parentId': parentId,
      'parentIndex': parentIndex,
      'containedObjectType': containedObjectTypeString,
    };
  }
}
