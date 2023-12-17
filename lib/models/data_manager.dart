import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:project_n2/objectbox.g.dart';

part 'data_manager.g.dart';

final db = ObjectBox().store;

class ObjectBox {
  late final Store store;
  static final ObjectBox _instance = ObjectBox._internal();

  ObjectBox._internal();

  factory ObjectBox() {
    return _instance;
  }

  static void init(Store store) {
    _instance.store = store;
  }
}

@riverpod
class DataManager extends _$DataManager {
  @override
  Store build() {
    return db;
  }

  // Add methods to mutate the state
}
