import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_n2/providers/providers.dart';

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
    final dataManager = ref.watch(dataManagerProvider);
    final wallets = dataManager.wallets;
    return Stack(
      children: [
        PageView(
          controller: _pageController,
          onPageChanged: (value) {
            print('Current Page: $value');
            ref.read(screenIndexProvider.notifier).state = value;
          },
          children: [
            for (var i = 0; i < wallets.length; i++)
              SingleChildScrollView(
                child: Column(
                  children: [
                    Card(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListTile(
                            title: Text('ID: ${wallets[i].id!}'),
                            subtitle: Text(wallets[i].name),
                          ),
                        ],
                      ),
                    ),
                    const Text('Transactions'),
                    for (var y = 0; y < wallets[i].transactions.length; y++)
                      Row(
                        children: [
                          Expanded(
                            child: Card(
                              child: ListTile(
                                dense: true,
                                visualDensity: VisualDensity.compact,
                                title: Text(
                                    'ID: ${wallets[i].transactions[y].id!}'),
                                subtitle: Text(
                                    wallets[i].transactions[y].name ??
                                        'Undefined name'),
                                trailing: Text(
                                    wallets[i].transactions[y].amount ?? '0'),
                              ),
                            ),
                          ),
                          AnimatedCrossFade(
                            key: ValueKey(
                                '${wallets[i].transactions[y].id}removeButton'),
                            duration: const Duration(milliseconds: 125),
                            firstChild: IntrinsicHeight(
                              child: Container(
                                padding: EdgeInsets.zero,
                                margin: const EdgeInsets.only(right: 4.0),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    foregroundColor: Colors.red,
                                  ),
                                  onPressed: () {
                                    ref
                                        .read(dataManagerProvider)
                                        .deleteWalletTransaction(
                                            wallets[i].transactions[y]);
                                    // ref.read(dataManagerProvider).deleteToDoTask(
                                    //     toDoLists[i].tasks[y], toDoLists[i].id!);
                                  },
                                  child: const Icon(
                                    Icons.delete,
                                  ),
                                ),
                              ),
                            ),
                            secondChild: const SizedBox.shrink(),
                            crossFadeState: isEditing
                                ? CrossFadeState.showFirst
                                : CrossFadeState.showSecond,
                          ),
                        ],
                      ),
                  ],
                ),
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
      ],
    );
  }
}
