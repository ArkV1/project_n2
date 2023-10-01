import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_n2/models/app_widget.dart';
import 'package:project_n2/models/wallet/wallet_widget.dart';
import 'package:project_n2/providers/providers.dart';

import 'package:project_n2/widgets/main_layout.dart';
import 'package:reorderables/reorderables.dart';

final _homeScaffoldKey = GlobalKey<ScaffoldState>();

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  late List<Widget> _widgets;

  // @override
  // void initState() {
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    ref.read(componentMapProvider);
    final dataManager = ref.watch(dataManagerProvider);
    final wallets = dataManager.wallets;
    final appWidgets = dataManager.appWidgets;
    final mainScreenWidgets = List<AppWidget>.from(
        appWidgets.where((widget) => widget.parentId == 'mainScreen'));
    mainScreenWidgets.sort((a, b) => a.parentIndex!.compareTo(b.parentIndex!));
    _widgets = List<Widget>.generate(mainScreenWidgets.length, (int index) {
      final appWidget = mainScreenWidgets[index];
      if (appWidget is WalletWidget) {
        final wallet =
            wallets.singleWhere((element) => element.id == appWidget.walletId);
        // ignore: avoid_unnecessary_containers
        return Container(
          // decoration: const BoxDecoration(
          //   border: Border(
          //     bottom: BorderSide(color: Colors.grey),
          //   ),
          // ),
          key: UniqueKey(),
          child: Card(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Text(wallet.name),
                ),
                const ListTile(
                  title: Text('Title'),
                  subtitle: Text('Subtitle'),
                ),
              ],
            ),
          ),
        );
      } else {
        return Text(
          key: UniqueKey(),
          'Unknown widget of type: ${appWidget.containedObjectType}',
        );
      }
    });

    void _onReorder(int oldIndex, int newIndex) {
      ref
          .read(dataManagerProvider)
          .reorderInParentList(oldIndex, newIndex, mainScreenWidgets);
    }

    return Center(
      child: _widgets.isNotEmpty
          ? ReorderableColumn(
              mainAxisAlignment: MainAxisAlignment.center,
              onReorder: _onReorder,
              children: _widgets,
            )
          // ? Column(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       //const Spacer(),
          //       for (final widget in mainScreenWidgets)
          //         () {
          //           if (widget is WalletWidget) {
          //             final wallet = wallets.singleWhere(
          //                 (element) => element.id == widget.walletId);
          //             // ignore: avoid_unnecessary_containers
          //             return Container(
          //               // decoration: const BoxDecoration(
          //               //   border: Border(
          //               //     bottom: BorderSide(color: Colors.grey),
          //               //   ),
          //               // ),

          //               child: Card(
          //                 child: Column(
          //                   children: [
          //                     Padding(
          //                       padding: const EdgeInsets.only(top: 4.0),
          //                       child: Text(wallet.name),
          //                     ),
          //                     const ListTile(
          //                       title: Text('Title'),
          //                       subtitle: Text('Subtitle'),
          //                     ),
          //                   ],
          //                 ),
          //               ),
          //             );
          //           }
          //           return Text(
          //               'Unknown widget of type: ${widget.containedObjectType}');
          //         }(),

          //       //const Spacer(),
          //     ],
          //   )
          : const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('No widgets chosen'),
              ],
            ),
    );
  }
}
