// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_settings.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$themeManagerHash() => r'c47390b0c70f03a381fb955b89c476b393788403';

/// See also [ThemeManager].
@ProviderFor(ThemeManager)
final themeManagerProvider =
    NotifierProvider<ThemeManager, CustomTheme>.internal(
  ThemeManager.new,
  name: r'themeManagerProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$themeManagerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ThemeManager = Notifier<CustomTheme>;
String _$reorderingStateHash() => r'd7ad9c0f5448b6852a0cb9d66fb7790de590397f';

/// See also [ReorderingState].
@ProviderFor(ReorderingState)
final reorderingStateProvider =
    AutoDisposeNotifierProvider<ReorderingState, ReorderingStates>.internal(
  ReorderingState.new,
  name: r'reorderingStateProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$reorderingStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ReorderingState = AutoDisposeNotifier<ReorderingStates>;
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
String _$widgetEditingHash() => r'fb260d894631630c6906d087b28312e4f588030a';

/// See also [WidgetEditing].
@ProviderFor(WidgetEditing)
final widgetEditingProvider =
    AutoDisposeNotifierProvider<WidgetEditing, bool>.internal(
  WidgetEditing.new,
  name: r'widgetEditingProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$widgetEditingHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$WidgetEditing = AutoDisposeNotifier<bool>;
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
String _$componentMapHash() => r'd4fb1a5c32c6706d1d6e0e605e8ed95f2041754e';

/// See also [ComponentMap].
@ProviderFor(ComponentMap)
final componentMapProvider =
    NotifierProvider<ComponentMap, Map<String, bool>>.internal(
  ComponentMap.new,
  name: r'componentMapProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$componentMapHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ComponentMap = Notifier<Map<String, bool>>;
String _$currentDirectoryHash() => r'2db803c3833782af5260198ec495d9ed95c73f62';

/// See also [CurrentDirectory].
@ProviderFor(CurrentDirectory)
final currentDirectoryProvider =
    AutoDisposeAsyncNotifierProvider<CurrentDirectory, Directory>.internal(
  CurrentDirectory.new,
  name: r'currentDirectoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentDirectoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CurrentDirectory = AutoDisposeAsyncNotifier<Directory>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
