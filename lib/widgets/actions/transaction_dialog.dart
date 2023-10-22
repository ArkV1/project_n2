import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_n2/models/wallet/wallet_transaction.dart';
import 'package:project_n2/providers/providers.dart';

class TransactionDialog extends ConsumerStatefulWidget {
  const TransactionDialog({super.key});

  @override
  ConsumerState<TransactionDialog> createState() => _TransactionDialogState();
}

class _TransactionDialogState extends ConsumerState<TransactionDialog> {
  TextEditingController transactionNameController = TextEditingController();
  TextEditingController transactionAmountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final wallets = ref.watch(dataManagerProvider).wallets;
    return AlertDialog(
      title: const Text('New transaction'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              label: Text('Transaction name'),
              hintText: 'Groceries',
            ),
            controller: transactionNameController,
          ),
          TextField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              label: Text('Amount'),
              hintText: '10.00',
            ),
            controller: transactionAmountController,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: ElevatedButton(
              onPressed: () {
                final currentWallet = wallets[ref.read(screenIndexProvider)];
                // int latestId = 0;
                // try {
                //   latestId = int.parse(currentWallet.transactions.last.id!);
                // } on Exception catch (e) {
                //   // TODO
                // }
                // print(currentWallet.id!);
                ref.read(dataManagerProvider).insertWalletTransaction(
                      WalletTransaction(
                        walletId: currentWallet.id,
                        //
                        name: transactionNameController.text,
                        amount: transactionAmountController.text,
                      ),
                    );
                Navigator.pop(context);
              },
              child: const Text('Add'),
            ),
          ),
        ],
      ),
    );
  }
}
