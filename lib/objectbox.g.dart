// GENERATED CODE - DO NOT MODIFY BY HAND
// This code was generated by ObjectBox. To update it run the generator again:
// With a Flutter package, run `flutter pub run build_runner build`.
// With a Dart package, run `dart run build_runner build`.
// See also https://docs.objectbox.io/getting-started#generate-objectbox-code

// ignore_for_file: camel_case_types, depend_on_referenced_packages
// coverage:ignore-file

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart';
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'models/shared_prefs.dart';
import 'models/todo/todo_list.dart';
import 'models/todo/todo_task.dart';
import 'models/wallet/wallet.dart';
import 'models/wallet/wallet_transaction.dart';
import 'models/widgets/app_widget.dart';
import 'models/widgets/todo_widget.dart';
import 'models/widgets/wallet_widget.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <ModelEntity>[
  ModelEntity(
      id: const IdUid(1, 3851076263104269136),
      name: 'AppWidget',
      lastPropertyId: const IdUid(4, 1328863912090996765),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 6641746290999624105),
            name: 'id',
            type: 6,
            flags: 129),
        ModelProperty(
            id: const IdUid(2, 4146134339931586936),
            name: 'parentId',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 8464332775074593007),
            name: 'parentIndex',
            type: 6,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 1328863912090996765),
            name: 'containedObjectTypeIndex',
            type: 6,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(2, 7717099991104603167),
      name: 'SharedPref',
      lastPropertyId: const IdUid(3, 435670815388084771),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 8630801586906988374),
            name: 'id',
            type: 6,
            flags: 129),
        ModelProperty(
            id: const IdUid(2, 4178075808928530065),
            name: 'key',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 435670815388084771),
            name: 'value',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(3, 602103247360980798),
      name: 'ToDoList',
      lastPropertyId: const IdUid(2, 1036191715067432841),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 6566740145815087865),
            name: 'id',
            type: 6,
            flags: 129),
        ModelProperty(
            id: const IdUid(2, 1036191715067432841),
            name: 'name',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[
        ModelRelation(
            id: const IdUid(1, 9184665439642877980),
            name: 'tasksRelation',
            targetId: const IdUid(4, 7292982484387514466))
      ],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(4, 7292982484387514466),
      name: 'ToDoTask',
      lastPropertyId: const IdUid(10, 7767667358077577185),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 7349673836728525657),
            name: 'id',
            type: 6,
            flags: 129),
        ModelProperty(
            id: const IdUid(2, 3264043252034502658),
            name: 'toDoListId',
            type: 6,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 5410470588904130773),
            name: 'parentIndex',
            type: 6,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 3356460954018133276),
            name: 'task',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 191269183120495443),
            name: 'description',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(6, 8647187365294728853),
            name: 'isDaily',
            type: 1,
            flags: 0),
        ModelProperty(
            id: const IdUid(7, 7173124710468231132),
            name: 'complete',
            type: 1,
            flags: 0),
        ModelProperty(
            id: const IdUid(8, 6036152782262399773),
            name: 'creationDate',
            type: 10,
            flags: 0),
        ModelProperty(
            id: const IdUid(9, 4654333341229623542),
            name: 'completionDate',
            type: 10,
            flags: 0),
        ModelProperty(
            id: const IdUid(10, 7767667358077577185),
            name: 'toDoListRelationId',
            type: 11,
            flags: 520,
            indexId: const IdUid(1, 6965049102133444953),
            relationTarget: 'ToDoList')
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(5, 4958708599283922976),
      name: 'ToDoWidget',
      lastPropertyId: const IdUid(3, 702883504199695479),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 3279771052775876942),
            name: 'id',
            type: 6,
            flags: 129),
        ModelProperty(
            id: const IdUid(2, 2725996854193858177),
            name: 'toDoListId',
            type: 6,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 702883504199695479),
            name: 'widgetTypeIndex',
            type: 6,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(6, 1468525835500275328),
      name: 'Wallet',
      lastPropertyId: const IdUid(5, 1772558234851034474),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 6438608160768011458),
            name: 'id',
            type: 6,
            flags: 129),
        ModelProperty(
            id: const IdUid(2, 4490577410416462100),
            name: 'name',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 1772558234851034474),
            name: 'categories',
            type: 30,
            flags: 0)
      ],
      relations: <ModelRelation>[
        ModelRelation(
            id: const IdUid(2, 2438830796802246892),
            name: 'transactionsRelation',
            targetId: const IdUid(7, 407272998144506317))
      ],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(7, 407272998144506317),
      name: 'WalletTransaction',
      lastPropertyId: const IdUid(10, 6526198425793305633),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 3187325690585529173),
            name: 'id',
            type: 6,
            flags: 129),
        ModelProperty(
            id: const IdUid(2, 2283929815430606379),
            name: 'walletId',
            type: 6,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 423468199066161408),
            name: 'name',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 3127256611937120935),
            name: 'description',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(6, 954024822420747720),
            name: 'amount',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(7, 3011724886258069778),
            name: 'transactionDate',
            type: 10,
            flags: 0),
        ModelProperty(
            id: const IdUid(8, 6293933183743922526),
            name: 'walletRelationId',
            type: 11,
            flags: 520,
            indexId: const IdUid(2, 3096948282161509920),
            relationTarget: 'Wallet'),
        ModelProperty(
            id: const IdUid(9, 2946374135556934787),
            name: 'category',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(10, 6526198425793305633),
            name: 'optionalCurrency',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(8, 4855742581566610461),
      name: 'WalletWidget',
      lastPropertyId: const IdUid(3, 2606608628582629878),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 7517955221512361937),
            name: 'id',
            type: 6,
            flags: 129),
        ModelProperty(
            id: const IdUid(2, 7943705639151986210),
            name: 'walletId',
            type: 6,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 2606608628582629878),
            name: 'widgetTypeIndex',
            type: 6,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[])
];

/// Shortcut for [Store.new] that passes [getObjectBoxModel] and for Flutter
/// apps by default a [directory] using `defaultStoreDirectory()` from the
/// ObjectBox Flutter library.
///
/// Note: for desktop apps it is recommended to specify a unique [directory].
///
/// See [Store.new] for an explanation of all parameters.
Future<Store> openStore(
        {String? directory,
        int? maxDBSizeInKB,
        int? fileMode,
        int? maxReaders,
        bool queriesCaseSensitiveDefault = true,
        String? macosApplicationGroup}) async =>
    Store(getObjectBoxModel(),
        directory: directory ?? (await defaultStoreDirectory()).path,
        maxDBSizeInKB: maxDBSizeInKB,
        fileMode: fileMode,
        maxReaders: maxReaders,
        queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
        macosApplicationGroup: macosApplicationGroup);

/// Returns the ObjectBox model definition for this project for use with
/// [Store.new].
ModelDefinition getObjectBoxModel() {
  final model = ModelInfo(
      entities: _entities,
      lastEntityId: const IdUid(8, 4855742581566610461),
      lastIndexId: const IdUid(2, 3096948282161509920),
      lastRelationId: const IdUid(2, 2438830796802246892),
      lastSequenceId: const IdUid(0, 0),
      retiredEntityUids: const [],
      retiredIndexUids: const [],
      retiredPropertyUids: const [
        5854194935803310609,
        5156563089492136943,
        5518138728636585735
      ],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, EntityDefinition>{
    AppWidget: EntityDefinition<AppWidget>(
        model: _entities[0],
        toOneRelations: (AppWidget object) => [],
        toManyRelations: (AppWidget object) => {},
        getId: (AppWidget object) => object.id,
        setId: (AppWidget object, int id) {
          if (object.id != id) {
            throw ArgumentError('Field AppWidget.id is read-only '
                '(final or getter-only) and it was declared to be self-assigned. '
                'However, the currently inserted object (.id=${object.id}) '
                "doesn't match the inserted ID (ID $id). "
                'You must assign an ID before calling [box.put()].');
          }
        },
        objectToFB: (AppWidget object, fb.Builder fbb) {
          final parentIdOffset = fbb.writeString(object.parentId);
          fbb.startTable(5);
          fbb.addInt64(0, object.id ?? 0);
          fbb.addOffset(1, parentIdOffset);
          fbb.addInt64(2, object.parentIndex);
          fbb.addInt64(3, object.containedObjectTypeIndex);
          fbb.finish(fbb.endTable());
          return object.id ?? 0;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final idParam =
              const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 4);
          final parentIdParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 6, '');
          final parentIndexParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 8, 0);
          final containedObjectTypeIndexParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 10, 0);
          final object = AppWidget(
              id: idParam,
              parentId: parentIdParam,
              parentIndex: parentIndexParam,
              containedObjectTypeIndex: containedObjectTypeIndexParam);

          return object;
        }),
    SharedPref: EntityDefinition<SharedPref>(
        model: _entities[1],
        toOneRelations: (SharedPref object) => [],
        toManyRelations: (SharedPref object) => {},
        getId: (SharedPref object) => object.id,
        setId: (SharedPref object, int id) {
          if (object.id != id) {
            throw ArgumentError('Field SharedPref.id is read-only '
                '(final or getter-only) and it was declared to be self-assigned. '
                'However, the currently inserted object (.id=${object.id}) '
                "doesn't match the inserted ID (ID $id). "
                'You must assign an ID before calling [box.put()].');
          }
        },
        objectToFB: (SharedPref object, fb.Builder fbb) {
          final keyOffset = fbb.writeString(object.key);
          final valueOffset =
              object.value == null ? null : fbb.writeString(object.value!);
          fbb.startTable(4);
          fbb.addInt64(0, object.id ?? 0);
          fbb.addOffset(1, keyOffset);
          fbb.addOffset(2, valueOffset);
          fbb.finish(fbb.endTable());
          return object.id ?? 0;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final idParam =
              const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 4);
          final keyParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 6, '');
          final valueParam = const fb.StringReader(asciiOptimization: true)
              .vTableGetNullable(buffer, rootOffset, 8);
          final object =
              SharedPref(id: idParam, key: keyParam, value: valueParam);

          return object;
        }),
    ToDoList: EntityDefinition<ToDoList>(
        model: _entities[2],
        toOneRelations: (ToDoList object) => [],
        toManyRelations: (ToDoList object) =>
            {RelInfo<ToDoList>.toMany(1, object.id!): object.tasksRelation},
        getId: (ToDoList object) => object.id,
        setId: (ToDoList object, int id) {
          if (object.id != id) {
            throw ArgumentError('Field ToDoList.id is read-only '
                '(final or getter-only) and it was declared to be self-assigned. '
                'However, the currently inserted object (.id=${object.id}) '
                "doesn't match the inserted ID (ID $id). "
                'You must assign an ID before calling [box.put()].');
          }
        },
        objectToFB: (ToDoList object, fb.Builder fbb) {
          final nameOffset = fbb.writeString(object.name);
          fbb.startTable(3);
          fbb.addInt64(0, object.id ?? 0);
          fbb.addOffset(1, nameOffset);
          fbb.finish(fbb.endTable());
          return object.id ?? 0;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final idParam =
              const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 4);
          final nameParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 6, '');
          final tasksRelationParam = ToMany<ToDoTask>();
          final object = ToDoList(
              id: idParam, name: nameParam, tasksRelation: tasksRelationParam);
          InternalToManyAccess.setRelInfo<ToDoList>(object.tasksRelation, store,
              RelInfo<ToDoList>.toMany(1, object.id!));
          return object;
        }),
    ToDoTask: EntityDefinition<ToDoTask>(
        model: _entities[3],
        toOneRelations: (ToDoTask object) => [object.toDoListRelation],
        toManyRelations: (ToDoTask object) => {},
        getId: (ToDoTask object) => object.id,
        setId: (ToDoTask object, int id) {
          if (object.id != id) {
            throw ArgumentError('Field ToDoTask.id is read-only '
                '(final or getter-only) and it was declared to be self-assigned. '
                'However, the currently inserted object (.id=${object.id}) '
                "doesn't match the inserted ID (ID $id). "
                'You must assign an ID before calling [box.put()].');
          }
        },
        objectToFB: (ToDoTask object, fb.Builder fbb) {
          final taskOffset =
              object.task == null ? null : fbb.writeString(object.task!);
          final descriptionOffset = object.description == null
              ? null
              : fbb.writeString(object.description!);
          fbb.startTable(11);
          fbb.addInt64(0, object.id ?? 0);
          fbb.addInt64(1, object.toDoListId);
          fbb.addInt64(2, object.parentIndex);
          fbb.addOffset(3, taskOffset);
          fbb.addOffset(4, descriptionOffset);
          fbb.addBool(5, object.isDaily);
          fbb.addBool(6, object.complete);
          fbb.addInt64(7, object.creationDate?.millisecondsSinceEpoch);
          fbb.addInt64(8, object.completionDate?.millisecondsSinceEpoch);
          fbb.addInt64(9, object.toDoListRelation.targetId);
          fbb.finish(fbb.endTable());
          return object.id ?? 0;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final creationDateValue =
              const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 18);
          final completionDateValue =
              const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 20);
          final idParam =
              const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 4);
          final toDoListIdParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 6, 0);
          final parentIndexParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 8, 0);
          final taskParam = const fb.StringReader(asciiOptimization: true)
              .vTableGetNullable(buffer, rootOffset, 10);
          final descriptionParam =
              const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 12);
          final isDailyParam =
              const fb.BoolReader().vTableGet(buffer, rootOffset, 14, false);
          final completeParam =
              const fb.BoolReader().vTableGet(buffer, rootOffset, 16, false);
          final creationDateParam = creationDateValue == null
              ? null
              : DateTime.fromMillisecondsSinceEpoch(creationDateValue);
          final completionDateParam = completionDateValue == null
              ? null
              : DateTime.fromMillisecondsSinceEpoch(completionDateValue);
          final toDoListRelationParam = ToOne<ToDoList>(
              targetId:
                  const fb.Int64Reader().vTableGet(buffer, rootOffset, 22, 0));
          final object = ToDoTask(
              id: idParam,
              toDoListId: toDoListIdParam,
              parentIndex: parentIndexParam,
              task: taskParam,
              description: descriptionParam,
              isDaily: isDailyParam,
              complete: completeParam,
              creationDate: creationDateParam,
              completionDate: completionDateParam,
              toDoListRelation: toDoListRelationParam);
          object.toDoListRelation.attach(store);
          return object;
        }),
    ToDoWidget: EntityDefinition<ToDoWidget>(
        model: _entities[4],
        toOneRelations: (ToDoWidget object) => [],
        toManyRelations: (ToDoWidget object) => {},
        getId: (ToDoWidget object) => object.id,
        setId: (ToDoWidget object, int id) {
          if (object.id != id) {
            throw ArgumentError('Field ToDoWidget.id is read-only '
                '(final or getter-only) and it was declared to be self-assigned. '
                'However, the currently inserted object (.id=${object.id}) '
                "doesn't match the inserted ID (ID $id). "
                'You must assign an ID before calling [box.put()].');
          }
        },
        objectToFB: (ToDoWidget object, fb.Builder fbb) {
          fbb.startTable(4);
          fbb.addInt64(0, object.id ?? 0);
          fbb.addInt64(1, object.toDoListId);
          fbb.addInt64(2, object.widgetTypeIndex);
          fbb.finish(fbb.endTable());
          return object.id ?? 0;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final idParam =
              const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 4);
          final toDoListIdParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 6, 0);
          final widgetTypeIndexParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 8, 0);
          final object = ToDoWidget(
              id: idParam,
              toDoListId: toDoListIdParam,
              widgetTypeIndex: widgetTypeIndexParam);

          return object;
        }),
    Wallet: EntityDefinition<Wallet>(
        model: _entities[5],
        toOneRelations: (Wallet object) => [],
        toManyRelations: (Wallet object) => {
              RelInfo<Wallet>.toMany(2, object.id!): object.transactionsRelation
            },
        getId: (Wallet object) => object.id,
        setId: (Wallet object, int id) {
          if (object.id != id) {
            throw ArgumentError('Field Wallet.id is read-only '
                '(final or getter-only) and it was declared to be self-assigned. '
                'However, the currently inserted object (.id=${object.id}) '
                "doesn't match the inserted ID (ID $id). "
                'You must assign an ID before calling [box.put()].');
          }
        },
        objectToFB: (Wallet object, fb.Builder fbb) {
          final nameOffset = fbb.writeString(object.name);
          final categoriesOffset = fbb.writeList(
              object.categories.map(fbb.writeString).toList(growable: false));
          fbb.startTable(6);
          fbb.addInt64(0, object.id ?? 0);
          fbb.addOffset(1, nameOffset);
          fbb.addOffset(4, categoriesOffset);
          fbb.finish(fbb.endTable());
          return object.id ?? 0;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final idParam =
              const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 4);
          final nameParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 6, '');
          final categoriesParam = const fb.ListReader<String>(
                  fb.StringReader(asciiOptimization: true),
                  lazy: false)
              .vTableGet(buffer, rootOffset, 12, []);
          final transactionsRelationParam = ToMany<WalletTransaction>();
          final object = Wallet(
              id: idParam,
              name: nameParam,
              categories: categoriesParam,
              transactionsRelation: transactionsRelationParam);
          InternalToManyAccess.setRelInfo<Wallet>(object.transactionsRelation,
              store, RelInfo<Wallet>.toMany(2, object.id!));
          return object;
        }),
    WalletTransaction: EntityDefinition<WalletTransaction>(
        model: _entities[6],
        toOneRelations: (WalletTransaction object) => [object.walletRelation],
        toManyRelations: (WalletTransaction object) => {},
        getId: (WalletTransaction object) => object.id,
        setId: (WalletTransaction object, int id) {
          if (object.id != id) {
            throw ArgumentError('Field WalletTransaction.id is read-only '
                '(final or getter-only) and it was declared to be self-assigned. '
                'However, the currently inserted object (.id=${object.id}) '
                "doesn't match the inserted ID (ID $id). "
                'You must assign an ID before calling [box.put()].');
          }
        },
        objectToFB: (WalletTransaction object, fb.Builder fbb) {
          final nameOffset =
              object.name == null ? null : fbb.writeString(object.name!);
          final descriptionOffset = object.description == null
              ? null
              : fbb.writeString(object.description!);
          final amountOffset =
              object.amount == null ? null : fbb.writeString(object.amount!);
          final categoryOffset = object.category == null
              ? null
              : fbb.writeString(object.category!);
          final optionalCurrencyOffset = object.optionalCurrency == null
              ? null
              : fbb.writeString(object.optionalCurrency!);
          fbb.startTable(11);
          fbb.addInt64(0, object.id ?? 0);
          fbb.addInt64(1, object.walletId);
          fbb.addOffset(2, nameOffset);
          fbb.addOffset(3, descriptionOffset);
          fbb.addOffset(5, amountOffset);
          fbb.addInt64(6, object.transactionDate?.millisecondsSinceEpoch);
          fbb.addInt64(7, object.walletRelation.targetId);
          fbb.addOffset(8, categoryOffset);
          fbb.addOffset(9, optionalCurrencyOffset);
          fbb.finish(fbb.endTable());
          return object.id ?? 0;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final transactionDateValue =
              const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 16);
          final idParam =
              const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 4);
          final walletIdParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 6, 0);
          final nameParam = const fb.StringReader(asciiOptimization: true)
              .vTableGetNullable(buffer, rootOffset, 8);
          final descriptionParam =
              const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 10);
          final categoryParam = const fb.StringReader(asciiOptimization: true)
              .vTableGetNullable(buffer, rootOffset, 20);
          final amountParam = const fb.StringReader(asciiOptimization: true)
              .vTableGetNullable(buffer, rootOffset, 14);
          final optionalCurrencyParam =
              const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 22);
          final transactionDateParam = transactionDateValue == null
              ? null
              : DateTime.fromMillisecondsSinceEpoch(transactionDateValue);
          final walletRelationParam = ToOne<Wallet>(
              targetId:
                  const fb.Int64Reader().vTableGet(buffer, rootOffset, 18, 0));
          final object = WalletTransaction(
              id: idParam,
              walletId: walletIdParam,
              name: nameParam,
              description: descriptionParam,
              category: categoryParam,
              amount: amountParam,
              optionalCurrency: optionalCurrencyParam,
              transactionDate: transactionDateParam,
              walletRelation: walletRelationParam);
          object.walletRelation.attach(store);
          return object;
        }),
    WalletWidget: EntityDefinition<WalletWidget>(
        model: _entities[7],
        toOneRelations: (WalletWidget object) => [],
        toManyRelations: (WalletWidget object) => {},
        getId: (WalletWidget object) => object.id,
        setId: (WalletWidget object, int id) {
          if (object.id != id) {
            throw ArgumentError('Field WalletWidget.id is read-only '
                '(final or getter-only) and it was declared to be self-assigned. '
                'However, the currently inserted object (.id=${object.id}) '
                "doesn't match the inserted ID (ID $id). "
                'You must assign an ID before calling [box.put()].');
          }
        },
        objectToFB: (WalletWidget object, fb.Builder fbb) {
          fbb.startTable(4);
          fbb.addInt64(0, object.id ?? 0);
          fbb.addInt64(1, object.walletId);
          fbb.addInt64(2, object.widgetTypeIndex);
          fbb.finish(fbb.endTable());
          return object.id ?? 0;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final idParam =
              const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 4);
          final walletIdParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 6, 0);
          final widgetTypeIndexParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 8, 0);
          final object = WalletWidget(
              id: idParam,
              walletId: walletIdParam,
              widgetTypeIndex: widgetTypeIndexParam);

          return object;
        })
  };

  return ModelDefinition(model, bindings);
}

/// [AppWidget] entity fields to define ObjectBox queries.
class AppWidget_ {
  /// see [AppWidget.id]
  static final id = QueryIntegerProperty<AppWidget>(_entities[0].properties[0]);

  /// see [AppWidget.parentId]
  static final parentId =
      QueryStringProperty<AppWidget>(_entities[0].properties[1]);

  /// see [AppWidget.parentIndex]
  static final parentIndex =
      QueryIntegerProperty<AppWidget>(_entities[0].properties[2]);

  /// see [AppWidget.containedObjectTypeIndex]
  static final containedObjectTypeIndex =
      QueryIntegerProperty<AppWidget>(_entities[0].properties[3]);
}

/// [SharedPref] entity fields to define ObjectBox queries.
class SharedPref_ {
  /// see [SharedPref.id]
  static final id =
      QueryIntegerProperty<SharedPref>(_entities[1].properties[0]);

  /// see [SharedPref.key]
  static final key =
      QueryStringProperty<SharedPref>(_entities[1].properties[1]);

  /// see [SharedPref.value]
  static final value =
      QueryStringProperty<SharedPref>(_entities[1].properties[2]);
}

/// [ToDoList] entity fields to define ObjectBox queries.
class ToDoList_ {
  /// see [ToDoList.id]
  static final id = QueryIntegerProperty<ToDoList>(_entities[2].properties[0]);

  /// see [ToDoList.name]
  static final name = QueryStringProperty<ToDoList>(_entities[2].properties[1]);

  /// see [ToDoList.tasksRelation]
  static final tasksRelation =
      QueryRelationToMany<ToDoList, ToDoTask>(_entities[2].relations[0]);
}

/// [ToDoTask] entity fields to define ObjectBox queries.
class ToDoTask_ {
  /// see [ToDoTask.id]
  static final id = QueryIntegerProperty<ToDoTask>(_entities[3].properties[0]);

  /// see [ToDoTask.toDoListId]
  static final toDoListId =
      QueryIntegerProperty<ToDoTask>(_entities[3].properties[1]);

  /// see [ToDoTask.parentIndex]
  static final parentIndex =
      QueryIntegerProperty<ToDoTask>(_entities[3].properties[2]);

  /// see [ToDoTask.task]
  static final task = QueryStringProperty<ToDoTask>(_entities[3].properties[3]);

  /// see [ToDoTask.description]
  static final description =
      QueryStringProperty<ToDoTask>(_entities[3].properties[4]);

  /// see [ToDoTask.isDaily]
  static final isDaily =
      QueryBooleanProperty<ToDoTask>(_entities[3].properties[5]);

  /// see [ToDoTask.complete]
  static final complete =
      QueryBooleanProperty<ToDoTask>(_entities[3].properties[6]);

  /// see [ToDoTask.creationDate]
  static final creationDate =
      QueryIntegerProperty<ToDoTask>(_entities[3].properties[7]);

  /// see [ToDoTask.completionDate]
  static final completionDate =
      QueryIntegerProperty<ToDoTask>(_entities[3].properties[8]);

  /// see [ToDoTask.toDoListRelation]
  static final toDoListRelation =
      QueryRelationToOne<ToDoTask, ToDoList>(_entities[3].properties[9]);
}

/// [ToDoWidget] entity fields to define ObjectBox queries.
class ToDoWidget_ {
  /// see [ToDoWidget.id]
  static final id =
      QueryIntegerProperty<ToDoWidget>(_entities[4].properties[0]);

  /// see [ToDoWidget.toDoListId]
  static final toDoListId =
      QueryIntegerProperty<ToDoWidget>(_entities[4].properties[1]);

  /// see [ToDoWidget.widgetTypeIndex]
  static final widgetTypeIndex =
      QueryIntegerProperty<ToDoWidget>(_entities[4].properties[2]);
}

/// [Wallet] entity fields to define ObjectBox queries.
class Wallet_ {
  /// see [Wallet.id]
  static final id = QueryIntegerProperty<Wallet>(_entities[5].properties[0]);

  /// see [Wallet.name]
  static final name = QueryStringProperty<Wallet>(_entities[5].properties[1]);

  /// see [Wallet.categories]
  static final categories =
      QueryStringVectorProperty<Wallet>(_entities[5].properties[2]);

  /// see [Wallet.transactionsRelation]
  static final transactionsRelation =
      QueryRelationToMany<Wallet, WalletTransaction>(_entities[5].relations[0]);
}

/// [WalletTransaction] entity fields to define ObjectBox queries.
class WalletTransaction_ {
  /// see [WalletTransaction.id]
  static final id =
      QueryIntegerProperty<WalletTransaction>(_entities[6].properties[0]);

  /// see [WalletTransaction.walletId]
  static final walletId =
      QueryIntegerProperty<WalletTransaction>(_entities[6].properties[1]);

  /// see [WalletTransaction.name]
  static final name =
      QueryStringProperty<WalletTransaction>(_entities[6].properties[2]);

  /// see [WalletTransaction.description]
  static final description =
      QueryStringProperty<WalletTransaction>(_entities[6].properties[3]);

  /// see [WalletTransaction.amount]
  static final amount =
      QueryStringProperty<WalletTransaction>(_entities[6].properties[4]);

  /// see [WalletTransaction.transactionDate]
  static final transactionDate =
      QueryIntegerProperty<WalletTransaction>(_entities[6].properties[5]);

  /// see [WalletTransaction.walletRelation]
  static final walletRelation =
      QueryRelationToOne<WalletTransaction, Wallet>(_entities[6].properties[6]);

  /// see [WalletTransaction.category]
  static final category =
      QueryStringProperty<WalletTransaction>(_entities[6].properties[7]);

  /// see [WalletTransaction.optionalCurrency]
  static final optionalCurrency =
      QueryStringProperty<WalletTransaction>(_entities[6].properties[8]);
}

/// [WalletWidget] entity fields to define ObjectBox queries.
class WalletWidget_ {
  /// see [WalletWidget.id]
  static final id =
      QueryIntegerProperty<WalletWidget>(_entities[7].properties[0]);

  /// see [WalletWidget.walletId]
  static final walletId =
      QueryIntegerProperty<WalletWidget>(_entities[7].properties[1]);

  /// see [WalletWidget.widgetTypeIndex]
  static final widgetTypeIndex =
      QueryIntegerProperty<WalletWidget>(_entities[7].properties[2]);
}
