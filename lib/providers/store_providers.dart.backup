import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

import '../tools/constants.dart';

final activeProductEntryProvider = StateProvider<Map<String, dynamic>?>(
  (ref) => null,
);

final productDetailsProvider = FutureProvider<List<ProductDetails>>(
  (ref) async {
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
  },
);

final purchaseDetailsProvider = StateProvider<List<PurchaseDetails>>(
  (ref) => [],
);
