import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:project_n2/tools/constants.dart';

part 'in_app_purchases.g.dart';

@Riverpod(keepAlive: true)
class InAppPurchasesManager extends _$InAppPurchasesManager {
  @override
  InAppPurchasesManager build() {
    return InAppPurchasesManager();
  }

  void _deliverProduct(PurchaseDetails purchaseDetails) async {
    switch (purchaseDetails.productID) {
      case 'productId':
        debugPrint('User bought productId');
        break;
      default:
        break;
    }
  }

  void listenToPurchaseUpdated(
      List<PurchaseDetails> purchaseDetailsList) async {
    for (var purchaseDetails in purchaseDetailsList) {
      if (purchaseDetails.status == PurchaseStatus.pending) {
        //_showPendingUI();
      } else {
        if (purchaseDetails.status == PurchaseStatus.error) {
          //_handleError(purchaseDetails.error!);
        } else if (purchaseDetails.status == PurchaseStatus.purchased ||
            purchaseDetails.status == PurchaseStatus.restored) {
          ref.read(purchaseDetailsListProvider).add(purchaseDetails);
          //bool valid = await _verifyPurchase(purchaseDetails);
          //if (valid) {
          _deliverProduct(purchaseDetails);
          //} else {
          //  _handleInvalidPurchase(purchaseDetails);
          //}
        }
        if (purchaseDetails.pendingCompletePurchase) {
          await InAppPurchase.instance.completePurchase(purchaseDetails);
        }
      }
    }
  }

  void initialize() async {
    StreamSubscription<List<PurchaseDetails>>? subscription;

    final inAppPurchases = InAppPurchase.instance;
    if (await inAppPurchases.isAvailable()) {
      final purchaseUpdated = inAppPurchases.purchaseStream;
      subscription = purchaseUpdated.listen((purchaseDetailsList) {
        listenToPurchaseUpdated(purchaseDetailsList);
      }, onDone: () {
        subscription!.cancel();
      }, onError: (error) {
        // handle error here.
      });
      await InAppPurchase.instance.restorePurchases();
    } else {
      ref.read(purchaseDetailsListProvider.notifier).empty();
    }
  }
}

@riverpod
class PurchaseDetailsList extends _$PurchaseDetailsList {
  @override
  List<PurchaseDetails> build() {
    return [];
  }

  void add(PurchaseDetails purchaseDetails) {
    state = [...state, purchaseDetails];
  }

  void empty() {
    state = [];
  }
}

@riverpod
FutureOr<List<ProductDetails>> productDetailsList(
    ProductDetailsListRef ref) async {
  final isAvailable = await InAppPurchase.instance.isAvailable();
  if (isAvailable) {
    // 'In-app billing API version 3 is not supported on this device'
    List<ProductDetails> productDetailsList = [];
    ProductDetailsResponse query =
        await InAppPurchase.instance.queryProductDetails(subscriptionIds);
    productDetailsList.addAll(query.productDetails);
    if (query.notFoundIDs.isNotEmpty) {
      query = await InAppPurchase.instance
          .queryProductDetails(query.notFoundIDs.toSet());
      productDetailsList.addAll(query.productDetails);
    }
    return productDetailsList;
  } else {
    throw Exception('In App Purchases are not available');
  }
}

@riverpod
class ActiveProductEntry extends _$ActiveProductEntry {
  @override
  Map<String, dynamic>? build() {
    return null;
  }

  void set(Map<String, dynamic>? productEntry) {
    state = productEntry;
  }
}
