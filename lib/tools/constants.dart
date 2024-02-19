// typedef Emoji = String?;

// const String _kConsumableId = 'consumable';
// const String _kUpgradeId = 'upgrade';
// const String _kSilverSubscriptionId = 'subscription_silver';
// const String _kGoldSubscriptionId = 'subscription_gold';

// const List<String> _kProductIds = <String>[
//   _kConsumableId,
//   _kUpgradeId,
//   _kSilverSubscriptionId,
//   _kGoldSubscriptionId,
// ];

import 'package:objectbox/objectbox.dart';
import 'package:project_n2/models/wallet/wallet.dart';
import 'package:project_n2/models/wallet/wallet_budget.dart';

///////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////

// const Set<String> productIds = <String>{
//   'sub.green',
//   'sub.supporter',
//   'sub.member',
//   'sub.creator',
//   'sub.premium'
// };

const Set<String> subscriptionIds = <String>{};

const Map<String, Map<String, dynamic>> productsMap = {
  // 'disable_ads': {
  //   'productId': 'none',
  //   'name': 'Disable ads',
  //   'title': '',
  //   'subtitle': 'Lifetime ads removal',
  //   'trailing': '',
  //   'color': 0xa6f44336,
  // },
};

///////////////////////////////////////////////////////////////////////////////

// WALLET

// APP SETTINGS

const List<Map<String, dynamic>> primaryColorList = [
  {'color': 'Green', 'num': 0xFF65A603},
  {'color': 'Bordo', 'num': 0xFF730217},
  {'color': 'Purple', 'num': 0xFF9C27B0},
  {'color': "kitty's purple", 'num': 0xFF6929F2},
  {'color': 'Dark blue', 'num': 0xFF333EC4},
  {'color': 'Grey', 'num': 0xFF8C8C8C},
  {'color': 'Dark grey', 'num': 0xFF737272},
  {'color': 'Bej', 'num': 0xFFE5D5C3},
];

const List<Map<String, dynamic>> secondaryColorList = [
  {'color': 'Orange', 'num': 0xFFD93D04},
  {'color': 'Bright orange', 'num': 0xFFF27405},
  {'color': 'Amber', 'num': 0xFFFFC107},
  {'color': 'Green', 'num': 0xFFB7F238},
  {'color': 'Blue', 'num': 0xFF139DF2},
  {'color': "kitty's purple", 'num': 0xFF9B72F2},
  {'color': 'Grey', 'num': 0xFFBFBDBA},
  {'color': 'Brownish Bej', 'num': 0xFFB7A08A},
];
