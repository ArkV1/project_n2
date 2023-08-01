import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_n2/providers/providers.dart';

import 'package:project_n2/tools/enums/screens.dart';

import 'package:project_n2/screens/home_screen.dart';
import 'package:project_n2/screens/wallets_screen.dart';
import 'package:project_n2/widgets/actions/transaction_dialog.dart';

// final _mainLayoutScaffoldKey = GlobalKey<ScaffoldState>();

class MainLayout extends ConsumerStatefulWidget {
  // Widget child;
  // Widget navigationButton;
  //String title;
  //FloatingActionButton? floatingActionButton;

  const MainLayout({
    super.key,
    //required this.child, required this.navigationButton
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainLayoutState();
}

class _MainLayoutState extends ConsumerState<MainLayout> {
  @override
  Widget build(BuildContext context) {
    Screen currentScreen = ref.watch(currentScreenProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          currentScreen == Screen.home ? 'Home' : 'Wallets',
        ),
        actions: [
          Material(
            color: Colors.transparent,
            clipBehavior: Clip.antiAlias,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(14),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6.0),
              child: IconButton(
                onPressed: () {
                  //
                },
                icon: const Icon(
                  Icons.edit,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: [
            () {
              switch (currentScreen) {
                case Screen.wallets:
                  return const WalletsScreen();
                default:
                  return const HomeScreen();
              }
            }(),
            // Positioned(
            //   right: 5,
            //   top: 5,
            //   child: Material(
            //     color: Colors.transparent,
            //     clipBehavior: Clip.antiAlias,
            //     shape: const RoundedRectangleBorder(
            //       borderRadius: BorderRadius.all(
            //         Radius.circular(14),
            //       ),
            //     ),
            //     child: IconButton(
            //       onPressed: () {
            //         //
            //       },
            //       icon: const Icon(
            //         Icons.edit,
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
        //child: widget.child,
      ),
      endDrawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: Theme.of(context)
                        .colorScheme
                        .secondary
                        .withOpacity(0.80),
                  ),
                  child: const Text(
                    'Wallet',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Builder(builder: (context) {
                    return ListTile(
                      leading: const Icon(Icons.settings),
                      title: const Text('Settings'),
                      onTap: () {
                        Future.delayed(const Duration(milliseconds: 75), () {
                          Scaffold.of(context).closeEndDrawer();
                        });
                        Navigator.pushNamed(context, '/settings');
                      },
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
      persistentFooterAlignment: AlignmentDirectional.center,
      persistentFooterButtons: [
        ElevatedButton(
          onPressed: () => ref.read(currentScreenProvider.notifier).state =
              currentScreen == Screen.home ? Screen.wallets : Screen.home,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(currentScreen == Screen.home ? 'Wallets' : 'Home'),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Icon(
                    currentScreen == Screen.home ? Icons.wallet : Icons.home),
              ),
            ],
          ),
        ),
        Builder(builder: (context) {
          return ElevatedButton(
            onPressed: () => Scaffold.of(context).openEndDrawer(),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Menu'),
                Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: Icon(Icons.menu_open),
                ),
              ],
            ),
          );
        }),
      ],
      //bottomNavigationBar: ,
      // bottomNavigationBar: BottomNavigationBar(
      //   items: <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Container(),
      //       label: '',
      //     ),
      //     const BottomNavigationBarItem(
      //       icon: Icon(Icons.menu),
      //       label: 'Menu',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Container(),
      //       label: '',
      //     ),
      //   ],
      //   currentIndex: _selectedIndex,
      //   selectedItemColor:
      //       Theme.of(context).colorScheme.secondary.withOpacity(0.80),
      //   onTap: (int index) {
      //     if (index == 1) {
      //       _scaffoldKey.currentState!.openEndDrawer();
      //     }
      //     setState(() {
      //       _selectedIndex = index;
      //       debugPrint(_widgetOptions
      //           .elementAt(
      //             _selectedIndex,
      //           )
      //           .toString());
      //     });
      //   },
      // ),
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: ExpandableFab(
        child: const Icon(Icons.add),
        type: ExpandableFabType.up,
        distance: 60,
        children: [
          FloatingActionButton.extended(
            label: const Text('Add transaction [Default]'),
            heroTag: null,
            //child: const Icon(Icons.add),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const TransactionDialog();
                },
              ).then(
                (value) => setState(
                  () {},
                ),
              );
            },
          ),
          FloatingActionButton.extended(
            label: const Text('Add transaction'),
            heroTag: null,
            //child: const Icon(Icons.add),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const TransactionDialog();
                },
              ).then(
                (value) => setState(
                  () {},
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
