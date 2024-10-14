// Static class model, db model, provider
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:objectbox/objectbox.dart';
import 'package:project_n2/objectbox.g.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
//
import 'package:project_n2/core/models/objectbox.dart';
//

import 'package:project_n2/features/wallet/models/wallet.dart';
import 'package:project_n2/features/wallet/models/wallet_transaction.dart';

part 'wallet_currency.freezed.dart';
part 'wallet_currency.g.dart';

@freezed
class WalletCurrency with _$WalletCurrency {
  WalletCurrency._();

  @Entity(realClass: WalletCurrency)
  factory WalletCurrency({
    @Id(assignable: true) @Default(0) int? id,
    String? emoji,
    required String code,
    required String name,
    required String symbol,
  }) = _WalletCurrency;

  factory WalletCurrency.def({
    @Id(assignable: true) @Default(0) int? id,
    String? emoji,
    required String code,
    required String name,
    required String symbol,
  }) {
    return WalletCurrency(
      id: id,
      emoji: emoji,
      code: code,
      name: name,
      symbol: symbol,
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

  void updateCurrencies() async {
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
    if (!silent) updateCurrencies();
  }

  void deleteCurrency(WalletCurrency currency) async {
    final currencies = db.box<WalletCurrency>();
    currencies.remove(currency.id!);
    updateCurrencies();
  }

  void reorder(int oldIndex, int newIndex) async {
    final currencies = db.box<WalletCurrency>();

    final List<WalletCurrency> workingList = List.from(state);
    // Perform the in-memory reorder
    final movedWidget = workingList.removeAt(oldIndex);
    workingList.insert(newIndex, movedWidget);

    // Determine the range of affected indices
    int start = (oldIndex < newIndex) ? oldIndex : newIndex;
    int end = (oldIndex > newIndex) ? oldIndex : newIndex;

    // Update local state only for affected indices
    for (int i = start; i <= end; i++) {
      int id = i + 1;
      workingList[i] = workingList[i].copyWith(id: id);
    }
    await currencies.putManyAsync(workingList);
    updateCurrencies();
    //
  }

  void spawnDefaultCurrencies() {
    for (final currency in DefaultCurrencies.values) {
      insertCurrency(
        WalletCurrency.def(
          emoji: currency.emoji,
          code: currency.code,
          name: currency.name,
          symbol: currency.symbol,
        ),
        silent: true,
      );
    }
    updateCurrencies();
  }
}

enum DefaultCurrencies {
  usd(emoji: '🇺🇸', code: 'USD', name: 'US Dollar', symbol: '\$'),
  eur(emoji: '🇪🇺', code: 'EUR', name: 'Euro', symbol: '€'),
  jpy(emoji: '🇯🇵', code: 'JPY', name: 'Japanese Yen', symbol: '¥'),
  gbp(emoji: '🇬🇧', code: 'GBP', name: 'Pound Sterling', symbol: '£'),
  aud(emoji: '🇦🇺', code: 'AUD', name: 'Australian Dollar', symbol: 'A\$'),
  cad(emoji: '🇨🇦', code: 'CAD', name: 'Canadian Dollar', symbol: 'C\$'),
  chf(emoji: '🇨🇭', code: 'CHF', name: 'Swiss Franc', symbol: 'CHF'),
  sek(emoji: '🇸🇪', code: 'SEK', name: 'Swedish Krona', symbol: 'SEK'),
  cny(emoji: '🇨🇳', code: 'CNY', name: 'Chinese Yuan', symbol: '¥'),
  hkd(emoji: '🇭🇰', code: 'HKD', name: 'Hong Kong Dollar', symbol: 'HK\$'),
  sgd(emoji: '🇸🇬', code: 'SGD', name: 'Singapore Dollar', symbol: 'S\$'),
  nzd(emoji: '🇳🇿', code: 'NZD', name: 'New Zealand Dollar', symbol: 'NZ\$'),
  mxn(emoji: '🇲🇽', code: 'MXN', name: 'Mexican Peso', symbol: 'MX\$'),
  inr(emoji: '🇮🇳', code: 'INR', name: 'Indian Rupee', symbol: '₹'),
  brl(emoji: '🇧🇷', code: 'BRL', name: 'Brazilian Real', symbol: 'R\$'),
  rub(emoji: '🇷🇺', code: 'RUB', name: 'Russian Ruble', symbol: '₽'),
  krw(emoji: '🇰🇷', code: 'KRW', name: 'South Korean Won', symbol: '₩'),
  try_(emoji: '🇹🇷', code: 'TRY', name: 'Turkish Lira', symbol: '₺'),
  sar(emoji: '🇸🇦', code: 'SAR', name: 'Saudi Riyal', symbol: '﷼'),
  pln(emoji: '🇵🇱', code: 'PLN', name: 'Polish Złoty', symbol: 'zł'),
  czk(emoji: '🇨🇿', code: 'CZK', name: 'Czech Koruna', symbol: 'Kč'),
  huf(emoji: '🇭🇺', code: 'HUF', name: 'Hungarian Forint', symbol: 'Ft'),
  dkk(emoji: '🇩🇰', code: 'DKK', name: 'Danish Krone', symbol: 'kr'),
  nok(emoji: '🇳🇴', code: 'NOK', name: 'Norwegian Krone', symbol: 'kr'),
  twd(emoji: '🇹🇼', code: 'TWD', name: 'New Taiwan Dollar', symbol: 'NT\$'),
  uah(emoji: '🇺🇦', code: 'UAH', name: 'Ukrainian Hryvnia', symbol: '₴'),
  ils(emoji: '🇮🇱', code: 'NIS', name: 'Israeli New Shekel', symbol: '₪'),
  ;

  const DefaultCurrencies(
      {this.emoji, required this.code, required this.name, required this.symbol});

  final String? emoji;
  final String code;
  final String name;
  final String symbol;
}
