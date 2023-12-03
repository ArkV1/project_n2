import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_n2/models/app_settings.dart';
import 'package:project_n2/models/wallet/wallet.dart';
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
    return ref.watch(walletsProvider).when(
          data: (wallets) {
            final isEditing = ref.watch(screenEditingProvider);
            return wallets.isNotEmpty
                ? PageView(
                    controller: _pageController,
                    onPageChanged: (value) {
                      debugPrint('Current Page: $value');
                      ref.read(screenIndexProvider.notifier).state = value;
                    },
                    children: [
                      for (var i = 0; i < wallets.length; i++)
                        Column(
                          children: [
                            Card(
                              child: Column(
                                children: [
                                  ListTile(
                                    title: Text('ID: ${wallets[i].id}'),
                                    subtitle: Text(wallets[i].name),
                                    trailing: FutureBuilder(
                                        future: ref
                                            .read(walletsProvider.notifier)
                                            .calculateTotal(wallets[i]),
                                        builder: (context, snapshot) {
                                          if (snapshot.connectionState ==
                                              ConnectionState.waiting) {
                                            return const CircularProgressIndicator();
                                          }
                                          return Text(
                                              '${snapshot.data ?? '0'}');
                                        }),
                                  ),
                                ],
                              ),
                            ),
                            const Text('Transactions'),
                            Expanded(
                              child: wallets[i].transactions.isNotEmpty
                                  ? SingleChildScrollView(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          for (var y = 0;
                                              y <
                                                  wallets[i]
                                                      .transactions
                                                      .length;
                                              y++)
                                            Builder(builder: (context) {
                                              final transaction =
                                                  wallets[i].transactions[y];
                                              final amountToShow = int.parse(
                                                          transaction.amount ??
                                                              '0')
                                                      .isNegative
                                                  ? '- ${int.parse(transaction.amount!).abs()}'
                                                  : '+ ${transaction.amount}';
                                              return Row(
                                                children: [
                                                  Expanded(
                                                    child: Card(
                                                      child: ListTile(
                                                        dense: true,
                                                        visualDensity:
                                                            VisualDensity
                                                                .compact,
                                                        title: Text(
                                                            'ID: ${transaction.id}'),
                                                        subtitle: Text(
                                                            transaction.name ??
                                                                'Undefined name'),
                                                        trailing:
                                                            Text(amountToShow),
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
                                                        padding:
                                                            EdgeInsets.zero,
                                                        margin: const EdgeInsets
                                                            .only(right: 4.0),
                                                        child: ElevatedButton(
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
                                                                .read(walletsProvider
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
                                                      ),
                                                    ),
                                                    secondChild:
                                                        const SizedBox.shrink(),
                                                    crossFadeState: isEditing
                                                        ? CrossFadeState
                                                            .showFirst
                                                        : CrossFadeState
                                                            .showSecond,
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
                        ),
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
          },
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          error: (error, stacktrace) {
            debugPrint('Error loading wallets: $stacktrace');
            return Center(
              child: Text(error.toString()),
            );
          },
        );
  }
}
