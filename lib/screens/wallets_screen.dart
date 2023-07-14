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
  @override
  Widget build(BuildContext context) {
    final dataManager = ref.watch(dataManagerProvider);
    final wallets = dataManager.wallets;
    return PageView(
      children: [
        for (var i = 0; i < wallets.length; i++)
          Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
    );
  }
}
