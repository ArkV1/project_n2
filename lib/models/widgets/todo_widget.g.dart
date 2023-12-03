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
    r'toDoListId': PropertySchema(
      id: 0,
      name: r'toDoListId',
      type: IsarType.long,
    ),
    r'widgetType': PropertySchema(
      id: 1,
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
  links: {
    r'appWidget': LinkSchema(
      id: -8542341171172077246,
      name: r'appWidget',
      target: r'AppWidget',
      single: true,
      linkName: r'toDoWidgetLink',
    )
  },
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
  return bytesCount;
}

void _toDoWidgetSerialize(
  ToDoWidget object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.toDoListId);
  writer.writeByte(offsets[1], object.widgetType.index);
}

ToDoWidget _toDoWidgetDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ToDoWidget(
    id: id,
    toDoListId: reader.readLong(offsets[0]),
    widgetType:
        _ToDoWidgetwidgetTypeValueEnumMap[reader.readByteOrNull(offsets[1])] ??
            ToDoWidgetType.classic,
  );
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
      return (reader.readLong(offset)) as P;
    case 1:
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
  return [object.appWidget];
}

void _toDoWidgetAttach(IsarCollection<dynamic> col, Id id, ToDoWidget object) {
  object.appWidget
      .attach(col, col.isar.collection<AppWidget>(), r'appWidget', id);
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

  QueryBuilder<ToDoWidget, ToDoWidget, QAfterFilterCondition> toDoListIdEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'toDoListId',
        value: value,
      ));
    });
  }

  QueryBuilder<ToDoWidget, ToDoWidget, QAfterFilterCondition>
      toDoListIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'toDoListId',
        value: value,
      ));
    });
  }

  QueryBuilder<ToDoWidget, ToDoWidget, QAfterFilterCondition>
      toDoListIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'toDoListId',
        value: value,
      ));
    });
  }

  QueryBuilder<ToDoWidget, ToDoWidget, QAfterFilterCondition> toDoListIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'toDoListId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
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
    on QueryBuilder<ToDoWidget, ToDoWidget, QFilterCondition> {
  QueryBuilder<ToDoWidget, ToDoWidget, QAfterFilterCondition> appWidget(
      FilterQuery<AppWidget> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'appWidget');
    });
  }

  QueryBuilder<ToDoWidget, ToDoWidget, QAfterFilterCondition>
      appWidgetIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'appWidget', 0, true, 0, true);
    });
  }
}

extension ToDoWidgetQuerySortBy
    on QueryBuilder<ToDoWidget, ToDoWidget, QSortBy> {
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
  QueryBuilder<ToDoWidget, ToDoWidget, QDistinct> distinctByToDoListId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'toDoListId');
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

  QueryBuilder<ToDoWidget, int, QQueryOperations> toDoListIdProperty() {
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
