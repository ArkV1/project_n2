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
  total(publicName: 'Total'),
  lastTransaction(publicName: 'Latest transactions');

  const WalletWidgetType({
    required this.publicName,
  });
  final String publicName;
}

enum ToDoWidgetType {
  classic,
  expanded;
  // const Currencies({
  //   required this.name,
  // });
  // final String name;
}
