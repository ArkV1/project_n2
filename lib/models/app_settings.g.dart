// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_settings.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$themeManagerHash() => r'0a5e22978e2b63ad4487d87604c43f0c8881cd47';

/// See also [ThemeManager].
@ProviderFor(ThemeManager)
final themeManagerProvider =
    AsyncNotifierProvider<ThemeManager, CustomTheme>.internal(
  ThemeManager.new,
  name: r'themeManagerProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$themeManagerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ThemeManager = AsyncNotifier<CustomTheme>;
String _$screenEditingHash() => r'fb8e4d3e43d7e89562f79bcad9f746054ae4f5f6';

/// See also [ScreenEditing].
@ProviderFor(ScreenEditing)
final screenEditingProvider =
    AutoDisposeNotifierProvider<ScreenEditing, bool>.internal(
  ScreenEditing.new,
  name: r'screenEditingProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$screenEditingHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ScreenEditing = AutoDisposeNotifier<bool>;
String _$screenIndexHash() => r'bb664c9cd35af74ad222316ffeea0769b86baa8b';

/// See also [ScreenIndex].
@ProviderFor(ScreenIndex)
final screenIndexProvider =
    AutoDisposeNotifierProvider<ScreenIndex, int>.internal(
  ScreenIndex.new,
  name: r'screenIndexProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$screenIndexHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ScreenIndex = AutoDisposeNotifier<int>;
String _$componentMapHash() => r'72453fd5cf674cdf8d8989afc61f7ec14da3823a';

/// See also [ComponentMap].
@ProviderFor(ComponentMap)
final componentMapProvider =
    AsyncNotifierProvider<ComponentMap, Map<String, bool>>.internal(
  ComponentMap.new,
  name: r'componentMapProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$componentMapHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ComponentMap = AsyncNotifier<Map<String, bool>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
