import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_n2/models/app_settings.dart';
import 'package:project_n2/models/wallet/wallet.dart';
import 'package:project_n2/widgets/actions/dialogs/transaction_dialog.dart';
import 'package:project_n2/widgets/settings_screen/dialogs/wallets_dialog.dart';

// final _walletsScaffoldKey = GlobalKey<ScaffoldState>();

class WalletsScreen extends ConsumerStatefulWidget {
  const WalletsScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _WalletsScreenState();
}

class _WalletsScreenState extends ConsumerState<WalletsScreen> {
  late final PageController _pageController =
      PageController(initialPage: ref.read(screenIndexProvider));

  @override
  Widget build(BuildContext context) {
    final isEditing = ref.watch(screenEditingProvider);
    final wallets = ref.watch(walletsProvider);
    return wallets.isNotEmpty
        ? PageView(
            controller: _pageController,
            onPageChanged: (value) {
              debugPrint('Current Page: $value');
              ref.read(screenIndexProvider.notifier).state = value;
            },
            children: [
              for (var i = 0; i < wallets.length; i++)
                Builder(builder: (context) {
                  final total = ref.watch(
                    totalOfWalletByIdProvider(walletId: wallets[i].id!),
                  );
                  return Column(
                    children: [
                      Card(
                        child: Column(
                          children: [
                            ListTile(
                              title: Text('ID: ${wallets[i].id}'),
                              subtitle: Text(wallets[i].name),
                              trailing: total.when(data: (total) {
                                return Text(total != null
                                    ? total.toStringAsFixed(2)
                                    : 'Calculations error');
                                //
                              }, error: (error, stacktrace) {
                                debugPrint(stacktrace.toString());
                                return Text(error.toString());
                              }, loading: () {
                                return const CircularProgressIndicator();
                                //
                              }),
                            ),
                          ],
                        ),
                      ),
                      const Text('Transactions'),
                      Expanded(
                        child: wallets[i].transactions!.isNotEmpty
                            ? SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    for (var y = 0;
                                        y < wallets[i].transactions!.length;
                                        y++)
                                      Builder(builder: (context) {
                                        final transaction =
                                            wallets[i].transactions![y];
                                        final amountToShow = (transaction
                                                        .amount ??
                                                    0)
                                                .isNegative
                                            ? '-${(transaction.amount ?? 0).abs()}'
                                            : '${transaction.amount}';
                                        return Row(
                                          children: [
                                            Expanded(
                                              child: Card(
                                                child: ListTile(
                                                  dense: true,
                                                  visualDensity:
                                                      VisualDensity.compact,
                                                  title: Text(
                                                    //
                                                    isEditing
                                                        ? 'ID: ${transaction.id}\nName: ${transaction.name}\nDescription: ${transaction.description}'
                                                        : transaction
                                                                    .description ==
                                                                null
                                                            ? transaction
                                                                    .name ??
                                                                'Undefined name'
                                                            : '${transaction.name}\n${transaction.description}',
                                                  ),
                                                  // : '${transaction.name ?? 'Undefined name'}${transaction.description != null ? '${transaction.description}' : ''}'),
                                                  // '${isEditing ? 'ID: ${transaction.id}\nName: ' : ''}${transaction.name ?? 'Undefined name'}'),
                                                  subtitle: Text(
                                                    //'ID: ${isEditing ? transaction.id : transaction.category}',
                                                    // '${isEditing ? 'ID: ${transaction.id}' : 'Category: ${transaction.category ?? 'None'}'}${transaction.transactionDate != null ? '\n${transaction.transactionDate}' : ''}'),
                                                    isEditing
                                                        ? 'Category: ${transaction.category}\nDate: ${transaction.date}'
                                                        : transaction.date ==
                                                                null
                                                            ? 'Category: ${transaction.category ?? 'None'}'
                                                            : 'Category: ${transaction.category ?? 'None'}\n${transaction.date}',
                                                  ),
                                                  // title: Text(
                                                  //     'ID: ${transaction.id}'),
                                                  // subtitle: Text(
                                                  //     transaction.name ??
                                                  //         'Undefined name'),
                                                  trailing: Text(
                                                    // '$amountToShow\n${transaction.transactionDate}',
                                                    amountToShow,
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            AnimatedCrossFade(
                                              key: ValueKey(
                                                  '${transaction.id}removeButton'),
                                              duration: const Duration(
                                                  milliseconds: 125),
                                              firstChild: IntrinsicHeight(
                                                child: Container(
                                                  padding: EdgeInsets.zero,
                                                  margin: const EdgeInsets.only(
                                                      right: 4.0),
                                                  child: Column(
                                                    children: [
                                                      ElevatedButton(
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          padding:
                                                              EdgeInsets.zero,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                              10,
                                                            ),
                                                          ),
                                                        ),
                                                        onPressed: () {
                                                          showDialog(
                                                            context: context,
                                                            builder: (BuildContext
                                                                    context) =>
                                                                TransactionDialog(
                                                              transaction:
                                                                  transaction,
                                                            ),
                                                          );
                                                        },
                                                        child: const Icon(
                                                          Icons.edit,
                                                        ),
                                                      ),
                                                      ElevatedButton(
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          padding:
                                                              EdgeInsets.zero,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                          ),
                                                          foregroundColor:
                                                              Colors.red,
                                                        ),
                                                        onPressed: () {
                                                          ref
                                                              .read(
                                                                  walletsProvider
                                                                      .notifier)
                                                              .deleteWalletTransaction(
                                                                  transaction);
                                                          // ref.read(dataManagerProvider).deleteToDoTask(
                                                          //     toDoLists[i].tasks[y], toDoLists[i].id!);
                                                        },
                                                        child: const Icon(
                                                          Icons.delete,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              secondChild:
                                                  const SizedBox.shrink(),
                                              crossFadeState: isEditing
                                                  ? CrossFadeState.showFirst
                                                  : CrossFadeState.showSecond,
                                            ),
                                          ],
                                        );
                                      }),
                                  ],
                                ),
                              )
                            : const Center(
                                child: Text(
                                  'No transaction added yet',
                                  textScaler: TextScaler.linear(1.25),
                                ),
                              ),
                      ),
                    ],
                  );
                }),
              // Positioned(
              //   right: 0,
              //   top: 0,
              //   child: Material(
              //     color: Colors.transparent,
              //     clipBehavior: Clip.antiAlias,
              //     shape: const RoundedRectangleBorder(
              //         borderRadius: BorderRadius.all(Radius.circular(20))),
              //     child: IconButton(
              //       onPressed: () {
              //         //
              //       },
              //       icon: const Icon(
              //         Icons.menu,
              //       ),
              //     ),
              //   ),
              // ),
            ],
          )
        : Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'No Wallets found',
                  textScaler: TextScaler.linear(1.25),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 32.0),
                  child: ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) =>
                            const WalletsDialog(),
                      );
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Wallets\nManagment',
                        textAlign: TextAlign.center,
                        textScaler: TextScaler.linear(1.5),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
