// Static class model, db model, provider
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:objectbox/objectbox.dart';
import 'package:project_n2/objectbox.g.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
//
import 'package:project_n2/models/objectbox.dart';
//

import 'package:project_n2/models/wallet/wallet.dart';
import 'package:project_n2/models/wallet/wallet_transaction.dart';

part 'wallet_currency.freezed.dart';
part 'wallet_currency.g.dart';

@freezed
class WalletCurrency with _$WalletCurrency {
  WalletCurrency._();

  @Entity(realClass: WalletCurrency)
  factory WalletCurrency({
    @Id(assignable: true) @Default(0) int? id,
    required String name,
    required String shortName,
    required String symbol,
    String? flagEmoji,
  }) = _WalletCurrency;

  factory WalletCurrency.def({
    @Id(assignable: true) @Default(0) int? id,
    required String name,
    required String shortName,
    required String symbol,
    String? flagEmoji,
  }) {
    return WalletCurrency(
      id: id,
      name: name,
      shortName: shortName,
      symbol: symbol,
      flagEmoji: flagEmoji,
    );
  }
}

@riverpod
class Currencies extends _$Currencies {
  @override
  List<WalletCurrency> build() {
    return getCurrencies();
  }

  // A method that retrieves all the wallets from Isar.
  List<WalletCurrency> getCurrencies() {
    // _ensureStableEnumValues();
    final wallets = db.box<WalletCurrency>();
    return wallets.getAll();
  }

  void updateWallets() async {
    state = getCurrencies();
  }

  void insertCurrency(WalletCurrency currency, {bool silent = false}) async {
    final currencies = db.box<WalletCurrency>();
    // TODO Add cached id for improving speed and performance
    int? id = currency.id;
    if (id == null || id == 0) {
      id = (currencies
                  .query()
                  .order(WalletCurrency_.id, flags: Order.descending)
                  .build()
                  .findFirst()
                  ?.id ??
              0) +
          1;
    }
    currencies.put(currency.copyWith(id: id));
    if (!silent) updateWallets();
  }

  void deleteCurrency(WalletCurrency currency) async {
    final currencies = db.box<WalletCurrency>();
    currencies.remove(currency.id!);
    updateWallets();
  }

  void spawnDefaultCurrencies() {
    for (final currency in DefaultCurrencies.values) {
      insertCurrency(
        WalletCurrency.def(
          name: currency.name,
          shortName: currency.shortName,
          symbol: currency.symbol,
          flagEmoji: currency.flagEmoji,
        ),
        silent: true,
      );
    }
    updateWallets();
  }
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
  try_(name: 'Turkish Lira', shortName: 'TRY', symbol: '₺', flagEmoji: '🇹🇷'),
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
