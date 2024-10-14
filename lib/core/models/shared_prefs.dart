import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:objectbox/objectbox.dart';
import 'package:project_n2/objectbox.g.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:project_n2/core/models/objectbox.dart';

part 'shared_prefs.freezed.dart';
part 'shared_prefs.g.dart';

@freezed
class SharedPref with _$SharedPref {
  @Entity(realClass: SharedPref)
  factory SharedPref({
    @Id(assignable: true) int? id,
    required String key,
    String? value,
  }) = _SharedPref;
}

@Riverpod(keepAlive: true)
class SharedPrefs extends _$SharedPrefs {
  @override
  List<SharedPref> build() {
    return getSharedPrefs();
  }

  List<SharedPref> getSharedPrefs() {
    debugPrint('Getting Shared Prefs');
    return db.box<SharedPref>().getAll();
  }

  void updateSharedPrefs() {
    state = getSharedPrefs();
  }

  String? getString(String key) {
    return state
        .singleWhereOrNull((sharedPref) => sharedPref.key == key)
        ?.value;
    // return await ref.read(sharedPrefsProvider.future).then((value) =>
    //     value.singleWhereOrNull((sharedPref) => sharedPref.key == key)?.value);
  }

  void setString(String key, String newValue) {
    final sharedPrefs = db.box<SharedPref>();
    SharedPref? existingSharedPref =
        sharedPrefs.query(SharedPref_.key.equals(key)).build().findFirst();

    // SharedPref? existingSharedPref =
    //     await isar.sharedPrefs.where().filter().keyEqualTo(key).findFirst();
    if (existingSharedPref != null) {
      // Modify the existing object's value
      debugPrint('Modifying existing object');
      existingSharedPref = existingSharedPref.copyWith(value: newValue);
      sharedPrefs.put(existingSharedPref);
    } else {
      int? id = existingSharedPref?.id;
      if (id == null || id == 0) {
        id = (sharedPrefs
                    .query()
                    .order(SharedPref_.id, flags: Order.descending)
                    .build()
                    .findFirst()
                    ?.id ??
                0) +
            1;
      }
      // Create a new object and save it
      debugPrint('Creating new object');
      final sharedPref = SharedPref(key: key, value: newValue);
      sharedPrefs.put(sharedPref.copyWith(id: id));
    }
    updateSharedPrefs();
  }

  bool? getBool(String key) {
    final stringValue = getString(key);
    if (stringValue == '1') {
      return true;
    } else if (stringValue == '0') {
      return false;
    }
    return null;
  }

  void setBool(String key, bool value) {
    setString(key, value ? '1' : '0');
  }

  double? getDouble(String key) {
    final stringValue = getString(key);
    if (stringValue == null) return null;
    return double.tryParse(stringValue);
  }

  void setDouble(String key, double value) {
    setString(key, value.toString());
  }

  int? getInt(String key) {
    final stringValue = getString(key);
    if (stringValue == null) return null;
    return int.tryParse(stringValue);
  }

  void setInt(String key, int value) {
    setString(key, value.toString());
  }

  List<String>? getStringList(String key) {
    final stringValue = getString(key);
    return stringValue?.split(','); // Assuming comma-separated values
  }

  void setStringList(String key, List<String> values) {
    final stringValue = values.join(',');
    setString(key, stringValue);
  }

  void remove(String key) {
    final sharedPrefs = db.box<SharedPref>();
    try {
      sharedPrefs.query(SharedPref_.key.equals(key)).build().remove();
    } on Exception catch (e) {
      debugPrint('Error in SharedPrefs remove: $e');
    }

    // ref.watch(databaseProvider).when(data: (isar) async {
    //   isar.sharedPrefs.where().filter().keyEqualTo(key).deleteFirst();
    //   await updateSharedPrefs();
    // }, error: (_, __) {
    //   // throw UnimplementedError();
    // }, loading: () {
    //   return const AsyncLoading();
    // });
  }
}
