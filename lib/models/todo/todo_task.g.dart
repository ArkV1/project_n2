// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_task.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetToDoTaskCollection on Isar {
  IsarCollection<ToDoTask> get toDoTasks => this.collection();
}

const ToDoTaskSchema = CollectionSchema(
  name: r'ToDoTask',
  id: -7280487183933606880,
  properties: {
    r'complete': PropertySchema(
      id: 0,
      name: r'complete',
      type: IsarType.bool,
    ),
    r'completionDate': PropertySchema(
      id: 1,
      name: r'completionDate',
      type: IsarType.dateTime,
    ),
    r'creationDate': PropertySchema(
      id: 2,
      name: r'creationDate',
      type: IsarType.dateTime,
    ),
    r'description': PropertySchema(
      id: 3,
      name: r'description',
      type: IsarType.string,
    ),
    r'isDaily': PropertySchema(
      id: 4,
      name: r'isDaily',
      type: IsarType.bool,
    ),
    r'parentIndex': PropertySchema(
      id: 5,
      name: r'parentIndex',
      type: IsarType.long,
    ),
    r'task': PropertySchema(
      id: 6,
      name: r'task',
      type: IsarType.string,
    ),
    r'toDoListId': PropertySchema(
      id: 7,
      name: r'toDoListId',
      type: IsarType.long,
    )
  },
  estimateSize: _toDoTaskEstimateSize,
  serialize: _toDoTaskSerialize,
  deserialize: _toDoTaskDeserialize,
  deserializeProp: _toDoTaskDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'toDoLists': LinkSchema(
      id: -1290415181195826982,
      name: r'toDoLists',
      target: r'ToDoList',
      single: false,
      linkName: r'tasksLink',
    )
  },
  embeddedSchemas: {},
  getId: _toDoTaskGetId,
  getLinks: _toDoTaskGetLinks,
  attach: _toDoTaskAttach,
  version: '3.1.0',
);

int _toDoTaskEstimateSize(
  ToDoTask object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.description;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.task;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _toDoTaskSerialize(
  ToDoTask object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.complete);
  writer.writeDateTime(offsets[1], object.completionDate);
  writer.writeDateTime(offsets[2], object.creationDate);
  writer.writeString(offsets[3], object.description);
  writer.writeBool(offsets[4], object.isDaily);
  writer.writeLong(offsets[5], object.parentIndex);
  writer.writeString(offsets[6], object.task);
  writer.writeLong(offsets[7], object.toDoListId);
}

ToDoTask _toDoTaskDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ToDoTask(
    complete: reader.readBool(offsets[0]),
    completionDate: reader.readDateTimeOrNull(offsets[1]),
    creationDate: reader.readDateTimeOrNull(offsets[2]),
    description: reader.readStringOrNull(offsets[3]),
    id: id,
    isDaily: reader.readBool(offsets[4]),
    parentIndex: reader.readLong(offsets[5]),
    task: reader.readStringOrNull(offsets[6]),
    toDoListId: reader.readLong(offsets[7]),
  );
  return object;
}

P _toDoTaskDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBool(offset)) as P;
    case 1:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 2:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readBool(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _toDoTaskGetId(ToDoTask object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _toDoTaskGetLinks(ToDoTask object) {
  return [object.toDoLists];
}

void _toDoTaskAttach(IsarCollection<dynamic> col, Id id, ToDoTask object) {
  object.toDoLists
      .attach(col, col.isar.collection<ToDoList>(), r'toDoLists', id);
}

extension ToDoTaskQueryWhereSort on QueryBuilder<ToDoTask, ToDoTask, QWhere> {
  QueryBuilder<ToDoTask, ToDoTask, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ToDoTaskQueryWhere on QueryBuilder<ToDoTask, ToDoTask, QWhereClause> {
  QueryBuilder<ToDoTask, ToDoTask, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ToDoTask, ToDoTask, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<ToDoTask, ToDoTask, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ToDoTask, ToDoTask, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ToDoTask, ToDoTask, QAfterWhereClause> idBetween(
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

extension ToDoTaskQueryFilter
    on QueryBuilder<ToDoTask, ToDoTask, QFilterCondition> {
  QueryBuilder<ToDoTask, ToDoTask, QAfterFilterCondition> completeEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'complete',
        value: value,
      ));
    });
  }

  QueryBuilder<ToDoTask, ToDoTask, QAfterFilterCondition>
      completionDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'completionDate',
      ));
    });
  }

  QueryBuilder<ToDoTask, ToDoTask, QAfterFilterCondition>
      completionDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'completionDate',
      ));
    });
  }

  QueryBuilder<ToDoTask, ToDoTask, QAfterFilterCondition> completionDateEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'completionDate',
        value: value,
      ));
    });
  }

  QueryBuilder<ToDoTask, ToDoTask, QAfterFilterCondition>
      completionDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'completionDate',
        value: value,
      ));
    });
  }

  QueryBuilder<ToDoTask, ToDoTask, QAfterFilterCondition>
      completionDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'completionDate',
        value: value,
      ));
    });
  }

  QueryBuilder<ToDoTask, ToDoTask, QAfterFilterCondition> completionDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'completionDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ToDoTask, ToDoTask, QAfterFilterCondition> creationDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'creationDate',
      ));
    });
  }

  QueryBuilder<ToDoTask, ToDoTask, QAfterFilterCondition>
      creationDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'creationDate',
      ));
    });
  }

  QueryBuilder<ToDoTask, ToDoTask, QAfterFilterCondition> creationDateEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'creationDate',
        value: value,
      ));
    });
  }

  QueryBuilder<ToDoTask, ToDoTask, QAfterFilterCondition>
      creationDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'creationDate',
        value: value,
      ));
    });
  }

  QueryBuilder<ToDoTask, ToDoTask, QAfterFilterCondition> creationDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'creationDate',
        value: value,
      ));
    });
  }

  QueryBuilder<ToDoTask, ToDoTask, QAfterFilterCondition> creationDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'creationDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ToDoTask, ToDoTask, QAfterFilterCondition> descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<ToDoTask, ToDoTask, QAfterFilterCondition>
      descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<ToDoTask, ToDoTask, QAfterFilterCondition> descriptionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToDoTask, ToDoTask, QAfterFilterCondition>
      descriptionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToDoTask, ToDoTask, QAfterFilterCondition> descriptionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToDoTask, ToDoTask, QAfterFilterCondition> descriptionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'description',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToDoTask, ToDoTask, QAfterFilterCondition> descriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToDoTask, ToDoTask, QAfterFilterCondition> descriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToDoTask, ToDoTask, QAfterFilterCondition> descriptionContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToDoTask, ToDoTask, QAfterFilterCondition> descriptionMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToDoTask, ToDoTask, QAfterFilterCondition> descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<ToDoTask, ToDoTask, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<ToDoTask, ToDoTask, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ToDoTask, ToDoTask, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<ToDoTask, ToDoTask, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<ToDoTask, ToDoTask, QAfterFilterCondition> idBetween(
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

  QueryBuilder<ToDoTask, ToDoTask, QAfterFilterCondition> isDailyEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isDaily',
        value: value,
      ));
    });
  }

  QueryBuilder<ToDoTask, ToDoTask, QAfterFilterCondition> parentIndexEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'parentIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<ToDoTask, ToDoTask, QAfterFilterCondition>
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

  QueryBuilder<ToDoTask, ToDoTask, QAfterFilterCondition> parentIndexLessThan(
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

  QueryBuilder<ToDoTask, ToDoTask, QAfterFilterCondition> parentIndexBetween(
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

  QueryBuilder<ToDoTask, ToDoTask, QAfterFilterCondition> taskIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'task',
      ));
    });
  }

  QueryBuilder<ToDoTask, ToDoTask, QAfterFilterCondition> taskIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'task',
      ));
    });
  }

  QueryBuilder<ToDoTask, ToDoTask, QAfterFilterCondition> taskEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'task',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToDoTask, ToDoTask, QAfterFilterCondition> taskGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'task',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToDoTask, ToDoTask, QAfterFilterCondition> taskLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'task',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToDoTask, ToDoTask, QAfterFilterCondition> taskBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'task',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToDoTask, ToDoTask, QAfterFilterCondition> taskStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'task',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToDoTask, ToDoTask, QAfterFilterCondition> taskEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'task',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToDoTask, ToDoTask, QAfterFilterCondition> taskContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'task',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToDoTask, ToDoTask, QAfterFilterCondition> taskMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'task',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToDoTask, ToDoTask, QAfterFilterCondition> taskIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'task',
        value: '',
      ));
    });
  }

  QueryBuilder<ToDoTask, ToDoTask, QAfterFilterCondition> taskIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'task',
        value: '',
      ));
    });
  }

  QueryBuilder<ToDoTask, ToDoTask, QAfterFilterCondition> toDoListIdEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'toDoListId',
        value: value,
      ));
    });
  }

  QueryBuilder<ToDoTask, ToDoTask, QAfterFilterCondition> toDoListIdGreaterThan(
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

  QueryBuilder<ToDoTask, ToDoTask, QAfterFilterCondition> toDoListIdLessThan(
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

  QueryBuilder<ToDoTask, ToDoTask, QAfterFilterCondition> toDoListIdBetween(
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
}

extension ToDoTaskQueryObject
    on QueryBuilder<ToDoTask, ToDoTask, QFilterCondition> {}

extension ToDoTaskQueryLinks
    on QueryBuilder<ToDoTask, ToDoTask, QFilterCondition> {
  QueryBuilder<ToDoTask, ToDoTask, QAfterFilterCondition> toDoLists(
      FilterQuery<ToDoList> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'toDoLists');
    });
  }

  QueryBuilder<ToDoTask, ToDoTask, QAfterFilterCondition>
      toDoListsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'toDoLists', length, true, length, true);
    });
  }

  QueryBuilder<ToDoTask, ToDoTask, QAfterFilterCondition> toDoListsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'toDoLists', 0, true, 0, true);
    });
  }

  QueryBuilder<ToDoTask, ToDoTask, QAfterFilterCondition>
      toDoListsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'toDoLists', 0, false, 999999, true);
    });
  }

  QueryBuilder<ToDoTask, ToDoTask, QAfterFilterCondition>
      toDoListsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'toDoLists', 0, true, length, include);
    });
  }

  QueryBuilder<ToDoTask, ToDoTask, QAfterFilterCondition>
      toDoListsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'toDoLists', length, include, 999999, true);
    });
  }

  QueryBuilder<ToDoTask, ToDoTask, QAfterFilterCondition>
      toDoListsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'toDoLists', lower, includeLower, upper, includeUpper);
    });
  }
}

extension ToDoTaskQuerySortBy on QueryBuilder<ToDoTask, ToDoTask, QSortBy> {
  QueryBuilder<ToDoTask, ToDoTask, QAfterSortBy> sortByComplete() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'complete', Sort.asc);
    });
  }

  QueryBuilder<ToDoTask, ToDoTask, QAfterSortBy> sortByCompleteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'complete', Sort.desc);
    });
  }

  QueryBuilder<ToDoTask, ToDoTask, QAfterSortBy> sortByCompletionDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completionDate', Sort.asc);
    });
  }

  QueryBuilder<ToDoTask, ToDoTask, QAfterSortBy> sortByCompletionDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completionDate', Sort.desc);
    });
  }

  QueryBuilder<ToDoTask, ToDoTask, QAfterSortBy> sortByCreationDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'creationDate', Sort.asc);
    });
  }

  QueryBuilder<ToDoTask, ToDoTask, QAfterSortBy> sortByCreationDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'creationDate', Sort.desc);
    });
  }

  QueryBuilder<ToDoTask, ToDoTask, QAfterSortBy> sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<ToDoTask, ToDoTask, QAfterSortBy> sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<ToDoTask, ToDoTask, QAfterSortBy> sortByIsDaily() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDaily', Sort.asc);
    });
  }

  QueryBuilder<ToDoTask, ToDoTask, QAfterSortBy> sortByIsDailyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDaily', Sort.desc);
    });
  }

  QueryBuilder<ToDoTask, ToDoTask, QAfterSortBy> sortByParentIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parentIndex', Sort.asc);
    });
  }

  QueryBuilder<ToDoTask, ToDoTask, QAfterSortBy> sortByParentIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parentIndex', Sort.desc);
    });
  }

  QueryBuilder<ToDoTask, ToDoTask, QAfterSortBy> sortByTask() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'task', Sort.asc);
    });
  }

  QueryBuilder<ToDoTask, ToDoTask, QAfterSortBy> sortByTaskDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'task', Sort.desc);
    });
  }

  QueryBuilder<ToDoTask, ToDoTask, QAfterSortBy> sortByToDoListId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'toDoListId', Sort.asc);
    });
  }

  QueryBuilder<ToDoTask, ToDoTask, QAfterSortBy> sortByToDoListIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'toDoListId', Sort.desc);
    });
  }
}

extension ToDoTaskQuerySortThenBy
    on QueryBuilder<ToDoTask, ToDoTask, QSortThenBy> {
  QueryBuilder<ToDoTask, ToDoTask, QAfterSortBy> thenByComplete() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'complete', Sort.asc);
    });
  }

  QueryBuilder<ToDoTask, ToDoTask, QAfterSortBy> thenByCompleteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'complete', Sort.desc);
    });
  }

  QueryBuilder<ToDoTask, ToDoTask, QAfterSortBy> thenByCompletionDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completionDate', Sort.asc);
    });
  }

  QueryBuilder<ToDoTask, ToDoTask, QAfterSortBy> thenByCompletionDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completionDate', Sort.desc);
    });
  }

  QueryBuilder<ToDoTask, ToDoTask, QAfterSortBy> thenByCreationDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'creationDate', Sort.asc);
    });
  }

  QueryBuilder<ToDoTask, ToDoTask, QAfterSortBy> thenByCreationDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'creationDate', Sort.desc);
    });
  }

  QueryBuilder<ToDoTask, ToDoTask, QAfterSortBy> thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<ToDoTask, ToDoTask, QAfterSortBy> thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<ToDoTask, ToDoTask, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ToDoTask, ToDoTask, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ToDoTask, ToDoTask, QAfterSortBy> thenByIsDaily() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDaily', Sort.asc);
    });
  }

  QueryBuilder<ToDoTask, ToDoTask, QAfterSortBy> thenByIsDailyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDaily', Sort.desc);
    });
  }

  QueryBuilder<ToDoTask, ToDoTask, QAfterSortBy> thenByParentIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parentIndex', Sort.asc);
    });
  }

  QueryBuilder<ToDoTask, ToDoTask, QAfterSortBy> thenByParentIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parentIndex', Sort.desc);
    });
  }

  QueryBuilder<ToDoTask, ToDoTask, QAfterSortBy> thenByTask() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'task', Sort.asc);
    });
  }

  QueryBuilder<ToDoTask, ToDoTask, QAfterSortBy> thenByTaskDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'task', Sort.desc);
    });
  }

  QueryBuilder<ToDoTask, ToDoTask, QAfterSortBy> thenByToDoListId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'toDoListId', Sort.asc);
    });
  }

  QueryBuilder<ToDoTask, ToDoTask, QAfterSortBy> thenByToDoListIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'toDoListId', Sort.desc);
    });
  }
}

extension ToDoTaskQueryWhereDistinct
    on QueryBuilder<ToDoTask, ToDoTask, QDistinct> {
  QueryBuilder<ToDoTask, ToDoTask, QDistinct> distinctByComplete() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'complete');
    });
  }

  QueryBuilder<ToDoTask, ToDoTask, QDistinct> distinctByCompletionDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'completionDate');
    });
  }

  QueryBuilder<ToDoTask, ToDoTask, QDistinct> distinctByCreationDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'creationDate');
    });
  }

  QueryBuilder<ToDoTask, ToDoTask, QDistinct> distinctByDescription(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ToDoTask, ToDoTask, QDistinct> distinctByIsDaily() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isDaily');
    });
  }

  QueryBuilder<ToDoTask, ToDoTask, QDistinct> distinctByParentIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'parentIndex');
    });
  }

  QueryBuilder<ToDoTask, ToDoTask, QDistinct> distinctByTask(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'task', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ToDoTask, ToDoTask, QDistinct> distinctByToDoListId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'toDoListId');
    });
  }
}

extension ToDoTaskQueryProperty
    on QueryBuilder<ToDoTask, ToDoTask, QQueryProperty> {
  QueryBuilder<ToDoTask, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ToDoTask, bool, QQueryOperations> completeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'complete');
    });
  }

  QueryBuilder<ToDoTask, DateTime?, QQueryOperations> completionDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'completionDate');
    });
  }

  QueryBuilder<ToDoTask, DateTime?, QQueryOperations> creationDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'creationDate');
    });
  }

  QueryBuilder<ToDoTask, String?, QQueryOperations> descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<ToDoTask, bool, QQueryOperations> isDailyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isDaily');
    });
  }

  QueryBuilder<ToDoTask, int, QQueryOperations> parentIndexProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'parentIndex');
    });
  }

  QueryBuilder<ToDoTask, String?, QQueryOperations> taskProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'task');
    });
  }

  QueryBuilder<ToDoTask, int, QQueryOperations> toDoListIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'toDoListId');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ToDoTaskImpl _$$ToDoTaskImplFromJson(Map<String, dynamic> json) =>
    _$ToDoTaskImpl(
      id: json['id'] as int? ?? Isar.autoIncrement,
      toDoListId: json['toDoListId'] as int,
      parentIndex: json['parentIndex'] as int,
      task: json['task'] as String?,
      description: json['description'] as String?,
      isDaily: json['isDaily'] as bool? ?? false,
      complete: json['complete'] as bool? ?? false,
      creationDate: json['creationDate'] == null
          ? null
          : DateTime.parse(json['creationDate'] as String),
      completionDate: json['completionDate'] == null
          ? null
          : DateTime.parse(json['completionDate'] as String),
    );

Map<String, dynamic> _$$ToDoTaskImplToJson(_$ToDoTaskImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'toDoListId': instance.toDoListId,
      'parentIndex': instance.parentIndex,
      'task': instance.task,
      'description': instance.description,
      'isDaily': instance.isDaily,
      'complete': instance.complete,
      'creationDate': instance.creationDate?.toIso8601String(),
      'completionDate': instance.completionDate?.toIso8601String(),
    };
