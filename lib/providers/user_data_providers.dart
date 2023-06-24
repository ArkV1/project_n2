import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_n2/models/user_data.dart';

final userDataProvider = ChangeNotifierProvider<UserData>((ref) => UserData());

final walletWidgetsProvider = StateProvider<Map<int, dynamic>>((ref) => {});
