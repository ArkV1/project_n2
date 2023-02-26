import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/expense_manager/wallet.dart';

class WalletListTile extends StatelessWidget {
  const WalletListTile({super.key});

  @override
  Widget build(BuildContext context) {
    Wallet wallet = Provider.of<Wallet>(context);
    return ListTile(
      title: Text('Content'),
      leading: Text('${wallet.walletName}'),
      trailing: Text('Total: ${wallet.defaultCurrency}'),
    );
  }
}
