import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

import 'package:project_n2/models/widgets/app_widget.dart';
import 'package:project_n2/tools/enums/widget_types.dart';

part 'wallet_widget.freezed.dart';
part 'wallet_widget.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class WalletWidget with _$WalletWidget {
  WalletWidget._();
  factory WalletWidget({
    @ignore @Default(Isar.autoIncrement) Id id,
    required int walletId,
    @enumerated required WalletWidgetType widgetType,
  }) = _WalletWidget;

  @override
  // ignore: recursive_getters
  Id get id => id;

  @Backlink(to: "walletWidgetLink")
  final appWidget = IsarLink<AppWidget>();

  // @ignore
  // String? get parentId => appWidget.value?.parentId;
  // @ignore
  // int? get parentIndex => appWidget.value?.parentIndex;
  @ignore
  ContainedObjectType? get containedObjectType =>
      appWidget.value?.containedObjectType;
  // @ignore
  // Map<String, dynamic>? get widgetSettingsMap =>
  //     appWidget.value?.widgetSettingsMap;
}

// @collection
// class WalletWidget extends AppWidget {
//   int walletId;
//   @enumerated
//   WalletWidgetType widgetType;

//   WalletWidget({
//     String? parentId,
//     int? parentIndex,
//     required this.walletId,
//     this.widgetType = WalletWidgetType.total,
//   }) : super(
//           parentId: parentId,
//           parentIndex: parentIndex,
//           containedObjectType: ContainedObjectType.wallet,
//         );

//   factory WalletWidget.fromMap(Map<String, dynamic> data) {
//     return WalletWidget(
//       parentId: data['parentId'],
//       parentIndex: data['parentIndex'],
//       walletId: data['containedObjectId'],
//       widgetType: WalletWidgetType.values[data['widgetType']],
//     );
//   }

//   @override
//   Map<String, dynamic> toMap() {
//     return {
//       ...super.toMap(), // inherit properties from the parent class
//       'containedObjectId': walletId,
//       'widgetType': widgetType.index,
//     };
//   }
// }
