import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TransactionDialog extends ConsumerStatefulWidget {
  const TransactionDialog({super.key});

  @override
  ConsumerState<TransactionDialog> createState() => _TransactionDialogState();
}

class _TransactionDialogState extends ConsumerState<TransactionDialog> {
  @override
  Widget build(BuildContext context) {
    return const AlertDialog(
      title: Text('New transaction'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Transaction amount'),
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: '0.00',
            ),
          ),
        ],
      ),
    );
  }
}
