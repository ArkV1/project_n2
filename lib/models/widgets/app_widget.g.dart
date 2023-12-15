// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_widget.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetAppWidgetCollection on Isar {
  IsarCollection<AppWidget> get appWidgets => this.collection();
}

const AppWidgetSchema = CollectionSchema(
  name: r'AppWidget',
  id: 3442511140787611484,
  properties: {
    r'containedObjectType': PropertySchema(
      id: 0,
      name: r'containedObjectType',
      type: IsarType.byte,
      enumMap: _AppWidgetcontainedObjectTypeEnumValueMap,
    ),
    r'parentId': PropertySchema(
      id: 1,
      name: r'parentId',
      type: IsarType.string,
    ),
    r'parentIndex': PropertySchema(
      id: 2,
      name: r'parentIndex',
      type: IsarType.long,
    )
  },
  estimateSize: _appWidgetEstimateSize,
  serialize: _appWidgetSerialize,
  deserialize: _appWidgetDeserialize,
  deserializeProp: _appWidgetDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'toDoWidgetLink': LinkSchema(
      id: 8388284654152078179,
      name: r'toDoWidgetLink',
      target: r'ToDoWidget',
      single: true,
    ),
    r'walletWidgetLink': LinkSchema(
      id: -7676398657068347897,
      name: r'walletWidgetLink',
      target: r'WalletWidget',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _appWidgetGetId,
  getLinks: _appWidgetGetLinks,
  attach: _appWidgetAttach,
  version: '3.1.0',
);

int _appWidgetEstimateSize(
  AppWidget object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.parentId.length * 3;
  return bytesCount;
}

void _appWidgetSerialize(
  AppWidget object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeByte(offsets[0], object.containedObjectType.index);
  writer.writeString(offsets[1], object.parentId);
  writer.writeLong(offsets[2], object.parentIndex);
}

AppWidget _appWidgetDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = AppWidget(
    containedObjectType: _AppWidgetcontainedObjectTypeValueEnumMap[
            reader.readByteOrNull(offsets[0])] ??
        ContainedObjectType.wallet,
    id: id,
    parentId: reader.readString(offsets[1]),
    parentIndex: reader.readLong(offsets[2]),
  );
  return object;
}

P _appWidgetDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (_AppWidgetcontainedObjectTypeValueEnumMap[
              reader.readByteOrNull(offset)] ??
          ContainedObjectType.wallet) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _AppWidgetcontainedObjectTypeEnumValueMap = {
  'wallet': 0,
  'toDoList': 1,
  'other': 2,
};
const _AppWidgetcontainedObjectTypeValueEnumMap = {
  0: ContainedObjectType.wallet,
  1: ContainedObjectType.toDoList,
  2: ContainedObjectType.other,
};

Id _appWidgetGetId(AppWidget object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _appWidgetGetLinks(AppWidget object) {
  return [object.toDoWidgetLink, object.walletWidgetLink];
}

void _appWidgetAttach(IsarCollection<dynamic> col, Id id, AppWidget object) {
  object.toDoWidgetLink
      .attach(col, col.isar.collection<ToDoWidget>(), r'toDoWidgetLink', id);
  object.walletWidgetLink.attach(
      col, col.isar.collection<WalletWidget>(), r'walletWidgetLink', id);
}

extension AppWidgetQueryWhereSort
    on QueryBuilder<AppWidget, AppWidget, QWhere> {
  QueryBuilder<AppWidget, AppWidget, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension AppWidgetQueryWhere
    on QueryBuilder<AppWidget, AppWidget, QWhereClause> {
  QueryBuilder<AppWidget, AppWidget, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<AppWidget, AppWidget, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<AppWidget, AppWidget, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<AppWidget, AppWidget, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<AppWidget, AppWidget, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension AppWidgetQueryFilter
    on QueryBuilder<AppWidget, AppWidget, QFilterCondition> {
  QueryBuilder<AppWidget, AppWidget, QAfterFilterCondition>
      containedObjectTypeEqualTo(ContainedObjectType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'containedObjectType',
        value: value,
      ));
    });
  }

  QueryBuilder<AppWidget, AppWidget, QAfterFilterCondition>
      containedObjectTypeGreaterThan(
    ContainedObjectType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'containedObjectType',
        value: value,
      ));
    });
  }

  QueryBuilder<AppWidget, AppWidget, QAfterFilterCondition>
      containedObjectTypeLessThan(
    ContainedObjectType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'containedObjectType',
        value: value,
      ));
    });
  }

  QueryBuilder<AppWidget, AppWidget, QAfterFilterCondition>
      containedObjectTypeBetween(
    ContainedObjectType lower,
    ContainedObjectType upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'containedObjectType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AppWidget, AppWidget, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<AppWidget, AppWidget, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<AppWidget, AppWidget, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<AppWidget, AppWidget, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AppWidget, AppWidget, QAfterFilterCondition> parentIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'parentId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppWidget, AppWidget, QAfterFilterCondition> parentIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'parentId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppWidget, AppWidget, QAfterFilterCondition> parentIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'parentId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppWidget, AppWidget, QAfterFilterCondition> parentIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'parentId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppWidget, AppWidget, QAfterFilterCondition> parentIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'parentId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppWidget, AppWidget, QAfterFilterCondition> parentIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'parentId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppWidget, AppWidget, QAfterFilterCondition> parentIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'parentId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppWidget, AppWidget, QAfterFilterCondition> parentIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'parentId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppWidget, AppWidget, QAfterFilterCondition> parentIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'parentId',
        value: '',
      ));
    });
  }

  QueryBuilder<AppWidget, AppWidget, QAfterFilterCondition>
      parentIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'parentId',
        value: '',
      ));
    });
  }

  QueryBuilder<AppWidget, AppWidget, QAfterFilterCondition> parentIndexEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'parentIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<AppWidget, AppWidget, QAfterFilterCondition>
      parentIndexGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'parentIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<AppWidget, AppWidget, QAfterFilterCondition> parentIndexLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'parentIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<AppWidget, AppWidget, QAfterFilterCondition> parentIndexBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'parentIndex',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension AppWidgetQueryObject
    on QueryBuilder<AppWidget, AppWidget, QFilterCondition> {}

extension AppWidgetQueryLinks
    on QueryBuilder<AppWidget, AppWidget, QFilterCondition> {
  QueryBuilder<AppWidget, AppWidget, QAfterFilterCondition> toDoWidgetLink(
      FilterQuery<ToDoWidget> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'toDoWidgetLink');
    });
  }

  QueryBuilder<AppWidget, AppWidget, QAfterFilterCondition>
      toDoWidgetLinkIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'toDoWidgetLink', 0, true, 0, true);
    });
  }

  QueryBuilder<AppWidget, AppWidget, QAfterFilterCondition> walletWidgetLink(
      FilterQuery<WalletWidget> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'walletWidgetLink');
    });
  }

  QueryBuilder<AppWidget, AppWidget, QAfterFilterCondition>
      walletWidgetLinkIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'walletWidgetLink', 0, true, 0, true);
    });
  }
}

extension AppWidgetQuerySortBy on QueryBuilder<AppWidget, AppWidget, QSortBy> {
  QueryBuilder<AppWidget, AppWidget, QAfterSortBy> sortByContainedObjectType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'containedObjectType', Sort.asc);
    });
  }

  QueryBuilder<AppWidget, AppWidget, QAfterSortBy>
      sortByContainedObjectTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'containedObjectType', Sort.desc);
    });
  }

  QueryBuilder<AppWidget, AppWidget, QAfterSortBy> sortByParentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parentId', Sort.asc);
    });
  }

  QueryBuilder<AppWidget, AppWidget, QAfterSortBy> sortByParentIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parentId', Sort.desc);
    });
  }

  QueryBuilder<AppWidget, AppWidget, QAfterSortBy> sortByParentIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parentIndex', Sort.asc);
    });
  }

  QueryBuilder<AppWidget, AppWidget, QAfterSortBy> sortByParentIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parentIndex', Sort.desc);
    });
  }
}

extension AppWidgetQuerySortThenBy
    on QueryBuilder<AppWidget, AppWidget, QSortThenBy> {
  QueryBuilder<AppWidget, AppWidget, QAfterSortBy> thenByContainedObjectType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'containedObjectType', Sort.asc);
    });
  }

  QueryBuilder<AppWidget, AppWidget, QAfterSortBy>
      thenByContainedObjectTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'containedObjectType', Sort.desc);
    });
  }

  QueryBuilder<AppWidget, AppWidget, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<AppWidget, AppWidget, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<AppWidget, AppWidget, QAfterSortBy> thenByParentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parentId', Sort.asc);
    });
  }

  QueryBuilder<AppWidget, AppWidget, QAfterSortBy> thenByParentIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parentId', Sort.desc);
    });
  }

  QueryBuilder<AppWidget, AppWidget, QAfterSortBy> thenByParentIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parentIndex', Sort.asc);
    });
  }

  QueryBuilder<AppWidget, AppWidget, QAfterSortBy> thenByParentIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parentIndex', Sort.desc);
    });
  }
}

extension AppWidgetQueryWhereDistinct
    on QueryBuilder<AppWidget, AppWidget, QDistinct> {
  QueryBuilder<AppWidget, AppWidget, QDistinct>
      distinctByContainedObjectType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'containedObjectType');
    });
  }

  QueryBuilder<AppWidget, AppWidget, QDistinct> distinctByParentId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'parentId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AppWidget, AppWidget, QDistinct> distinctByParentIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'parentIndex');
    });
  }
}

extension AppWidgetQueryProperty
    on QueryBuilder<AppWidget, AppWidget, QQueryProperty> {
  QueryBuilder<AppWidget, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<AppWidget, ContainedObjectType, QQueryOperations>
      containedObjectTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'containedObjectType');
    });
  }

  QueryBuilder<AppWidget, String, QQueryOperations> parentIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'parentId');
    });
  }

  QueryBuilder<AppWidget, int, QQueryOperations> parentIndexProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'parentIndex');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppWidgetImpl _$$AppWidgetImplFromJson(Map<String, dynamic> json) =>
    _$AppWidgetImpl(
      id: json['id'] as int? ?? Isar.autoIncrement,
      parentId: json['parentId'] as String,
      parentIndex: json['parentIndex'] as int,
      containedObjectType: $enumDecode(
          _$ContainedObjectTypeEnumMap, json['containedObjectType']),
      widgetSettingsMap: json['widgetSettingsMap'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$AppWidgetImplToJson(_$AppWidgetImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'parentId': instance.parentId,
      'parentIndex': instance.parentIndex,
      'containedObjectType':
          _$ContainedObjectTypeEnumMap[instance.containedObjectType]!,
      'widgetSettingsMap': instance.widgetSettingsMap,
    };

const _$ContainedObjectTypeEnumMap = {
  ContainedObjectType.wallet: 'wallet',
  ContainedObjectType.toDoList: 'toDoList',
  ContainedObjectType.other: 'other',
};

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appWidgetsHash() => r'd0c5bc7d847ce410c603010d17094906b0786bc8';

/// See also [AppWidgets].
@ProviderFor(AppWidgets)
final appWidgetsProvider =
    AsyncNotifierProvider<AppWidgets, List<AppWidget>>.internal(
  AppWidgets.new,
  name: r'appWidgetsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$appWidgetsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AppWidgets = AsyncNotifier<List<AppWidget>>;
String _$appWidgetByParentIdHash() =>
    r'79f7b1ab834a1cd915df99402e1c1ce45a39dde9';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$AppWidgetByParentId
    extends BuildlessAutoDisposeAsyncNotifier<List<AppWidget>> {
  late final String parentId;

  FutureOr<List<AppWidget>> build({
    required String parentId,
  });
}

/// See also [AppWidgetByParentId].
@ProviderFor(AppWidgetByParentId)
const appWidgetByParentIdProvider = AppWidgetByParentIdFamily();

/// See also [AppWidgetByParentId].
class AppWidgetByParentIdFamily extends Family<AsyncValue<List<AppWidget>>> {
  /// See also [AppWidgetByParentId].
  const AppWidgetByParentIdFamily();

  /// See also [AppWidgetByParentId].
  AppWidgetByParentIdProvider call({
    required String parentId,
  }) {
    return AppWidgetByParentIdProvider(
      parentId: parentId,
    );
  }

  @override
  AppWidgetByParentIdProvider getProviderOverride(
    covariant AppWidgetByParentIdProvider provider,
  ) {
    return call(
      parentId: provider.parentId,
    );
  }

  static final Iterable<ProviderOrFamily> _dependencies = <ProviderOrFamily>[
    appWidgetsProvider
  ];

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static final Iterable<ProviderOrFamily> _allTransitiveDependencies =
      <ProviderOrFamily>{
    appWidgetsProvider,
    ...?appWidgetsProvider.allTransitiveDependencies
  };

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'appWidgetByParentIdProvider';
}

/// See also [AppWidgetByParentId].
class AppWidgetByParentIdProvider extends AutoDisposeAsyncNotifierProviderImpl<
    AppWidgetByParentId, List<AppWidget>> {
  /// See also [AppWidgetByParentId].
  AppWidgetByParentIdProvider({
    required String parentId,
  }) : this._internal(
          () => AppWidgetByParentId()..parentId = parentId,
          from: appWidgetByParentIdProvider,
          name: r'appWidgetByParentIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$appWidgetByParentIdHash,
          dependencies: AppWidgetByParentIdFamily._dependencies,
          allTransitiveDependencies:
              AppWidgetByParentIdFamily._allTransitiveDependencies,
          parentId: parentId,
        );

  AppWidgetByParentIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.parentId,
  }) : super.internal();

  final String parentId;

  @override
  FutureOr<List<AppWidget>> runNotifierBuild(
    covariant AppWidgetByParentId notifier,
  ) {
    return notifier.build(
      parentId: parentId,
    );
  }

  @override
  Override overrideWith(AppWidgetByParentId Function() create) {
    return ProviderOverride(
      origin: this,
      override: AppWidgetByParentIdProvider._internal(
        () => create()..parentId = parentId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        parentId: parentId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<AppWidgetByParentId, List<AppWidget>>
      createElement() {
    return _AppWidgetByParentIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AppWidgetByParentIdProvider && other.parentId == parentId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, parentId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AppWidgetByParentIdRef
    on AutoDisposeAsyncNotifierProviderRef<List<AppWidget>> {
  /// The parameter `parentId` of this provider.
  String get parentId;
}

class _AppWidgetByParentIdProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<AppWidgetByParentId,
        List<AppWidget>> with AppWidgetByParentIdRef {
  _AppWidgetByParentIdProviderElement(super.provider);

  @override
  String get parentId => (origin as AppWidgetByParentIdProvider).parentId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
