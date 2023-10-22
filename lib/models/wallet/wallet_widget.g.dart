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
    r'containedObjectTypeString': PropertySchema(
      id: 0,
      name: r'containedObjectTypeString',
      type: IsarType.string,
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
    ),
    r'walletId': PropertySchema(
      id: 3,
      name: r'walletId',
      type: IsarType.long,
    ),
    r'widgetType': PropertySchema(
      id: 4,
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
  links: {},
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
  bytesCount += 3 + object.containedObjectTypeString.length * 3;
  {
    final value = object.parentId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _walletWidgetSerialize(
  WalletWidget object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.containedObjectTypeString);
  writer.writeString(offsets[1], object.parentId);
  writer.writeLong(offsets[2], object.parentIndex);
  writer.writeLong(offsets[3], object.walletId);
  writer.writeByte(offsets[4], object.widgetType.index);
}

WalletWidget _walletWidgetDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = WalletWidget(
    parentId: reader.readStringOrNull(offsets[1]),
    parentIndex: reader.readLongOrNull(offsets[2]),
    walletId: reader.readLong(offsets[3]),
    widgetType: _WalletWidgetwidgetTypeValueEnumMap[
            reader.readByteOrNull(offsets[4])] ??
        WalletWidgetType.total,
  );
  object.containedObjectTypeString = reader.readString(offsets[0]);
  object.id = id;
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
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (_WalletWidgetwidgetTypeValueEnumMap[
              reader.readByteOrNull(offset)] ??
          WalletWidgetType.total) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _WalletWidgetwidgetTypeEnumValueMap = {
  'total': 0,
  'lastTransaction': 1,
};
const _WalletWidgetwidgetTypeValueEnumMap = {
  0: WalletWidgetType.total,
  1: WalletWidgetType.lastTransaction,
};

Id _walletWidgetGetId(WalletWidget object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _walletWidgetGetLinks(WalletWidget object) {
  return [];
}

void _walletWidgetAttach(
    IsarCollection<dynamic> col, Id id, WalletWidget object) {
  object.id = id;
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
  QueryBuilder<WalletWidget, WalletWidget, QAfterFilterCondition>
      containedObjectTypeStringEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'containedObjectTypeString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WalletWidget, WalletWidget, QAfterFilterCondition>
      containedObjectTypeStringGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'containedObjectTypeString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WalletWidget, WalletWidget, QAfterFilterCondition>
      containedObjectTypeStringLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'containedObjectTypeString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WalletWidget, WalletWidget, QAfterFilterCondition>
      containedObjectTypeStringBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'containedObjectTypeString',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WalletWidget, WalletWidget, QAfterFilterCondition>
      containedObjectTypeStringStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'containedObjectTypeString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WalletWidget, WalletWidget, QAfterFilterCondition>
      containedObjectTypeStringEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'containedObjectTypeString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WalletWidget, WalletWidget, QAfterFilterCondition>
      containedObjectTypeStringContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'containedObjectTypeString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WalletWidget, WalletWidget, QAfterFilterCondition>
      containedObjectTypeStringMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'containedObjectTypeString',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WalletWidget, WalletWidget, QAfterFilterCondition>
      containedObjectTypeStringIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'containedObjectTypeString',
        value: '',
      ));
    });
  }

  QueryBuilder<WalletWidget, WalletWidget, QAfterFilterCondition>
      containedObjectTypeStringIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'containedObjectTypeString',
        value: '',
      ));
    });
  }

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
      parentIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'parentId',
      ));
    });
  }

  QueryBuilder<WalletWidget, WalletWidget, QAfterFilterCondition>
      parentIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'parentId',
      ));
    });
  }

  QueryBuilder<WalletWidget, WalletWidget, QAfterFilterCondition>
      parentIdEqualTo(
    String? value, {
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

  QueryBuilder<WalletWidget, WalletWidget, QAfterFilterCondition>
      parentIdGreaterThan(
    String? value, {
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

  QueryBuilder<WalletWidget, WalletWidget, QAfterFilterCondition>
      parentIdLessThan(
    String? value, {
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

  QueryBuilder<WalletWidget, WalletWidget, QAfterFilterCondition>
      parentIdBetween(
    String? lower,
    String? upper, {
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

  QueryBuilder<WalletWidget, WalletWidget, QAfterFilterCondition>
      parentIdStartsWith(
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

  QueryBuilder<WalletWidget, WalletWidget, QAfterFilterCondition>
      parentIdEndsWith(
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

  QueryBuilder<WalletWidget, WalletWidget, QAfterFilterCondition>
      parentIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'parentId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WalletWidget, WalletWidget, QAfterFilterCondition>
      parentIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'parentId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WalletWidget, WalletWidget, QAfterFilterCondition>
      parentIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'parentId',
        value: '',
      ));
    });
  }

  QueryBuilder<WalletWidget, WalletWidget, QAfterFilterCondition>
      parentIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'parentId',
        value: '',
      ));
    });
  }

  QueryBuilder<WalletWidget, WalletWidget, QAfterFilterCondition>
      parentIndexIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'parentIndex',
      ));
    });
  }

  QueryBuilder<WalletWidget, WalletWidget, QAfterFilterCondition>
      parentIndexIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'parentIndex',
      ));
    });
  }

  QueryBuilder<WalletWidget, WalletWidget, QAfterFilterCondition>
      parentIndexEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'parentIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<WalletWidget, WalletWidget, QAfterFilterCondition>
      parentIndexGreaterThan(
    int? value, {
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

  QueryBuilder<WalletWidget, WalletWidget, QAfterFilterCondition>
      parentIndexLessThan(
    int? value, {
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

  QueryBuilder<WalletWidget, WalletWidget, QAfterFilterCondition>
      parentIndexBetween(
    int? lower,
    int? upper, {
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
    on QueryBuilder<WalletWidget, WalletWidget, QFilterCondition> {}

extension WalletWidgetQuerySortBy
    on QueryBuilder<WalletWidget, WalletWidget, QSortBy> {
  QueryBuilder<WalletWidget, WalletWidget, QAfterSortBy>
      sortByContainedObjectTypeString() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'containedObjectTypeString', Sort.asc);
    });
  }

  QueryBuilder<WalletWidget, WalletWidget, QAfterSortBy>
      sortByContainedObjectTypeStringDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'containedObjectTypeString', Sort.desc);
    });
  }

  QueryBuilder<WalletWidget, WalletWidget, QAfterSortBy> sortByParentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parentId', Sort.asc);
    });
  }

  QueryBuilder<WalletWidget, WalletWidget, QAfterSortBy> sortByParentIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parentId', Sort.desc);
    });
  }

  QueryBuilder<WalletWidget, WalletWidget, QAfterSortBy> sortByParentIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parentIndex', Sort.asc);
    });
  }

  QueryBuilder<WalletWidget, WalletWidget, QAfterSortBy>
      sortByParentIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parentIndex', Sort.desc);
    });
  }

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
  QueryBuilder<WalletWidget, WalletWidget, QAfterSortBy>
      thenByContainedObjectTypeString() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'containedObjectTypeString', Sort.asc);
    });
  }

  QueryBuilder<WalletWidget, WalletWidget, QAfterSortBy>
      thenByContainedObjectTypeStringDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'containedObjectTypeString', Sort.desc);
    });
  }

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

  QueryBuilder<WalletWidget, WalletWidget, QAfterSortBy> thenByParentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parentId', Sort.asc);
    });
  }

  QueryBuilder<WalletWidget, WalletWidget, QAfterSortBy> thenByParentIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parentId', Sort.desc);
    });
  }

  QueryBuilder<WalletWidget, WalletWidget, QAfterSortBy> thenByParentIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parentIndex', Sort.asc);
    });
  }

  QueryBuilder<WalletWidget, WalletWidget, QAfterSortBy>
      thenByParentIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parentIndex', Sort.desc);
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
  QueryBuilder<WalletWidget, WalletWidget, QDistinct>
      distinctByContainedObjectTypeString({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'containedObjectTypeString',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WalletWidget, WalletWidget, QDistinct> distinctByParentId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'parentId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WalletWidget, WalletWidget, QDistinct> distinctByParentIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'parentIndex');
    });
  }

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

  QueryBuilder<WalletWidget, String, QQueryOperations>
      containedObjectTypeStringProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'containedObjectTypeString');
    });
  }

  QueryBuilder<WalletWidget, String?, QQueryOperations> parentIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'parentId');
    });
  }

  QueryBuilder<WalletWidget, int?, QQueryOperations> parentIndexProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'parentIndex');
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
