import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:project_n2/objectbox.g.dart';

late final Admin _admin;

Store get db => ObjectBox().store;

class ObjectBox {
  late Store store;
  static final ObjectBox _instance = ObjectBox._internal();

  ObjectBox._internal();

  factory ObjectBox() => _instance;

  static Future<void> init() async {
    final docsDir = await getApplicationDocumentsDirectory();
    final defaultPath = path.join(docsDir.path, "objectbox");
    final defaultDatabasePath = path.join(defaultPath, "data.mdb");

    if (!File(defaultDatabasePath).existsSync()) {
      ByteData? initialData;
      try {
        initialData = await rootBundle.load("assets/objectbox/data.mdb");
        await Directory(defaultPath).create(recursive: true);
        await File(defaultDatabasePath).writeAsBytes(initialData.buffer.asUint8List());
      } catch (_) {
        debugPrint("Error loading data.mdb from assets");
      }
    }
    _instance.store = await openStore(directory: defaultPath);
    // https://docs.objectbox.io/data-browser
    // $ adb forward tcp:8090 tcp:8090
    // if (Admin.isAvailable()) {
    //   _admin = Admin(_instance.store);
    // }
  }

  Future<void> databaseOverwrite(Uint8List databaseBackupAsBytes) async {
    store.close();
    final docsDir = await getApplicationDocumentsDirectory();
    String filePath = path.join(docsDir.path, "objectbox", "data.mdb");
    await File(filePath).writeAsBytes(databaseBackupAsBytes);
    store = await openStore(directory: path.join(docsDir.path, "objectbox"));
  }
}
