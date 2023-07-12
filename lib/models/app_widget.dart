class AppWidget {
  String id;

  AppWidget({
    required this.id,
  });

  factory AppWidget.fromMap(
    Map<String, dynamic> data,
  ) {
    return AppWidget(
      id: data['id'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
    };
  }
}
