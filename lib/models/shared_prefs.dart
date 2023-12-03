import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:project_n2/models/data_manager.dart';

part 'shared_prefs.freezed.dart';
part 'shared_prefs.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class SharedPref with _$SharedPref {
  SharedPref._();
  factory SharedPref({
    @ignore @Default(Isar.autoIncrement) Id id,
    required String key,
    String? value,
  }) = _SharedPref;

  @override
  // ignore: recursive_getters
  Id get id => id;

  // set id(Id id) => id = id;

  // factory Wallet.fromJson(Map<String, dynamic> json) => _$WalletFromJson(json);
}

@Riverpod(keepAlive: true)
class SharedPrefs extends _$SharedPrefs {
  @override
  FutureOr<List<SharedPref>> build() {
    return getSharedPrefs();
  }

  Future<List<SharedPref>> getSharedPrefs() async {
    debugPrint('Getting Shared Prefs');
    return await ref
        .read(databaseProvider.future)
        .then((isar) => isar.sharedPrefs.where().findAll());
  }

  Future<void> updateSharedPrefs() async {
    await ref.read(databaseProvider.future).then((isar) async {
      final sharedPrefs = await isar.sharedPrefs.where().findAll();
      state = AsyncData(sharedPrefs);
    });
  }

  Future<String?> getString(String key) async {
    return await ref.read(sharedPrefsProvider.future).then((value) =>
        value.singleWhereOrNull((sharedPref) => sharedPref.key == key)?.value);
  }

  Future<void> setString(String key, String newValue) async {
    ref.read(databaseProvider).when(data: (isar) async {
      SharedPref? existingSharedPref =
          await isar.sharedPrefs.where().filter().keyEqualTo(key).findFirst();
      if (existingSharedPref != null) {
        // Modify the existing object's value
        debugPrint('Modifying existing object');
        existingSharedPref = existingSharedPref.copyWith(value: newValue);
        await isar.writeTxn(() => isar.sharedPrefs.put(existingSharedPref!));
      } else {
        // Create a new object and save it
        debugPrint('Creating new object');
        final sharedPref = SharedPref(key: key, value: newValue);
        await isar.writeTxn(() => isar.sharedPrefs.put(sharedPref));
      }
      await updateSharedPrefs();
    }, error: (_, __) {
      // throw UnimplementedError();
    }, loading: () {
      return const AsyncLoading();
    });
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

  Future<void> setBool(String key, bool value) async {
    setString(key, value ? '1' : '0');
  }

  Future<double?> getDouble(String key) async {
    final stringValue = await getString(key);
    return double.parse(stringValue!);
  }

  Future<void> setDouble(String key, double value) async {
    setString(key, value.toString());
  }

  Future<List<String>?> getStringList(String key) async {
    final stringValue = await getString(key);
    return stringValue?.split(','); // Assuming comma-separated values
  }

  Future<void> setStringList(String key, List<String> values) async {
    final stringValue = values.join(',');
    await setString(key, stringValue);
  }

  Future<void> remove(String key) async {
    ref.watch(databaseProvider).when(data: (isar) async {
      isar.sharedPrefs.where().filter().keyEqualTo(key).deleteFirst();
      await updateSharedPrefs();
    }, error: (_, __) {
      // throw UnimplementedError();
    }, loading: () {
      return const AsyncLoading();
    });
  }
}
