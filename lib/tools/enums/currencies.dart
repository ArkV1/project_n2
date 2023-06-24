enum Currencies {
  usd(name: 'USD');

  const Currencies({
    required this.name,
  });

  final String name;
}
