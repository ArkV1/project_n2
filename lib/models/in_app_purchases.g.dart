// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'in_app_purchases.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$productDetailsListHash() =>
    r'67d678bb89b7dfdbeccac27d09574bfa807415ec';

/// See also [productDetailsList].
@ProviderFor(productDetailsList)
final productDetailsListProvider =
    AutoDisposeFutureProvider<List<ProductDetails>>.internal(
  productDetailsList,
  name: r'productDetailsListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$productDetailsListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ProductDetailsListRef
    = AutoDisposeFutureProviderRef<List<ProductDetails>>;
String _$inAppPurchasesManagerHash() =>
    r'f06cebe48d9e0103564e9215d7cf8b042877dadc';

/// See also [InAppPurchasesManager].
@ProviderFor(InAppPurchasesManager)
final inAppPurchasesManagerProvider =
    NotifierProvider<InAppPurchasesManager, InAppPurchasesManager>.internal(
  InAppPurchasesManager.new,
  name: r'inAppPurchasesManagerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$inAppPurchasesManagerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$InAppPurchasesManager = Notifier<InAppPurchasesManager>;
String _$purchaseDetailsListHash() =>
    r'5ba970db8f1ed764b829551a5445d0030f8aaaad';

/// See also [PurchaseDetailsList].
@ProviderFor(PurchaseDetailsList)
final purchaseDetailsListProvider = AutoDisposeNotifierProvider<
    PurchaseDetailsList, List<PurchaseDetails>>.internal(
  PurchaseDetailsList.new,
  name: r'purchaseDetailsListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$purchaseDetailsListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PurchaseDetailsList = AutoDisposeNotifier<List<PurchaseDetails>>;
String _$activeProductEntryHash() =>
    r'3b4d255ae44e09d03285f5f9a2bc1fa538f19a26';

/// See also [ActiveProductEntry].
@ProviderFor(ActiveProductEntry)
final activeProductEntryProvider = AutoDisposeNotifierProvider<
    ActiveProductEntry, Map<String, dynamic>?>.internal(
  ActiveProductEntry.new,
  name: r'activeProductEntryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$activeProductEntryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ActiveProductEntry = AutoDisposeNotifier<Map<String, dynamic>?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
