class AppWidget {
  String id;
  String? parentId;
  int? parentIndex;
  String containedObjectType;

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
      containedObjectType: data['containedObjectType'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'parentId': parentId,
      'parentIndex': parentIndex,
      'containedObjectType': containedObjectType,
    };
  }
}
