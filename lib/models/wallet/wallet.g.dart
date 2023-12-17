// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$walletsHash() => r'323529bc0cde1e5e9e1663ddba9d59e90a336303';

/// See also [Wallets].
@ProviderFor(Wallets)
final walletsProvider =
    AutoDisposeNotifierProvider<Wallets, List<Wallet>>.internal(
  Wallets.new,
  name: r'walletsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$walletsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Wallets = AutoDisposeNotifier<List<Wallet>>;
String _$walletByIdHash() => r'fa13484673ead4dd51836091450f30d0457ab9f9';

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

String _$totalOfWalletByIdHash() => r'b239e2314860b29a8d00fce0d9220e939ff536ff';

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
