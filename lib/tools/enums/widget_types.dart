enum ContainedObjectType {
  unknown(publicName: 'Unknown'),
  toDoList(publicName: 'To Do List'),
  wallet(publicName: 'Wallet'),
  calendar(publicName: 'Calendar'),
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

enum CalendarWidgetType {
  unknown(
    publicName: 'Unknown',
    hasSettings: false,
  ),
  monthView(
    publicName: 'Month View',
    hasSettings: true,
  ),
  weekView(
    publicName: 'Week View',
    hasSettings: true,
  ),
  dayView(
    publicName: 'Day View',
    hasSettings: true,
  );

  const CalendarWidgetType({
    required this.publicName,
    this.hasSettings = false,
  });
  final String publicName;
  final bool hasSettings;
}
