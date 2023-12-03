import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:project_n2/models/widgets/todo_widget.dart';
import 'package:project_n2/models/widgets/wallet_widget.dart';

part 'widget_union.freezed.dart';

@freezed
class WidgetUnion with _$WidgetUnion {
  const factory WidgetUnion.toDo(ToDoWidget toDoWidget) = UnionToDo;
  const factory WidgetUnion.wallet(WalletWidget walletWidget) = UnionWallet;
}
