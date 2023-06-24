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

///////////////////////////////////////////////////////////////////////////////

const newQuestiondUUID = 'new_question-9d7d8b89-a3d0-4a2f-bdae-f591aae0115f';
const newAnswerUUID = 'new_answer-5a5574f4-99f6-4dcd-b359-1d95f349d9b5';
const newResultUUID = 'new_result-dc817ecd-1079-4890-8ff3-22c9fd4b6165';

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

// THEMES

// OBSOLETE - TO REMOVED
// const List<String> backgroundsList = <String>[
//   'V3 - 02 Juicy',
//   'V3 - 01 Moderate',
//   'V3 - Ripples',
//   'V3 - Questions',
//   'V2 - Casino',
//   'V1 - Colorful',
//   'V1 - Colorful(Black)',
// ];

// const Map<String, List<String>> backgroundsMap = {
//   'V3 - 02 Juicy': [
//     'assets/images/backgrounds/v3/07_juicy_light.jpg',
//     'assets/images/backgrounds/v3/08_juicy_dark.jpg',
//   ],
//   'V3 - 01 Moderate': [
//     'assets/images/backgrounds/v3/05_moderate_light.jpg',
//     'assets/images/backgrounds/v3/06_moderate_dark.jpg',
//   ],
//   'V3 - Ripples': [
//     'assets/images/backgrounds/v3/03_abstract_light.jpg',
//     'assets/images/backgrounds/v3/04_abstract_dark.jpg',
//   ],
//   'V3 - Questions': [
//     'assets/images/backgrounds/v3/01_question_marks_light.jpg',
//     'assets/images/backgrounds/v3/02_question_marks_dark.jpg'
//   ],
//   'V2 - Casino': [
//     'assets/images/backgrounds/v2/light.jpg',
//     'assets/images/backgrounds/v2/dark.jpg',
//   ],
//   'V1 - Colorful': [
//     'assets/images/backgrounds/v1/light.jpg',
//     'assets/images/backgrounds/v1/v3_grey.jpg',
//   ],
//   'V1 - Colorful(Black)': [
//     'assets/images/backgrounds/v1/light.jpg',
//     'assets/images/backgrounds/v1/dark.jpg',
//   ],
// };

const List<String> themeList = <String>[
  'System Default',
  'Light',
  'Dark',
  'Black (OLED)',
];

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
