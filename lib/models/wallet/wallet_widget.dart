// import 'dart:convert';

import '../app_widget.dart';

// import 'package:project_n2/models/wallet/wallet.dart';
import 'package:project_n2/tools/enums/widget_types.dart';

class WalletWidget extends AppWidget {
  String walletId;
  WalletWidgetType widgetType;

  WalletWidget({
    required super.id,
    super.containedObjectType = ContainedObjectType.wallet,
    super.parentId,
    super.parentIndex,
    required this.walletId,
    this.widgetType = WalletWidgetType.total,
  });

  factory WalletWidget.fromMap(
    Map<String, dynamic> data,
  ) {
    return WalletWidget(
      id: data['id'],
      parentId: data['parentId'],
      parentIndex: data['parentIndex'],
      walletId: data['containedObjectId'],
      widgetType: WalletWidgetType.values[data['widgetType']],
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'parentId': parentId,
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
