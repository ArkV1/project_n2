import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:objectbox/objectbox.dart';

import 'package:project_n2/models/wallet/wallet.dart';
import 'package:project_n2/models/wallet/wallet_transaction.dart';

part 'wallet_currency.freezed.dart';

// enum Recurrance {
//   unknown,
//   none,
//   daily,
//   weekly,
//   monthly,
//   quarterly,
//   halfYearly,
//   yearly,
// }

@freezed
class WalletCurrency with _$WalletCurrency {
  WalletCurrency._();

  @Entity(realClass: WalletCurrency)
  factory WalletCurrency({
    @Id(assignable: true) @Default(0) int? id,
    required String name,
    required String symbol,
  }) = _WalletCurrency;

  factory WalletCurrency.def({
    @Id(assignable: true) @Default(0) int? id,
    required String name,
    required String symbol,
  }) {
    return WalletCurrency(
      id: id,
      name: name,
      symbol: symbol,
    );
  }

  // Wallet? get wallet => walletRelation.target;
  // List<WalletTransaction>? get transactions => transactionsRelation.toList();

  // Recurrance? get reccurrance {
  //   _ensureStableEnumValues();
  //   return Recurrance.values[recurranceIndex ?? 0];
  // }

  // void _ensureStableEnumValues() {
  //   assert(Recurrance.unknown.index == 0);
  //   assert(Recurrance.none.index == 1);
  //   assert(Recurrance.daily.index == 2);
  //   assert(Recurrance.weekly.index == 3);
  //   assert(Recurrance.monthly.index == 4);
  //   assert(Recurrance.quarterly.index == 5);
  //   assert(Recurrance.halfYearly.index == 6);
  //   assert(Recurrance.yearly.index == 7);
  // }
}

enum DefaultCurrencies {
  usd(name: 'US Dollar', shortName: 'USD', symbol: '\$', flagEmoji: '🇺🇸'),
  eur(name: 'Euro', shortName: 'EUR', symbol: '€', flagEmoji: '🇪🇺'),
  jpy(name: 'Japanese Yen', shortName: 'JPY', symbol: '¥', flagEmoji: '🇯🇵'),
  gbp(name: 'Pound Sterling', shortName: 'GBP', symbol: '£', flagEmoji: '🇬🇧'),
  aud(name: 'Australian Dollar', shortName: 'AUD', symbol: 'A\$', flagEmoji: '🇦🇺'),
  cad(name: 'Canadian Dollar', shortName: 'CAD', symbol: 'C\$', flagEmoji: '🇨🇦'),
  chf(name: 'Swiss Franc', shortName: 'CHF', symbol: 'CHF', flagEmoji: '🇨🇭'),
  sek(name: 'Swedish Krona', shortName: 'SEK', symbol: 'SEK', flagEmoji: '🇸🇪'),
  cny(name: 'Chinese Yuan', shortName: 'CNY', symbol: '¥', flagEmoji: '🇨🇳'),
  hkd(name: 'Hong Kong Dollar', shortName: 'HKD', symbol: 'HK\$', flagEmoji: '🇭🇰'),
  sgd(name: 'Singapore Dollar', shortName: 'SGD', symbol: 'S\$', flagEmoji: '🇸🇬'),
  nzd(name: 'New Zealand Dollar', shortName: 'NZD', symbol: 'NZ\$', flagEmoji: '🇳🇿'),
  mxn(name: 'Mexican Peso', shortName: 'MXN', symbol: 'MX\$', flagEmoji: '🇲🇽'),
  inr(name: 'Indian Rupee', shortName: 'INR', symbol: '₹', flagEmoji: '🇮🇳'),
  brl(name: 'Brazilian Real', shortName: 'BRL', symbol: 'R\$', flagEmoji: '🇧🇷'),
  rub(name: 'Russian Ruble', shortName: 'RUB', symbol: '₽', flagEmoji: '🇷🇺'),
  krw(name: 'South Korean Won', shortName: 'KRW', symbol: '₩', flagEmoji: '🇰🇷'),
  tr(name: 'Turkish Lira', shortName: 'TRY', symbol: '₺', flagEmoji: '🇹🇷'),
  sar(name: 'Saudi Riyal', shortName: 'SAR', symbol: '﷼', flagEmoji: '🇸🇦'),
  pln(name: 'Polish Złoty', shortName: 'PLN', symbol: 'zł', flagEmoji: '🇵🇱'),
  czk(name: 'Czech Koruna', shortName: 'CZK', symbol: 'Kč', flagEmoji: '🇨🇿'),
  huf(name: 'Hungarian Forint', shortName: 'HUF', symbol: 'Ft', flagEmoji: '🇭🇺'),
  dkk(name: 'Danish Krone', shortName: 'DKK', symbol: 'kr', flagEmoji: '🇩🇰'),
  nok(name: 'Norwegian Krone', shortName: 'NOK', symbol: 'kr', flagEmoji: '🇳🇴'),
  twd(name: 'New Taiwan Dollar', shortName: 'TWD', symbol: 'NT\$', flagEmoji: '🇹🇼'),
  uah(name: 'Ukrainian Hryvnia', shortName: 'UAH', symbol: '₴', flagEmoji: '🇺🇦');

  const DefaultCurrencies({
    required this.name,
    required this.shortName,
    required this.symbol,
    this.flagEmoji,
  });

  final String name;
  final String shortName;
  final String symbol;
  final String? flagEmoji;
}
