import 'package:isar/isar.dart';

part 'shared_prefs.g.dart';

@Collection()
class SharedPrefs {
  Id id = Isar.autoIncrement;

  late String key;
  String? value;
}
