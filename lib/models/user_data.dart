import 'package:flutter/material.dart';

import 'wallet/wallet.dart';

class UserData extends ChangeNotifier {
  List<Wallet> wallets = [];

  UserData();

  addWallet(Wallet wallet) {
    wallets.add(wallet);
    notifyListeners();
  }

  removeWallet(Wallet wallet) {
    wallets.remove(wallet);
    notifyListeners();
  }
}
