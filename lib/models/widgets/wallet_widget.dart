import 'dart:math';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:objectbox/objectbox.dart';

import 'package:project_n2/models/widgets/app_widget.dart';
import 'package:project_n2/tools/enums/widget_types.dart';

part 'wallet_widget.freezed.dart';
// part 'wallet_widget.g.dart';

@Freezed()
class WalletWidget with _$WalletWidget {
  WalletWidget._();

  @Entity(realClass: WalletWidget)
  factory WalletWidget({
    @Id(assignable: true) @Default(0) int? id,
    required int walletId,
    required int widgetTypeIndex,
  }) = _WalletWidget;

  final appWidget = ToOne<AppWidget>();

  WalletWidgetType? get widgetType {
    _ensureStableEnumValues();
    return WalletWidgetType.values[widgetTypeIndex];
  }

  void _ensureStableEnumValues() {
    assert(WalletWidgetType.unknown.index == 0);
    assert(WalletWidgetType.dailySpendings.index == 1);
    assert(WalletWidgetType.lastTransaction.index == 2);
    assert(WalletWidgetType.total.index == 3);
  }
}
