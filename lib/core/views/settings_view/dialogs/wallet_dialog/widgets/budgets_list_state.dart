import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:project_n2/features/wallet/models/wallet.dart';
import 'package:project_n2/features/wallet/models/wallet_budget.dart';
import 'package:project_n2/core/views/settings_view/dialogs/wallet_dialog/wallets_dialog.dart';

class BudgetsListView extends ConsumerStatefulWidget {
  final Wallet? wallet;
  final Function(WalletBudget?) onSaved;

  const BudgetsListView({required this.wallet, required this.onSaved, super.key});

  @override
  ConsumerState<BudgetsListView> createState() => _BudgetsListViewState();
}

class _BudgetsListViewState extends ConsumerState<BudgetsListView> {
  bool editMode = false;

  @override
  Widget build(BuildContext context) {
    final all = widget.wallet!.budgets;
    final budgets = all?.where((budget) => budget.amount != null && budget.amount != 0).toList();
    final categories = all?.where((budget) => budget.amount == null || budget.amount == 0).toList();
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (categories != null && categories.isNotEmpty)
            Column(
              children: [
                const Text(
                  'Categories',
                  textAlign: TextAlign.start,
                ),
                ReorderableListView.builder(
                  onReorder: ((oldIndex, newIndex) {
                    //
                  }),
                  shrinkWrap: true,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return AnimatedCrossFade(
                      key: ValueKey(categories[index].id),
                      crossFadeState:
                          editMode ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                      duration: const Duration(milliseconds: 300),
                      firstChild: ListTile(
                        key: ValueKey(categories[index].id),
                        // leading: Text(
                        //   currencies[index].flagEmoji ?? '',
                        //   style: const TextStyle(fontSize: 22),
                        // ),
                        title: Text(
                          categories[index].name,
                        ),
                        visualDensity: VisualDensity.compact,
                      ),
                      secondChild: ListTile(
                        contentPadding: const EdgeInsets.only(left: 12.0),
                        key: ValueKey(categories[index].id),
                        leading: const Icon(Icons.drag_handle),
                        title: Text(
                          categories[index].name,
                          overflow: TextOverflow.ellipsis,
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(left: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 1,
                                ),
                              ),
                              child: InkWell(
                                customBorder: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                onTap: () {
                                  widget.onSaved(categories[index]);
                                  ref
                                      .read(walletsDialogStateProvider.notifier)
                                      .setDialogState(WalletsDialogStates.budgetsCreation);
                                },
                                child: const Padding(
                                  padding: EdgeInsets.all(3),
                                  child: Icon(Icons.edit, size: 24),
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 1,
                                ),
                              ),
                              child: InkWell(
                                customBorder: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                onTap: () {},
                                child: const Padding(
                                  padding: EdgeInsets.all(3),
                                  child: Icon(color: Colors.red, Icons.delete_forever, size: 24),
                                ),
                              ),
                            ),
                          ],
                        ),
                        visualDensity: VisualDensity.compact,
                      ),
                    );
                  },
                ),
              ],
            ),
          if (categories != null && categories.isNotEmpty && budgets != null && budgets.isNotEmpty)
            const Divider(),
          if (budgets != null && budgets.isNotEmpty)
            Column(
              children: [
                const Text(
                  'Budgets',
                  textAlign: TextAlign.start,
                ),
                ReorderableListView.builder(
                  onReorder: ((oldIndex, newIndex) {
                    //
                  }),
                  shrinkWrap: true,
                  itemCount: budgets.length,
                  itemBuilder: (context, index) {
                    return AnimatedCrossFade(
                      key: ValueKey(budgets[index].id),
                      crossFadeState:
                          editMode ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                      duration: const Duration(milliseconds: 300),
                      firstChild: ListTile(
                        contentPadding: const EdgeInsets.symmetric(horizontal: 24.0),
                        key: ValueKey(budgets[index].id),
                        title: Text(
                          budgets[index].name,
                        ),
                        visualDensity: VisualDensity.compact,
                      ),
                      secondChild: ListTile(
                        contentPadding: const EdgeInsets.only(left: 12.0),
                        key: ValueKey(budgets[index].id),
                        leading: const Icon(Icons.drag_handle),
                        title: Text(
                          budgets[index].name,
                          overflow: TextOverflow.ellipsis,
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(left: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 1,
                                ),
                              ),
                              child: InkWell(
                                customBorder: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                onTap: () {
                                  widget.onSaved(budgets[index]);
                                  ref
                                      .read(walletsDialogStateProvider.notifier)
                                      .setDialogState(WalletsDialogStates.budgetsCreation);
                                  //
                                },
                                child: const Padding(
                                  padding: EdgeInsets.all(3),
                                  child: Icon(Icons.edit, size: 24),
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 1,
                                ),
                              ),
                              child: InkWell(
                                customBorder: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                onTap: () {
                                  //
                                },
                                child: const Padding(
                                  padding: EdgeInsets.all(3),
                                  child: Icon(color: Colors.red, Icons.delete_forever, size: 24),
                                ),
                              ),
                            ),
                          ],
                        ),
                        visualDensity: VisualDensity.compact,
                      ),
                    );
                  },
                ),
              ],
            ),
          Divider(
            color: Theme.of(context).dividerColor.withOpacity(0.3),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () => setState(() {
                    editMode = !editMode;
                  }),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FittedBox(child: Text(editMode ? 'Done' : 'Edit')),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Icon(editMode ? Icons.done : Icons.edit),
                      ),
                    ],
                  ),
                ),
              ),
              const VerticalDivider(),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    widget.onSaved(null);
                    ref
                        .read(walletsDialogStateProvider.notifier)
                        .setDialogState(WalletsDialogStates.budgetsCreation);
                  },
                  child: const FittedBox(
                    child: Row(
                      children: [
                        FittedBox(child: Text('Add')),
                        Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Icon(Icons.add_box_outlined),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(
                flex: 1,
              ),
              Expanded(
                flex: 3,
                child: ElevatedButton(
                  onPressed: () => ref
                      .read(walletsDialogStateProvider.notifier)
                      .setDialogState(WalletsDialogStates.walletsCreation),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Return'),
                      Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Icon(Icons.keyboard_return),
                      )
                    ],
                  ),
                ),
              ),
              const Spacer(
                flex: 1,
              ),
            ],
          )
        ],
      ),
    );
  }
}
