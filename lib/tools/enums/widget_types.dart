enum ContainedObjectType {
  unknown(publicName: 'Unknown'),
  toDoList(publicName: 'To Do List'),
  wallet(publicName: 'Wallet'),
  other(publicName: 'Other');

  const ContainedObjectType({
    required this.publicName,
  });
  final String publicName;
}

enum WalletWidgetType {
  unknown(
    publicName: 'Unknown',
    hasSettings: false,
  ),
  dailySpendings(
    publicName: 'Daily spendings',
    hasSettings: true,
  ),
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
  unknown,
  classic,
  expanded;
  // const Currencies({
  //   required this.name,
  // });
  // final String name;
}
