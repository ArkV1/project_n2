// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetWalletCollection on Isar {
  IsarCollection<Wallet> get wallets => this.collection();
}

const WalletSchema = CollectionSchema(
  name: r'Wallet',
  id: 8666280453615945738,
  properties: {
    r'name': PropertySchema(
      id: 0,
      name: r'name',
      type: IsarType.string,
    )
  },
  estimateSize: _walletEstimateSize,
  serialize: _walletSerialize,
  deserialize: _walletDeserialize,
  deserializeProp: _walletDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'transactionsLink': LinkSchema(
      id: -5771620299575900868,
      name: r'transactionsLink',
      target: r'WalletTransaction',
      single: false,
    )
  },
  embeddedSchemas: {},
  getId: _walletGetId,
  getLinks: _walletGetLinks,
  attach: _walletAttach,
  version: '3.1.0',
);

int _walletEstimateSize(
  Wallet object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.name.length * 3;
  return bytesCount;
}

void _walletSerialize(
  Wallet object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.name);
}

Wallet _walletDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Wallet(
    id: id,
    name: reader.readString(offsets[0]),
  );
  return object;
}

P _walletDeserializeProp<P>(
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

Id _walletGetId(Wallet object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _walletGetLinks(Wallet object) {
  return [object.transactionsLink];
}

void _walletAttach(IsarCollection<dynamic> col, Id id, Wallet object) {
  object.transactionsLink.attach(
      col, col.isar.collection<WalletTransaction>(), r'transactionsLink', id);
}

extension WalletQueryWhereSort on QueryBuilder<Wallet, Wallet, QWhere> {
  QueryBuilder<Wallet, Wallet, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension WalletQueryWhere on QueryBuilder<Wallet, Wallet, QWhereClause> {
  QueryBuilder<Wallet, Wallet, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Wallet, Wallet, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterWhereClause> idBetween(
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

extension WalletQueryFilter on QueryBuilder<Wallet, Wallet, QFilterCondition> {
  QueryBuilder<Wallet, Wallet, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Wallet, Wallet, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Wallet, Wallet, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Wallet, Wallet, QAfterFilterCondition> nameEqualTo(
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

  QueryBuilder<Wallet, Wallet, QAfterFilterCondition> nameGreaterThan(
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

  QueryBuilder<Wallet, Wallet, QAfterFilterCondition> nameLessThan(
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

  QueryBuilder<Wallet, Wallet, QAfterFilterCondition> nameBetween(
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

  QueryBuilder<Wallet, Wallet, QAfterFilterCondition> nameStartsWith(
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

  QueryBuilder<Wallet, Wallet, QAfterFilterCondition> nameEndsWith(
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

  QueryBuilder<Wallet, Wallet, QAfterFilterCondition> nameContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterFilterCondition> nameMatches(
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

  QueryBuilder<Wallet, Wallet, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }
}

extension WalletQueryObject on QueryBuilder<Wallet, Wallet, QFilterCondition> {}

extension WalletQueryLinks on QueryBuilder<Wallet, Wallet, QFilterCondition> {
  QueryBuilder<Wallet, Wallet, QAfterFilterCondition> transactionsLink(
      FilterQuery<WalletTransaction> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'transactionsLink');
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterFilterCondition>
      transactionsLinkLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'transactionsLink', length, true, length, true);
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterFilterCondition>
      transactionsLinkIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'transactionsLink', 0, true, 0, true);
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterFilterCondition>
      transactionsLinkIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'transactionsLink', 0, false, 999999, true);
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterFilterCondition>
      transactionsLinkLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'transactionsLink', 0, true, length, include);
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterFilterCondition>
      transactionsLinkLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'transactionsLink', length, include, 999999, true);
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterFilterCondition>
      transactionsLinkLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'transactionsLink', lower, includeLower, upper, includeUpper);
    });
  }
}

extension WalletQuerySortBy on QueryBuilder<Wallet, Wallet, QSortBy> {
  QueryBuilder<Wallet, Wallet, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension WalletQuerySortThenBy on QueryBuilder<Wallet, Wallet, QSortThenBy> {
  QueryBuilder<Wallet, Wallet, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension WalletQueryWhereDistinct on QueryBuilder<Wallet, Wallet, QDistinct> {
  QueryBuilder<Wallet, Wallet, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }
}

extension WalletQueryProperty on QueryBuilder<Wallet, Wallet, QQueryProperty> {
  QueryBuilder<Wallet, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Wallet, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }
}

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$walletsHash() => r'2f7aac4189c3896426098bd7379e0649c22e8e39';

/// See also [Wallets].
@ProviderFor(Wallets)
final walletsProvider =
    AutoDisposeAsyncNotifierProvider<Wallets, List<Wallet>>.internal(
  Wallets.new,
  name: r'walletsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$walletsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Wallets = AutoDisposeAsyncNotifier<List<Wallet>>;
String _$walletByIdHash() => r'882c1d877e9590e190c05541445e39143ce9cfea';

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

abstract class _$WalletById extends BuildlessAutoDisposeAsyncNotifier<Wallet?> {
  late final int walletId;

  FutureOr<Wallet?> build({
    required int walletId,
  });
}

/// See also [WalletById].
@ProviderFor(WalletById)
const walletByIdProvider = WalletByIdFamily();

/// See also [WalletById].
class WalletByIdFamily extends Family<AsyncValue<Wallet?>> {
  /// See also [WalletById].
  const WalletByIdFamily();

  /// See also [WalletById].
  WalletByIdProvider call({
    required int walletId,
  }) {
    return WalletByIdProvider(
      walletId: walletId,
    );
  }

  @override
  WalletByIdProvider getProviderOverride(
    covariant WalletByIdProvider provider,
  ) {
    return call(
      walletId: provider.walletId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'walletByIdProvider';
}

/// See also [WalletById].
class WalletByIdProvider
    extends AutoDisposeAsyncNotifierProviderImpl<WalletById, Wallet?> {
  /// See also [WalletById].
  WalletByIdProvider({
    required int walletId,
  }) : this._internal(
          () => WalletById()..walletId = walletId,
          from: walletByIdProvider,
          name: r'walletByIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$walletByIdHash,
          dependencies: WalletByIdFamily._dependencies,
          allTransitiveDependencies:
              WalletByIdFamily._allTransitiveDependencies,
          walletId: walletId,
        );

  WalletByIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.walletId,
  }) : super.internal();

  final int walletId;

  @override
  FutureOr<Wallet?> runNotifierBuild(
    covariant WalletById notifier,
  ) {
    return notifier.build(
      walletId: walletId,
    );
  }

  @override
  Override overrideWith(WalletById Function() create) {
    return ProviderOverride(
      origin: this,
      override: WalletByIdProvider._internal(
        () => create()..walletId = walletId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        walletId: walletId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<WalletById, Wallet?> createElement() {
    return _WalletByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WalletByIdProvider && other.walletId == walletId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, walletId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin WalletByIdRef on AutoDisposeAsyncNotifierProviderRef<Wallet?> {
  /// The parameter `walletId` of this provider.
  int get walletId;
}

class _WalletByIdProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<WalletById, Wallet?>
    with WalletByIdRef {
  _WalletByIdProviderElement(super.provider);

  @override
  int get walletId => (origin as WalletByIdProvider).walletId;
}

String _$totalOfWalletByIdHash() => r'318d560b54ff694a2f1fdd9b41f0260a0e795603';

abstract class _$TotalOfWalletById
    extends BuildlessAutoDisposeAsyncNotifier<int?> {
  late final int walletId;

  FutureOr<int?> build({
    required int walletId,
  });
}

/// See also [TotalOfWalletById].
@ProviderFor(TotalOfWalletById)
const totalOfWalletByIdProvider = TotalOfWalletByIdFamily();

/// See also [TotalOfWalletById].
class TotalOfWalletByIdFamily extends Family<AsyncValue<int?>> {
  /// See also [TotalOfWalletById].
  const TotalOfWalletByIdFamily();

  /// See also [TotalOfWalletById].
  TotalOfWalletByIdProvider call({
    required int walletId,
  }) {
    return TotalOfWalletByIdProvider(
      walletId: walletId,
    );
  }

  @override
  TotalOfWalletByIdProvider getProviderOverride(
    covariant TotalOfWalletByIdProvider provider,
  ) {
    return call(
      walletId: provider.walletId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'totalOfWalletByIdProvider';
}

/// See also [TotalOfWalletById].
class TotalOfWalletByIdProvider
    extends AutoDisposeAsyncNotifierProviderImpl<TotalOfWalletById, int?> {
  /// See also [TotalOfWalletById].
  TotalOfWalletByIdProvider({
    required int walletId,
  }) : this._internal(
          () => TotalOfWalletById()..walletId = walletId,
          from: totalOfWalletByIdProvider,
          name: r'totalOfWalletByIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$totalOfWalletByIdHash,
          dependencies: TotalOfWalletByIdFamily._dependencies,
          allTransitiveDependencies:
              TotalOfWalletByIdFamily._allTransitiveDependencies,
          walletId: walletId,
        );

  TotalOfWalletByIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.walletId,
  }) : super.internal();

  final int walletId;

  @override
  FutureOr<int?> runNotifierBuild(
    covariant TotalOfWalletById notifier,
  ) {
    return notifier.build(
      walletId: walletId,
    );
  }

  @override
  Override overrideWith(TotalOfWalletById Function() create) {
    return ProviderOverride(
      origin: this,
      override: TotalOfWalletByIdProvider._internal(
        () => create()..walletId = walletId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        walletId: walletId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<TotalOfWalletById, int?>
      createElement() {
    return _TotalOfWalletByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TotalOfWalletByIdProvider && other.walletId == walletId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, walletId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TotalOfWalletByIdRef on AutoDisposeAsyncNotifierProviderRef<int?> {
  /// The parameter `walletId` of this provider.
  int get walletId;
}

class _TotalOfWalletByIdProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<TotalOfWalletById, int?>
    with TotalOfWalletByIdRef {
  _TotalOfWalletByIdProviderElement(super.provider);

  @override
  int get walletId => (origin as TotalOfWalletByIdProvider).walletId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
