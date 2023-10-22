import 'package:isar/isar.dart';
import 'package:project_n2/models/app_widget.dart';
import 'package:project_n2/tools/enums/widget_types.dart';

part 'wallet_widget.g.dart';

@collection
class WalletWidget extends AppWidget {
  int walletId;
  @enumerated
  WalletWidgetType widgetType;

  WalletWidget({
    String? parentId,
    int? parentIndex,
    required this.walletId,
    this.widgetType = WalletWidgetType.total,
  }) : super(
          parentId: parentId,
          parentIndex: parentIndex,
          containedObjectType: ContainedObjectType.wallet,
        );

  factory WalletWidget.fromMap(Map<String, dynamic> data) {
    return WalletWidget(
      parentId: data['parentId'],
      parentIndex: data['parentIndex'],
      walletId: data['containedObjectId'],
      widgetType: WalletWidgetType.values[data['widgetType']],
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      ...super.toMap(), // inherit properties from the parent class
      'containedObjectId': walletId,
      'widgetType': widgetType.index,
    };
  }
}
