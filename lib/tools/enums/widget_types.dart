enum ContainedObjectType {
  wallet(publicName: 'Wallet'),
  toDoList(publicName: 'To Do List'),
  other(publicName: 'Other');

  const ContainedObjectType({
    required this.publicName,
  });
  final String publicName;
}

enum WalletWidgetType {
  total(
    publicName: 'Total',
    hasSettings: false,
  ),
  lastTransaction(
    publicName: 'Latest transactions',
    hasSettings: true,
  );

  const WalletWidgetType({
    required this.publicName,
    this.hasSettings = false,
  });
  final String publicName;
  final bool hasSettings;
}

enum ToDoWidgetType {
  classic,
  expanded;
  // const Currencies({
  //   required this.name,
  // });
  // final String name;
}
