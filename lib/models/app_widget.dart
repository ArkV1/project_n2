class AppWidget {
  String id;
  String? childOfId;
  int? parentIndex;
  String containedObjectType;

  AppWidget({
    required this.id,
    this.childOfId,
    this.parentIndex,
    required this.containedObjectType,
  });

  factory AppWidget.fromMap(
    Map<String, dynamic> data,
  ) {
    return AppWidget(
      id: data['id'],
      childOfId: data['childOfId'],
      parentIndex: data['parentIndex'],
      containedObjectType: data['containedObjectType'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'childOfId': childOfId,
      'parentIndex': parentIndex,
      'containedObjectType': containedObjectType,
    };
  }
}
