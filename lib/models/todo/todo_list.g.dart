// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_list.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetToDoListCollection on Isar {
  IsarCollection<ToDoList> get toDoLists => this.collection();
}

const ToDoListSchema = CollectionSchema(
  name: r'ToDoList',
  id: -248905148726075837,
  properties: {
    r'name': PropertySchema(
      id: 0,
      name: r'name',
      type: IsarType.string,
    )
  },
  estimateSize: _toDoListEstimateSize,
  serialize: _toDoListSerialize,
  deserialize: _toDoListDeserialize,
  deserializeProp: _toDoListDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'tasksLink': LinkSchema(
      id: 3891662434384016490,
      name: r'tasksLink',
      target: r'ToDoTask',
      single: false,
    )
  },
  embeddedSchemas: {},
  getId: _toDoListGetId,
  getLinks: _toDoListGetLinks,
  attach: _toDoListAttach,
  version: '3.1.0',
);

int _toDoListEstimateSize(
  ToDoList object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.name.length * 3;
  return bytesCount;
}

void _toDoListSerialize(
  ToDoList object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.name);
}

ToDoList _toDoListDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ToDoList(
    id: id,
    name: reader.readString(offsets[0]),
  );
  return object;
}

P _toDoListDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _toDoListGetId(ToDoList object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _toDoListGetLinks(ToDoList object) {
  return [object.tasksLink];
}

void _toDoListAttach(IsarCollection<dynamic> col, Id id, ToDoList object) {
  object.tasksLink
      .attach(col, col.isar.collection<ToDoTask>(), r'tasksLink', id);
}

extension ToDoListQueryWhereSort on QueryBuilder<ToDoList, ToDoList, QWhere> {
  QueryBuilder<ToDoList, ToDoList, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ToDoListQueryWhere on QueryBuilder<ToDoList, ToDoList, QWhereClause> {
  QueryBuilder<ToDoList, ToDoList, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ToDoList, ToDoList, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<ToDoList, ToDoList, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ToDoList, ToDoList, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ToDoList, ToDoList, QAfterWhereClause> idBetween(
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

extension ToDoListQueryFilter
    on QueryBuilder<ToDoList, ToDoList, QFilterCondition> {
  QueryBuilder<ToDoList, ToDoList, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ToDoList, ToDoList, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<ToDoList, ToDoList, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<ToDoList, ToDoList, QAfterFilterCondition> idBetween(
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

  QueryBuilder<ToDoList, ToDoList, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToDoList, ToDoList, QAfterFilterCondition> nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToDoList, ToDoList, QAfterFilterCondition> nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToDoList, ToDoList, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToDoList, ToDoList, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToDoList, ToDoList, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToDoList, ToDoList, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToDoList, ToDoList, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToDoList, ToDoList, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<ToDoList, ToDoList, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }
}

extension ToDoListQueryObject
    on QueryBuilder<ToDoList, ToDoList, QFilterCondition> {}

extension ToDoListQueryLinks
    on QueryBuilder<ToDoList, ToDoList, QFilterCondition> {
  QueryBuilder<ToDoList, ToDoList, QAfterFilterCondition> tasksLink(
      FilterQuery<ToDoTask> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'tasksLink');
    });
  }

  QueryBuilder<ToDoList, ToDoList, QAfterFilterCondition>
      tasksLinkLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'tasksLink', length, true, length, true);
    });
  }

  QueryBuilder<ToDoList, ToDoList, QAfterFilterCondition> tasksLinkIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'tasksLink', 0, true, 0, true);
    });
  }

  QueryBuilder<ToDoList, ToDoList, QAfterFilterCondition>
      tasksLinkIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'tasksLink', 0, false, 999999, true);
    });
  }

  QueryBuilder<ToDoList, ToDoList, QAfterFilterCondition>
      tasksLinkLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'tasksLink', 0, true, length, include);
    });
  }

  QueryBuilder<ToDoList, ToDoList, QAfterFilterCondition>
      tasksLinkLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'tasksLink', length, include, 999999, true);
    });
  }

  QueryBuilder<ToDoList, ToDoList, QAfterFilterCondition>
      tasksLinkLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'tasksLink', lower, includeLower, upper, includeUpper);
    });
  }
}

extension ToDoListQuerySortBy on QueryBuilder<ToDoList, ToDoList, QSortBy> {
  QueryBuilder<ToDoList, ToDoList, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<ToDoList, ToDoList, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension ToDoListQuerySortThenBy
    on QueryBuilder<ToDoList, ToDoList, QSortThenBy> {
  QueryBuilder<ToDoList, ToDoList, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ToDoList, ToDoList, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ToDoList, ToDoList, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<ToDoList, ToDoList, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension ToDoListQueryWhereDistinct
    on QueryBuilder<ToDoList, ToDoList, QDistinct> {
  QueryBuilder<ToDoList, ToDoList, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }
}

extension ToDoListQueryProperty
    on QueryBuilder<ToDoList, ToDoList, QQueryProperty> {
  QueryBuilder<ToDoList, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ToDoList, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ToDoListImpl _$$ToDoListImplFromJson(Map<String, dynamic> json) =>
    _$ToDoListImpl(
      id: json['id'] as int? ?? Isar.autoIncrement,
      name: json['name'] as String,
    );

Map<String, dynamic> _$$ToDoListImplToJson(_$ToDoListImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$toDoListsHash() => r'9d1a91518865cf5e558b70e521705e4ecf54672e';

/// See also [ToDoLists].
@ProviderFor(ToDoLists)
final toDoListsProvider =
    AutoDisposeAsyncNotifierProvider<ToDoLists, List<ToDoList>>.internal(
  ToDoLists.new,
  name: r'toDoListsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$toDoListsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ToDoLists = AutoDisposeAsyncNotifier<List<ToDoList>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
