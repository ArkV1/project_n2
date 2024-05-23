// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_widget.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appWidgetsHash() => r'1b5bbdca441310625a81217604a2f3816a8167a3';

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
    r'dba6a37ff464a23360025484e87f8e49168a893b';

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
