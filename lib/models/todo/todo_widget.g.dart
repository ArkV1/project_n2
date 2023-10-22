// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_widget.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetToDoWidgetCollection on Isar {
  IsarCollection<ToDoWidget> get toDoWidgets => this.collection();
}

const ToDoWidgetSchema = CollectionSchema(
  name: r'ToDoWidget',
  id: -7720325314845001668,
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
    r'toDoListId': PropertySchema(
      id: 3,
      name: r'toDoListId',
      type: IsarType.string,
    ),
    r'widgetType': PropertySchema(
      id: 4,
      name: r'widgetType',
      type: IsarType.byte,
      enumMap: _ToDoWidgetwidgetTypeEnumValueMap,
    )
  },
  estimateSize: _toDoWidgetEstimateSize,
  serialize: _toDoWidgetSerialize,
  deserialize: _toDoWidgetDeserialize,
  deserializeProp: _toDoWidgetDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _toDoWidgetGetId,
  getLinks: _toDoWidgetGetLinks,
  attach: _toDoWidgetAttach,
  version: '3.1.0',
);

int _toDoWidgetEstimateSize(
  ToDoWidget object,
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
  bytesCount += 3 + object.toDoListId.length * 3;
  return bytesCount;
}

void _toDoWidgetSerialize(
  ToDoWidget object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.containedObjectTypeString);
  writer.writeString(offsets[1], object.parentId);
  writer.writeLong(offsets[2], object.parentIndex);
  writer.writeString(offsets[3], object.toDoListId);
  writer.writeByte(offsets[4], object.widgetType.index);
}

ToDoWidget _toDoWidgetDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ToDoWidget(
    parentId: reader.readStringOrNull(offsets[1]),
    parentIndex: reader.readLongOrNull(offsets[2]),
    toDoListId: reader.readString(offsets[3]),
    widgetType:
        _ToDoWidgetwidgetTypeValueEnumMap[reader.readByteOrNull(offsets[4])] ??
            ToDoWidgetType.classic,
  );
  object.containedObjectTypeString = reader.readString(offsets[0]);
  object.id = id;
  return object;
}

P _toDoWidgetDeserializeProp<P>(
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
      return (reader.readString(offset)) as P;
    case 4:
      return (_ToDoWidgetwidgetTypeValueEnumMap[
              reader.readByteOrNull(offset)] ??
          ToDoWidgetType.classic) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _ToDoWidgetwidgetTypeEnumValueMap = {
  'classic': 0,
  'expanded': 1,
};
const _ToDoWidgetwidgetTypeValueEnumMap = {
  0: ToDoWidgetType.classic,
  1: ToDoWidgetType.expanded,
};

Id _toDoWidgetGetId(ToDoWidget object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _toDoWidgetGetLinks(ToDoWidget object) {
  return [];
}

void _toDoWidgetAttach(IsarCollection<dynamic> col, Id id, ToDoWidget object) {
  object.id = id;
}

extension ToDoWidgetQueryWhereSort
    on QueryBuilder<ToDoWidget, ToDoWidget, QWhere> {
  QueryBuilder<ToDoWidget, ToDoWidget, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ToDoWidgetQueryWhere
    on QueryBuilder<ToDoWidget, ToDoWidget, QWhereClause> {
  QueryBuilder<ToDoWidget, ToDoWidget, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ToDoWidget, ToDoWidget, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<ToDoWidget, ToDoWidget, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ToDoWidget, ToDoWidget, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ToDoWidget, ToDoWidget, QAfterWhereClause> idBetween(
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

extension ToDoWidgetQueryFilter
    on QueryBuilder<ToDoWidget, ToDoWidget, QFilterCondition> {
  QueryBuilder<ToDoWidget, ToDoWidget, QAfterFilterCondition>
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

  QueryBuilder<ToDoWidget, ToDoWidget, QAfterFilterCondition>
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

  QueryBuilder<ToDoWidget, ToDoWidget, QAfterFilterCondition>
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

  QueryBuilder<ToDoWidget, ToDoWidget, QAfterFilterCondition>
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

  QueryBuilder<ToDoWidget, ToDoWidget, QAfterFilterCondition>
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

  QueryBuilder<ToDoWidget, ToDoWidget, QAfterFilterCondition>
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

  QueryBuilder<ToDoWidget, ToDoWidget, QAfterFilterCondition>
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

  QueryBuilder<ToDoWidget, ToDoWidget, QAfterFilterCondition>
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

  QueryBuilder<ToDoWidget, ToDoWidget, QAfterFilterCondition>
      containedObjectTypeStringIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'containedObjectTypeString',
        value: '',
      ));
    });
  }

  QueryBuilder<ToDoWidget, ToDoWidget, QAfterFilterCondition>
      containedObjectTypeStringIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'containedObjectTypeString',
        value: '',
      ));
    });
  }

  QueryBuilder<ToDoWidget, ToDoWidget, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ToDoWidget, ToDoWidget, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<ToDoWidget, ToDoWidget, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<ToDoWidget, ToDoWidget, QAfterFilterCondition> idBetween(
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

  QueryBuilder<ToDoWidget, ToDoWidget, QAfterFilterCondition> parentIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'parentId',
      ));
    });
  }

  QueryBuilder<ToDoWidget, ToDoWidget, QAfterFilterCondition>
      parentIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'parentId',
      ));
    });
  }

  QueryBuilder<ToDoWidget, ToDoWidget, QAfterFilterCondition> parentIdEqualTo(
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

  QueryBuilder<ToDoWidget, ToDoWidget, QAfterFilterCondition>
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

  QueryBuilder<ToDoWidget, ToDoWidget, QAfterFilterCondition> parentIdLessThan(
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

  QueryBuilder<ToDoWidget, ToDoWidget, QAfterFilterCondition> parentIdBetween(
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

  QueryBuilder<ToDoWidget, ToDoWidget, QAfterFilterCondition>
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

  QueryBuilder<ToDoWidget, ToDoWidget, QAfterFilterCondition> parentIdEndsWith(
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

  QueryBuilder<ToDoWidget, ToDoWidget, QAfterFilterCondition> parentIdContains(
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

  QueryBuilder<ToDoWidget, ToDoWidget, QAfterFilterCondition> parentIdMatches(
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

  QueryBuilder<ToDoWidget, ToDoWidget, QAfterFilterCondition>
      parentIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'parentId',
        value: '',
      ));
    });
  }

  QueryBuilder<ToDoWidget, ToDoWidget, QAfterFilterCondition>
      parentIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'parentId',
        value: '',
      ));
    });
  }

  QueryBuilder<ToDoWidget, ToDoWidget, QAfterFilterCondition>
      parentIndexIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'parentIndex',
      ));
    });
  }

  QueryBuilder<ToDoWidget, ToDoWidget, QAfterFilterCondition>
      parentIndexIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'parentIndex',
      ));
    });
  }

  QueryBuilder<ToDoWidget, ToDoWidget, QAfterFilterCondition>
      parentIndexEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'parentIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<ToDoWidget, ToDoWidget, QAfterFilterCondition>
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

  QueryBuilder<ToDoWidget, ToDoWidget, QAfterFilterCondition>
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

  QueryBuilder<ToDoWidget, ToDoWidget, QAfterFilterCondition>
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

  QueryBuilder<ToDoWidget, ToDoWidget, QAfterFilterCondition> toDoListIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'toDoListId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToDoWidget, ToDoWidget, QAfterFilterCondition>
      toDoListIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'toDoListId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToDoWidget, ToDoWidget, QAfterFilterCondition>
      toDoListIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'toDoListId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToDoWidget, ToDoWidget, QAfterFilterCondition> toDoListIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'toDoListId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToDoWidget, ToDoWidget, QAfterFilterCondition>
      toDoListIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'toDoListId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToDoWidget, ToDoWidget, QAfterFilterCondition>
      toDoListIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'toDoListId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToDoWidget, ToDoWidget, QAfterFilterCondition>
      toDoListIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'toDoListId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToDoWidget, ToDoWidget, QAfterFilterCondition> toDoListIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'toDoListId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToDoWidget, ToDoWidget, QAfterFilterCondition>
      toDoListIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'toDoListId',
        value: '',
      ));
    });
  }

  QueryBuilder<ToDoWidget, ToDoWidget, QAfterFilterCondition>
      toDoListIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'toDoListId',
        value: '',
      ));
    });
  }

  QueryBuilder<ToDoWidget, ToDoWidget, QAfterFilterCondition> widgetTypeEqualTo(
      ToDoWidgetType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'widgetType',
        value: value,
      ));
    });
  }

  QueryBuilder<ToDoWidget, ToDoWidget, QAfterFilterCondition>
      widgetTypeGreaterThan(
    ToDoWidgetType value, {
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

  QueryBuilder<ToDoWidget, ToDoWidget, QAfterFilterCondition>
      widgetTypeLessThan(
    ToDoWidgetType value, {
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

  QueryBuilder<ToDoWidget, ToDoWidget, QAfterFilterCondition> widgetTypeBetween(
    ToDoWidgetType lower,
    ToDoWidgetType upper, {
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

extension ToDoWidgetQueryObject
    on QueryBuilder<ToDoWidget, ToDoWidget, QFilterCondition> {}

extension ToDoWidgetQueryLinks
    on QueryBuilder<ToDoWidget, ToDoWidget, QFilterCondition> {}

extension ToDoWidgetQuerySortBy
    on QueryBuilder<ToDoWidget, ToDoWidget, QSortBy> {
  QueryBuilder<ToDoWidget, ToDoWidget, QAfterSortBy>
      sortByContainedObjectTypeString() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'containedObjectTypeString', Sort.asc);
    });
  }

  QueryBuilder<ToDoWidget, ToDoWidget, QAfterSortBy>
      sortByContainedObjectTypeStringDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'containedObjectTypeString', Sort.desc);
    });
  }

  QueryBuilder<ToDoWidget, ToDoWidget, QAfterSortBy> sortByParentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parentId', Sort.asc);
    });
  }

  QueryBuilder<ToDoWidget, ToDoWidget, QAfterSortBy> sortByParentIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parentId', Sort.desc);
    });
  }

  QueryBuilder<ToDoWidget, ToDoWidget, QAfterSortBy> sortByParentIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parentIndex', Sort.asc);
    });
  }

  QueryBuilder<ToDoWidget, ToDoWidget, QAfterSortBy> sortByParentIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parentIndex', Sort.desc);
    });
  }

  QueryBuilder<ToDoWidget, ToDoWidget, QAfterSortBy> sortByToDoListId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'toDoListId', Sort.asc);
    });
  }

  QueryBuilder<ToDoWidget, ToDoWidget, QAfterSortBy> sortByToDoListIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'toDoListId', Sort.desc);
    });
  }

  QueryBuilder<ToDoWidget, ToDoWidget, QAfterSortBy> sortByWidgetType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'widgetType', Sort.asc);
    });
  }

  QueryBuilder<ToDoWidget, ToDoWidget, QAfterSortBy> sortByWidgetTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'widgetType', Sort.desc);
    });
  }
}

extension ToDoWidgetQuerySortThenBy
    on QueryBuilder<ToDoWidget, ToDoWidget, QSortThenBy> {
  QueryBuilder<ToDoWidget, ToDoWidget, QAfterSortBy>
      thenByContainedObjectTypeString() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'containedObjectTypeString', Sort.asc);
    });
  }

  QueryBuilder<ToDoWidget, ToDoWidget, QAfterSortBy>
      thenByContainedObjectTypeStringDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'containedObjectTypeString', Sort.desc);
    });
  }

  QueryBuilder<ToDoWidget, ToDoWidget, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ToDoWidget, ToDoWidget, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ToDoWidget, ToDoWidget, QAfterSortBy> thenByParentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parentId', Sort.asc);
    });
  }

  QueryBuilder<ToDoWidget, ToDoWidget, QAfterSortBy> thenByParentIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parentId', Sort.desc);
    });
  }

  QueryBuilder<ToDoWidget, ToDoWidget, QAfterSortBy> thenByParentIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parentIndex', Sort.asc);
    });
  }

  QueryBuilder<ToDoWidget, ToDoWidget, QAfterSortBy> thenByParentIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parentIndex', Sort.desc);
    });
  }

  QueryBuilder<ToDoWidget, ToDoWidget, QAfterSortBy> thenByToDoListId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'toDoListId', Sort.asc);
    });
  }

  QueryBuilder<ToDoWidget, ToDoWidget, QAfterSortBy> thenByToDoListIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'toDoListId', Sort.desc);
    });
  }

  QueryBuilder<ToDoWidget, ToDoWidget, QAfterSortBy> thenByWidgetType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'widgetType', Sort.asc);
    });
  }

  QueryBuilder<ToDoWidget, ToDoWidget, QAfterSortBy> thenByWidgetTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'widgetType', Sort.desc);
    });
  }
}

extension ToDoWidgetQueryWhereDistinct
    on QueryBuilder<ToDoWidget, ToDoWidget, QDistinct> {
  QueryBuilder<ToDoWidget, ToDoWidget, QDistinct>
      distinctByContainedObjectTypeString({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'containedObjectTypeString',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ToDoWidget, ToDoWidget, QDistinct> distinctByParentId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'parentId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ToDoWidget, ToDoWidget, QDistinct> distinctByParentIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'parentIndex');
    });
  }

  QueryBuilder<ToDoWidget, ToDoWidget, QDistinct> distinctByToDoListId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'toDoListId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ToDoWidget, ToDoWidget, QDistinct> distinctByWidgetType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'widgetType');
    });
  }
}

extension ToDoWidgetQueryProperty
    on QueryBuilder<ToDoWidget, ToDoWidget, QQueryProperty> {
  QueryBuilder<ToDoWidget, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ToDoWidget, String, QQueryOperations>
      containedObjectTypeStringProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'containedObjectTypeString');
    });
  }

  QueryBuilder<ToDoWidget, String?, QQueryOperations> parentIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'parentId');
    });
  }

  QueryBuilder<ToDoWidget, int?, QQueryOperations> parentIndexProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'parentIndex');
    });
  }

  QueryBuilder<ToDoWidget, String, QQueryOperations> toDoListIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'toDoListId');
    });
  }

  QueryBuilder<ToDoWidget, ToDoWidgetType, QQueryOperations>
      widgetTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'widgetType');
    });
  }
}
