import 'package:flutter/material.dart';
import 'package:project_n2/models/wallet/wallet.dart';
import 'package:project_n2/models/wallet/wallet_widget.dart';
import 'package:project_n2/tools/enums/widget_types.dart';

class WalletWidgetBuilder extends StatelessWidget {
  final WalletWidget walletWidget;
  final Wallet wallet;

  const WalletWidgetBuilder({
    Key? key,
    required this.walletWidget,
    required this.wallet,
  }) : super(key: key);

  Widget _buildTotalWidget() {
    return Container(
      // decoration: const BoxDecoration(
      //   border: Border(
      //     bottom: BorderSide(color: Colors.grey),
      //   ),
      // ),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.only(top: 6.0),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Total',
                    ),
                  ],
                ),
              ),
              ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 48,
                ),
                title: Text(wallet.name),
                trailing: const Text('Subtitle'),
                visualDensity: VisualDensity.comfortable,
                // dense: true,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLastTransactionWidget() {
    return Card(
      key: ValueKey('${walletWidget.id}transactionWidget'),
      child: Padding(
        padding: const EdgeInsets.only(top: 6.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    'Latest transactions',
                  ),
                  Text(wallet.name),
                ],
              ),
            ),
            for (var currentTransaction in wallet.transactions.reversed.take(5))
              ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 32,
                ),
                title: Text(currentTransaction.name ?? 'Undefined name'),
                trailing: Text(
                  currentTransaction.amount ?? '0',
                ),
                visualDensity: VisualDensity.compact,
                dense: true,
              ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    switch (walletWidget.widgetType) {
      case WalletWidgetType.total:
        return _buildTotalWidget();
      case WalletWidgetType.lastTransaction:
        return _buildLastTransactionWidget();
      default:
        return Text(
            'Unknown wallet widget of type: ${walletWidget.containedObjectType}');
    }
  }
}
