// import 'dart:convert';

import '../app_widget.dart';

// import 'package:project_n2/models/wallet/wallet.dart';
import 'package:project_n2/tools/enums/widget_types.dart';

class WalletWidget extends AppWidget {
  String walletId;
  WalletWidgetType widgetType;

  WalletWidget({
    required super.id,
    super.containedObjectType = 'wallet',
    super.childOfId,
    super.parentIndex,
    required this.walletId,
    this.widgetType = WalletWidgetType.total,
  });

  factory WalletWidget.fromMap(
    Map<String, dynamic> data,
  ) {
    return WalletWidget(
      id: data['id'],
      childOfId: data['childOfId'],
      parentIndex: data['parentIndex'],
      walletId: data['containedObjectId'],
      widgetType: WalletWidgetType.values[data['widgetType']],
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'childOfId': childOfId,
      'parentIndex': parentIndex,
      'containedObjectId': walletId,
      'widgetType': widgetType.index,
    };
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

  // String toText() {
  //   final valueMap = {
  //     'id': id,
  //     'wallet': wallet.toMap(),
  //     'widgetType': widgetType.index,
  //   };
  //   return jsonEncode(valueMap);
  // }
}
