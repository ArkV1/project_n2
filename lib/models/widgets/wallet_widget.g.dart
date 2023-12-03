// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_widget.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetWalletWidgetCollection on Isar {
  IsarCollection<WalletWidget> get walletWidgets => this.collection();
}

const WalletWidgetSchema = CollectionSchema(
  name: r'WalletWidget',
  id: -1496891112442067422,
  properties: {
    r'walletId': PropertySchema(
      id: 0,
      name: r'walletId',
      type: IsarType.long,
    ),
    r'widgetType': PropertySchema(
      id: 1,
      name: r'widgetType',
      type: IsarType.byte,
      enumMap: _WalletWidgetwidgetTypeEnumValueMap,
    )
  },
  estimateSize: _walletWidgetEstimateSize,
  serialize: _walletWidgetSerialize,
  deserialize: _walletWidgetDeserialize,
  deserializeProp: _walletWidgetDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'appWidget': LinkSchema(
      id: -4810076437774456307,
      name: r'appWidget',
      target: r'AppWidget',
      single: true,
      linkName: r'walletWidgetLink',
    )
  },
  embeddedSchemas: {},
  getId: _walletWidgetGetId,
  getLinks: _walletWidgetGetLinks,
  attach: _walletWidgetAttach,
  version: '3.1.0',
);

int _walletWidgetEstimateSize(
  WalletWidget object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _walletWidgetSerialize(
  WalletWidget object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.walletId);
  writer.writeByte(offsets[1], object.widgetType.index);
}

WalletWidget _walletWidgetDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = WalletWidget(
    id: id,
    walletId: reader.readLong(offsets[0]),
    widgetType: _WalletWidgetwidgetTypeValueEnumMap[
            reader.readByteOrNull(offsets[1])] ??
        WalletWidgetType.dailySpendings,
  );
  return object;
}

P _walletWidgetDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (_WalletWidgetwidgetTypeValueEnumMap[
              reader.readByteOrNull(offset)] ??
          WalletWidgetType.dailySpendings) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _WalletWidgetwidgetTypeEnumValueMap = {
  'dailySpendings': 0,
  'total': 1,
  'lastTransaction': 2,
};
const _WalletWidgetwidgetTypeValueEnumMap = {
  0: WalletWidgetType.dailySpendings,
  1: WalletWidgetType.total,
  2: WalletWidgetType.lastTransaction,
};

Id _walletWidgetGetId(WalletWidget object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _walletWidgetGetLinks(WalletWidget object) {
  return [object.appWidget];
}

void _walletWidgetAttach(
    IsarCollection<dynamic> col, Id id, WalletWidget object) {
  object.appWidget
      .attach(col, col.isar.collection<AppWidget>(), r'appWidget', id);
}

extension WalletWidgetQueryWhereSort
    on QueryBuilder<WalletWidget, WalletWidget, QWhere> {
  QueryBuilder<WalletWidget, WalletWidget, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension WalletWidgetQueryWhere
    on QueryBuilder<WalletWidget, WalletWidget, QWhereClause> {
  QueryBuilder<WalletWidget, WalletWidget, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<WalletWidget, WalletWidget, QAfterWhereClause> idNotEqualTo(
      Id id) {
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

  QueryBuilder<WalletWidget, WalletWidget, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<WalletWidget, WalletWidget, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<WalletWidget, WalletWidget, QAfterWhereClause> idBetween(
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

extension WalletWidgetQueryFilter
    on QueryBuilder<WalletWidget, WalletWidget, QFilterCondition> {
  QueryBuilder<WalletWidget, WalletWidget, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<WalletWidget, WalletWidget, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<WalletWidget, WalletWidget, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<WalletWidget, WalletWidget, QAfterFilterCondition> idBetween(
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

  QueryBuilder<WalletWidget, WalletWidget, QAfterFilterCondition>
      walletIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'walletId',
        value: value,
      ));
    });
  }

  QueryBuilder<WalletWidget, WalletWidget, QAfterFilterCondition>
      walletIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'walletId',
        value: value,
      ));
    });
  }

  QueryBuilder<WalletWidget, WalletWidget, QAfterFilterCondition>
      walletIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'walletId',
        value: value,
      ));
    });
  }

  QueryBuilder<WalletWidget, WalletWidget, QAfterFilterCondition>
      walletIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'walletId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WalletWidget, WalletWidget, QAfterFilterCondition>
      widgetTypeEqualTo(WalletWidgetType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'widgetType',
        value: value,
      ));
    });
  }

  QueryBuilder<WalletWidget, WalletWidget, QAfterFilterCondition>
      widgetTypeGreaterThan(
    WalletWidgetType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'widgetType',
        value: value,
      ));
    });
  }

  QueryBuilder<WalletWidget, WalletWidget, QAfterFilterCondition>
      widgetTypeLessThan(
    WalletWidgetType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'widgetType',
        value: value,
      ));
    });
  }

  QueryBuilder<WalletWidget, WalletWidget, QAfterFilterCondition>
      widgetTypeBetween(
    WalletWidgetType lower,
    WalletWidgetType upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'widgetType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension WalletWidgetQueryObject
    on QueryBuilder<WalletWidget, WalletWidget, QFilterCondition> {}

extension WalletWidgetQueryLinks
    on QueryBuilder<WalletWidget, WalletWidget, QFilterCondition> {
  QueryBuilder<WalletWidget, WalletWidget, QAfterFilterCondition> appWidget(
      FilterQuery<AppWidget> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'appWidget');
    });
  }

  QueryBuilder<WalletWidget, WalletWidget, QAfterFilterCondition>
      appWidgetIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'appWidget', 0, true, 0, true);
    });
  }
}

extension WalletWidgetQuerySortBy
    on QueryBuilder<WalletWidget, WalletWidget, QSortBy> {
  QueryBuilder<WalletWidget, WalletWidget, QAfterSortBy> sortByWalletId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'walletId', Sort.asc);
    });
  }

  QueryBuilder<WalletWidget, WalletWidget, QAfterSortBy> sortByWalletIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'walletId', Sort.desc);
    });
  }

  QueryBuilder<WalletWidget, WalletWidget, QAfterSortBy> sortByWidgetType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'widgetType', Sort.asc);
    });
  }

  QueryBuilder<WalletWidget, WalletWidget, QAfterSortBy>
      sortByWidgetTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'widgetType', Sort.desc);
    });
  }
}

extension WalletWidgetQuerySortThenBy
    on QueryBuilder<WalletWidget, WalletWidget, QSortThenBy> {
  QueryBuilder<WalletWidget, WalletWidget, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<WalletWidget, WalletWidget, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<WalletWidget, WalletWidget, QAfterSortBy> thenByWalletId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'walletId', Sort.asc);
    });
  }

  QueryBuilder<WalletWidget, WalletWidget, QAfterSortBy> thenByWalletIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'walletId', Sort.desc);
    });
  }

  QueryBuilder<WalletWidget, WalletWidget, QAfterSortBy> thenByWidgetType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'widgetType', Sort.asc);
    });
  }

  QueryBuilder<WalletWidget, WalletWidget, QAfterSortBy>
      thenByWidgetTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'widgetType', Sort.desc);
    });
  }
}

extension WalletWidgetQueryWhereDistinct
    on QueryBuilder<WalletWidget, WalletWidget, QDistinct> {
  QueryBuilder<WalletWidget, WalletWidget, QDistinct> distinctByWalletId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'walletId');
    });
  }

  QueryBuilder<WalletWidget, WalletWidget, QDistinct> distinctByWidgetType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'widgetType');
    });
  }
}

extension WalletWidgetQueryProperty
    on QueryBuilder<WalletWidget, WalletWidget, QQueryProperty> {
  QueryBuilder<WalletWidget, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<WalletWidget, int, QQueryOperations> walletIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'walletId');
    });
  }

  QueryBuilder<WalletWidget, WalletWidgetType, QQueryOperations>
      widgetTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'widgetType');
    });
  }
}
