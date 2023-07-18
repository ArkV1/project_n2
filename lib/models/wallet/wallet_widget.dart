// import 'dart:convert';

import '../app_widget.dart';

// import 'package:project_n2/models/wallet/wallet.dart';
import 'package:project_n2/tools/enums/widget_types.dart';

class WalletWidget extends AppWidget {
  String walletId;
  WalletWidgetType widgetType;

  WalletWidget({
    required super.id,
    required this.walletId,
    this.widgetType = WalletWidgetType.total,
  });

  factory WalletWidget.fromMap(
    Map<String, dynamic> data,
  ) {
    return WalletWidget(
      id: data['id'],
      walletId: data['objectId'],
      widgetType: WalletWidgetType.values[data['widgetType']],
    );
  }

  // factory WalletWidget.fromText(
  //   String encodedString,
  // ) {
  //   final valueMap = json.decode(encodedString);
  //   return WalletWidget(
  //     id: valueMap['id'],
  //     wallet: Wallet.fromMap(valueMap['wallet']),
  //     widgetType: WalletWidgetType.values[valueMap['widgetType']],
  //   );
  // }

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'objectId': walletId,
      'widgetType': widgetType.index,
    };
  }

  // String toText() {
  //   final valueMap = {
  //     'id': id,
  //     'wallet': wallet.toMap(),
  //     'widgetType': widgetType.index,
  //   };
  //   return jsonEncode(valueMap);
  // }
}
