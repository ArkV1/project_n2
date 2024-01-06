enum Currencies {
  usd(name: 'USD', symbol: '\$'), // US Dollar
  eur(name: 'EUR', symbol: '€'), // Euro
  gbp(name: 'GBP', symbol: '£'), // British Pound
  jpy(name: 'JPY', symbol: '¥'), // Japanese Yen
  cad(name: 'CAD', symbol: 'C\$'), // Canadian Dollar
  aud(name: 'AUD', symbol: 'A\$'), // Australian Dollar
  chf(name: 'CHF', symbol: 'CHF'), // Swiss Franc
  cny(name: 'CNY', symbol: '¥'), // Chinese Yuan
  inr(name: 'INR', symbol: '₹'), // Indian Rupee
  rub(name: 'RUB', symbol: '₽'), // Russian Ruble
  nis(name: 'NIS', symbol: '₪'); // New Israeli Shekel

  const Currencies({
    required this.name,
    required this.symbol,
  });

  final String name;
  final String symbol;
}
