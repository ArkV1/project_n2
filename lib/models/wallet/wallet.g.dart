// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$walletsHash() => r'd068f877245f3358cc774845e60ddbd72ca680cb';

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
String _$walletByIdHash() => r'02992af71f91bc8b7c0f40021d46d115dfc65cd7';

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

abstract class _$WalletById extends BuildlessAutoDisposeNotifier<Wallet?> {
  late final int? walletId;

  Wallet? build({
    required int? walletId,
  });
}

/// See also [WalletById].
@ProviderFor(WalletById)
const walletByIdProvider = WalletByIdFamily();

/// See also [WalletById].
class WalletByIdFamily extends Family<Wallet?> {
  /// See also [WalletById].
  const WalletByIdFamily();

  /// See also [WalletById].
  WalletByIdProvider call({
    required int? walletId,
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
    extends AutoDisposeNotifierProviderImpl<WalletById, Wallet?> {
  /// See also [WalletById].
  WalletByIdProvider({
    required int? walletId,
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

  final int? walletId;

  @override
  Wallet? runNotifierBuild(
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
  AutoDisposeNotifierProviderElement<WalletById, Wallet?> createElement() {
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

mixin WalletByIdRef on AutoDisposeNotifierProviderRef<Wallet?> {
  /// The parameter `walletId` of this provider.
  int? get walletId;
}

class _WalletByIdProviderElement
    extends AutoDisposeNotifierProviderElement<WalletById, Wallet?>
    with WalletByIdRef {
  _WalletByIdProviderElement(super.provider);

  @override
  int? get walletId => (origin as WalletByIdProvider).walletId;
}

String _$defaultWalletHash() => r'7f130d06a14e2803d2b069233fd7c538f743d1ee';

/// See also [DefaultWallet].
@ProviderFor(DefaultWallet)
final defaultWalletProvider =
    AutoDisposeNotifierProvider<DefaultWallet, Wallet?>.internal(
  DefaultWallet.new,
  name: r'defaultWalletProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$defaultWalletHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DefaultWallet = AutoDisposeNotifier<Wallet?>;
String _$totalOfWalletByIdHash() => r'a482ecf44873b0dc784cf22c3dba5d2e5046475f';

abstract class _$TotalOfWalletById
    extends BuildlessAutoDisposeAsyncNotifier<double?> {
  late final int walletId;

  FutureOr<double?> build({
    required int walletId,
  });
}

/// See also [TotalOfWalletById].
@ProviderFor(TotalOfWalletById)
const totalOfWalletByIdProvider = TotalOfWalletByIdFamily();

/// See also [TotalOfWalletById].
class TotalOfWalletByIdFamily extends Family<AsyncValue<double?>> {
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
    extends AutoDisposeAsyncNotifierProviderImpl<TotalOfWalletById, double?> {
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
  FutureOr<double?> runNotifierBuild(
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
  AutoDisposeAsyncNotifierProviderElement<TotalOfWalletById, double?>
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

mixin TotalOfWalletByIdRef on AutoDisposeAsyncNotifierProviderRef<double?> {
  /// The parameter `walletId` of this provider.
  int get walletId;
}

class _TotalOfWalletByIdProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<TotalOfWalletById, double?>
    with TotalOfWalletByIdRef {
  _TotalOfWalletByIdProviderElement(super.provider);

  @override
  int get walletId => (origin as TotalOfWalletByIdProvider).walletId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
