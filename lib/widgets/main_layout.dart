import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_n2/models/app_settings.dart';
import 'package:project_n2/screens/to_do_screen.dart';

import 'package:project_n2/tools/enums/settings.dart';

import 'package:project_n2/screens/home_screen.dart';
import 'package:project_n2/screens/wallets_screen.dart';
import 'package:project_n2/widgets/actions/todotask_dialog.dart';
import 'package:project_n2/widgets/actions/transaction_dialog.dart';
import 'package:project_n2/widgets/actions/widget_dialog.dart';

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
  final tabs = [
    const HomeScreen(),
    const WalletsScreen(),
    const ToDoScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final bool widgetEditing = ref.watch(screenEditingProvider);
    final Map<String, bool> componentsMap =
        ref.watch(componentMapProvider).valueOrNull ?? {};
    return DefaultTabController(
      length: tabs.length,
      initialIndex: 0,
      child: Builder(builder: (context) {
        bool canPop = false;
        return PopScope(
          canPop: canPop,
          onPopInvoked: (bool didPop) {
            final tabConroller = DefaultTabController.of(context);
            setState(() {
              {
                tabConroller.animateTo(Screen.home.index);
                canPop = false;
                return;
              }
            });
          },
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                Screen
                    .values[DefaultTabController.of(context).index].publicName,
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
                        ref.read(screenEditingProvider.notifier).state =
                            !widgetEditing;
                      },
                      icon: widgetEditing
                          ? const Icon(Icons.save)
                          : const Icon(Icons.edit),
                    ),
                  ),
                ),
              ],
            ),
            body: SafeArea(
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                children: tabs,
              ),
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
                          'Toolkit',
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
                    child: Builder(builder: (context) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          if (componentsMap[AppComponents.wallet.name] == true)
                            ListTile(
                              leading: const Icon(Icons.wallet),
                              title: const Text('Wallets'),
                              onTap: () {
                                setState(() {
                                  Scaffold.of(context).closeEndDrawer();
                                  DefaultTabController.of(context)
                                      .animateTo(Screen.wallets.index);
                                });
                              },
                            ),
                          if (componentsMap[AppComponents.todo.name] == true)
                            ListTile(
                              leading: const Icon(Icons.format_list_bulleted),
                              title: const Text('To Do Notes'),
                              onTap: () {
                                setState(() {
                                  Scaffold.of(context).closeEndDrawer();
                                  DefaultTabController.of(context)
                                      .animateTo(Screen.toDo.index);
                                });
                              },
                            ),
                          ListTile(
                            leading: const Icon(Icons.settings),
                            title: const Text('Settings'),
                            onTap: () {
                              Future.delayed(const Duration(milliseconds: 75),
                                  () {
                                Scaffold.of(context).closeEndDrawer();
                              });
                              Navigator.pushNamed(context, '/settings');
                            },
                          ),
                        ],
                      );
                    }),
                  ),
                ],
              ),
            ),
            persistentFooterAlignment: AlignmentDirectional.center,
            persistentFooterButtons: [
              // Builder(builder: (context) {
              //   final currentIndex = DefaultTabController.of(context).index;
              //   return ElevatedButton(
              //     onPressed: () {
              //       setState(() {
              //         currentIndex == Screen.wallets.index
              //             ? DefaultTabController.of(context)
              //                 .animateTo(Screen.home.index)
              //             : DefaultTabController.of(context)
              //                 .animateTo(Screen.wallets.index);
              //       });
              //     },
              //     child: Row(
              //       mainAxisSize: MainAxisSize.min,
              //       children: [
              //         Text(currentIndex == Screen.wallets.index
              //             ? 'Home'
              //             : 'Wallet'),
              //         Padding(
              //           padding: const EdgeInsets.only(left: 8),
              //           child: Icon(
              //             currentIndex == Screen.wallets.index
              //                 ? Icons.home
              //                 : Icons.wallet,
              //           ),
              //         ),
              //       ],
              //     ),
              //   );
              // }),
              // Builder(builder: (context) {
              //   final currentIndex = DefaultTabController.of(context).index;
              //   return ElevatedButton(
              //     onPressed: () {
              //       setState(() {
              //         currentIndex == Screen.toDo.index
              //             ? DefaultTabController.of(context)
              //                 .animateTo(Screen.home.index)
              //             : DefaultTabController.of(context)
              //                 .animateTo(Screen.toDo.index);
              //       });
              //     },
              //     child: Row(
              //       mainAxisSize: MainAxisSize.min,
              //       children: [
              //         Text(currentIndex == Screen.toDo.index ? 'Home' : 'To Do'),
              //         Padding(
              //           padding: const EdgeInsets.only(left: 8),
              //           child: Icon(
              //             currentIndex == Screen.toDo.index
              //                 ? Icons.home
              //                 : Icons.format_list_bulleted,
              //           ),
              //         ),
              //       ],
              //     ),
              //   );
              // }),
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
            floatingActionButton: Builder(builder: (context) {
              final currentIndex = DefaultTabController.of(context).index;
              return ExpandableFab(
                pos: ExpandableFabPos.right,
                type: ExpandableFabType.up,
                distance: 65,
                openButtonBuilder: RotateFloatingActionButtonBuilder(
                  child: const Icon(Icons.add),
                  fabSize: ExpandableFabSize.regular,
                ),
                closeButtonBuilder: DefaultFloatingActionButtonBuilder(
                  child: const Icon(Icons.close),
                  fabSize: ExpandableFabSize.small,
                ),
                children: [
                  // if (currentIndex == Screen.home.index)
                  //   FloatingActionButton.extended(
                  //     label: const Text('Add to do task [Default]'),
                  //     heroTag: null,
                  //     //child: const Icon(Icons.add),
                  //     onPressed: () {
                  //       addToDoTaskToDefaultToDoList();
                  //     },
                  //   ),
                  if (widgetEditing == false &&
                      (currentIndex == Screen.home.index ||
                          currentIndex == Screen.toDo.index) &&
                      componentsMap[AppComponents.todo.name] == true)
                    FloatingActionButton.extended(
                      label: const Text('Add to do task'),
                      heroTag: null,
                      onPressed: () {
                        addToDoTask();
                      },
                    ),
                  // if (currentIndex == Screen.home.index)
                  //   FloatingActionButton.extended(
                  //     label: const Text('Add transaction [Default]'),
                  //     heroTag: null,
                  //     //child: const Icon(Icons.add),
                  //     onPressed: () {
                  //       addTransactionToDefaultWallet();
                  //     },
                  //   ),
                  if (widgetEditing == false &&
                      (currentIndex == Screen.home.index ||
                          currentIndex == Screen.wallets.index) &&
                      componentsMap[AppComponents.wallet.name] == true)
                    FloatingActionButton.extended(
                      label: const Text('Add transaction'),
                      heroTag: null,
                      //child: const Icon(Icons.add),
                      onPressed: () {
                        addTransaction();
                      },
                    ),
                  if (widgetEditing == true)
                    FloatingActionButton.extended(
                      label: const Text('Add widget'),
                      heroTag: null,
                      icon: const Icon(Icons.widgets),
                      //child: const Icon(Icons.add),
                      onPressed: () {
                        addWidget(currentIndex);
                      },
                    ),
                ],
              );
            }),
          ),
        );
      }),
    );
  }

  void addWidget(currentScreenIndex) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AppWidgetDialog(currentScreenIndex);
        }).then((value) => setState(() {}));
  }

  // WALLET FAB BUTTON EVENTS
  void addTransaction() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return const TransactionDialog();
        }).then((value) => setState(() {}));
  }

  // void addTransactionToDefaultWallet() {
  //   showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return const TransactionDialog();
  //       }).then((value) => setState(() {}));
  // }

  // TO DO FAB BUTTON EVENTS
  void addToDoTask() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return const ToDoTaskDialog();
        }).then((value) => setState(() {}));
  }

  // void addToDoTaskToDefaultToDoList() {
  //   showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return const ToDoTaskDialog();
  //       }).then((value) => setState(() {}));
  // }
}
