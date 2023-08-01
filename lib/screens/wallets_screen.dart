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
      PageController(initialPage: ref.read(walletScreenIndexProvider));

  @override
  Widget build(BuildContext context) {
    final dataManager = ref.watch(dataManagerProvider);
    final wallets = dataManager.wallets;
    return Stack(
      children: [
        PageView(
          controller: _pageController,
          onPageChanged: (value) {
            ref.read(walletScreenIndexProvider.notifier).state = value;
          },
          children: [
            for (var i = 0; i < wallets.length; i++)
              Column(
                children: [
                  Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: Text(wallets[i].name),
                        ),
                        const ListTile(
                          title: Text('Title'),
                          subtitle: Text('Subtitle'),
                        ),
                      ],
                    ),
                  ),
                ],
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
    );
  }
}
