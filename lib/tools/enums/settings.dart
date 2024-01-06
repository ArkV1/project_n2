enum AppComponents {
  calendar(publicName: 'Calendar'),
  notebook(publicName: 'Notebooks'),
  todo(publicName: 'To Do Lists'),
  wallet(publicName: 'Wallets'),
  converter(publicName: 'Currency\nConverter');

  const AppComponents({
    required this.publicName,
  });
  final String publicName;
}

enum Screen {
  home(publicName: 'Home'),
  wallets(publicName: 'Wallet'),
  toDo(publicName: 'To Do');

  const Screen({
    required this.publicName,
  });
  final String publicName;
}
