import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_n2/providers/providers.dart';

import 'package:project_n2/widgets/main_layout.dart';

final _homeScaffoldKey = GlobalKey<ScaffoldState>();

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  // final List<Widget> _widgetOptions = <Widget>[
  //   const Text('Index 0: Empty', key: ValueKey(0)),
  //   const Text('Index 1: Menu', key: ValueKey(1)),
  //   const Text('Index 2: Empty', key: ValueKey(2)),
  // ];
  // int _selectedIndex = 0;

  // @override
  // void initState() {
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    final dataManager = ref.watch(dataManagerProvider);
    final wallets = dataManager.wallets;
    final appWidgets = dataManager.appWidgets;
    return Center(
      child: appWidgets.isNotEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //const Spacer(),
                for (var i = 0; i < wallets.length; i++)
                  if (appWidgets
                      .any((appWidget) => appWidget.id == wallets[i].id))
                    // ignore: avoid_unnecessary_containers
                    Container(
                      // decoration: const BoxDecoration(
                      //   border: Border(
                      //     bottom: BorderSide(color: Colors.grey),
                      //   ),
                      // ),
                      child: Card(
                        child: Column(
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
                    ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Add transaction[default wallet]'),
                ),
                //const Spacer(),
              ],
            )
          : const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('No widgets chosen'),
              ],
            ),
    );
  }
}
