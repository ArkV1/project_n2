import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:project_n2/core/models/app_settings.dart';
import 'package:project_n2/core/router.dart';
import 'package:project_n2/core/models/app_components.dart';
import 'package:project_n2/core/views/settings_view/dialogs/wallet_dialog/wallets_dialog.dart';
import 'package:project_n2/features/todo/models/views/todo_view.dart';

import 'package:project_n2/tools/enums/settings.dart';

import 'package:project_n2/shared/fab/dialogs/todotask_dialog.dart';
import 'package:project_n2/shared/fab/dialogs/transaction_dialog.dart';
import 'package:project_n2/shared/fab/dialogs/widget_dialog.dart';

// final _mainLayoutScaffoldKey = GlobalKey<ScaffoldState>();

class MainLayout extends ConsumerStatefulWidget {
  final Widget child;

  const MainLayout({
    super.key,
    required this.child,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainLayoutState();
}

class _MainLayoutState extends ConsumerState<MainLayout> {
  final _key = GlobalKey<ExpandableFabState>();

  @override
  Widget build(BuildContext context) {
    final bool screenEditing = ref.watch(screenEditingProvider);
    final bool widgetEditing = ref.watch(widgetEditingProvider);
    final Map<String, bool> componentsMap = ref.watch(componentMapProvider);
    final drawer = Builder(builder: (context) {
      var currentRoutePath = GoRouter.of(context).location;
      return Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary.withOpacity(0.80),
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
                print(currentRoutePath);
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    for (var component in AppComponents.values)
                      if (componentsMap[component.name] == true)
                        ListTile(
                          leading: Icon(component.icon),
                          title: Text(component.publicName),
                          onTap: () {
                            setState(() {
                              Scaffold.of(context).closeEndDrawer();
                              if (currentRoutePath != Screens.home.path) {
                                context.pushReplacement(component.route);
                              } else {
                                context.push(component.route);
                              }
                            });
                          },
                        ),
                    ListTile(
                      leading: const Icon(Icons.settings),
                      title: Text(Screens.settings.publicName),
                      onTap: () {
                        Future.delayed(const Duration(milliseconds: 75), () {
                          Scaffold.of(context).closeEndDrawer();
                        });
                        context.push(Screens.settings.path);
                      },
                    ),
                  ],
                );
              }),
            ),
          ],
        ),
      );
    });

    final Widget bottomNavBar = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Builder(builder: (context) {
            //   final currentIndex = DefaultTabController.of(context).index;
            //   return ElevatedButton(
            //     onPressed: () {
            //       setState(() {
            //         currentIndex == Screens.wallets.index
            //             ? DefaultTabController.of(context)
            //                 .animateTo(Screens.home.index)
            //             : DefaultTabController.of(context)
            //                 .animateTo(Screens.wallets.index);
            //       });
            //     },
            //     child: Row(
            //       mainAxisSize: MainAxisSize.min,
            //       children: [
            //         Text(currentIndex == Screens.wallets.index ? 'Home' : 'Wallet'),
            //         Padding(
            //           padding: const EdgeInsets.only(left: 8),
            //           child: Icon(
            //             currentIndex == Screens.wallets.index
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
            //         currentIndex == Screens.toDo.index
            //             ? DefaultTabController.of(context)
            //                 .animateTo(Screens.home.index)
            //             : DefaultTabController.of(context)
            //                 .animateTo(Screens.toDo.index);
            //       });
            //     },
            //     child: Row(
            //       mainAxisSize: MainAxisSize.min,
            //       children: [
            //         Text(currentIndex == Screens.toDo.index ? 'Home' : 'To Do'),
            //         Padding(
            //           padding: const EdgeInsets.only(left: 8),
            //           child: Icon(
            //             currentIndex == Screens.toDo.index
            //                 ? Icons.home
            //                 : Icons.format_list_bulleted,
            //           ),
            //         ),
            //       ],
            //     ),
            //   );
            // }),
            Builder(builder: (context) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: ElevatedButton(
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
                ),
              );
            }),
          ],
        ),
      ],
    );

    return Builder(builder: (context) {
      var currentRoutePath = GoRouter.of(context).location;
      bool canPop = false;
      return PopScope(
        canPop: canPop,
        onPopInvoked: (bool didPop) {
          setState(() {
            // context.go('/home');
            canPop = false;
            return;
          });
        },
        child: Scaffold(
          appBar: AppBar(
            title: currentRoutePath != Screens.settings.path
                ? Text(
                    Screens.fromPath(currentRoutePath)?.publicName ?? '',
                  )
                : null,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: Row(
                  children: [
                    if (currentRoutePath != Screens.home.path)
                      Material(
                        color: Colors.transparent,
                        clipBehavior: Clip.antiAlias,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(14),
                          ),
                        ),
                        child: IconButton(
                          onPressed: () {
                            //
                            ref.read(screenEditingProvider.notifier).state = !screenEditing;
                            if (widgetEditing == true) {
                              ref.read(widgetEditingProvider.notifier).state = false;
                            }
                          },
                          icon: screenEditing ? const Icon(Icons.save) : const Icon(Icons.edit),
                        ),
                      ),
                    Material(
                      color: Colors.transparent,
                      clipBehavior: Clip.antiAlias,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(14),
                        ),
                      ),
                      child: IconButton(
                        onPressed: () {
                          // Either screen editing or widget editing is enabled at once
                          // Delay the animation if expandable fab needs closing
                          bool waitAnim = false;
                          //
                          if (!_key.currentState!.isOpen) {
                            _key.currentState!.toggle();
                          } else if (_key.currentState!.isOpen && widgetEditing == true) {
                            waitAnim = true;
                            _key.currentState!.toggle();
                          }
                          Future.delayed(Duration(milliseconds: waitAnim ? 250 : 0), () {
                            ref.read(widgetEditingProvider.notifier).state = !widgetEditing;
                            if (screenEditing == true) {
                              ref.read(screenEditingProvider.notifier).state = false;
                            }
                          });
                        },
                        icon: widgetEditing
                            ? const Icon(Icons.save)
                            : const Icon(Icons.dashboard_customize),
                      ),
                    ),
                    if (currentRoutePath == '/wallets')
                      Material(
                        color: Colors.transparent,
                        clipBehavior: Clip.antiAlias,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(14),
                          ),
                        ),
                        child: IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) => const WalletsDialog(),
                            );
                          },
                          icon: const Icon(Icons.settings),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
          body: SafeArea(
            child: widget.child,
            // child: TabBarView(
            //   physics: const NeverScrollableScrollPhysics(),
            //   children: tabs,
            // ),
          ),
          endDrawer: drawer,
          bottomNavigationBar: bottomNavBar,
          // persistentFooterAlignment: AlignmentDirectional.center,
          // persistentFooterButtons: [
          //   // Builder(builder: (context) {
          //   //   final currentIndex = DefaultTabController.of(context).index;
          //   //   return ElevatedButton(
          //   //     onPressed: () {
          //   //       setState(() {
          //   //         currentIndex == Screens.wallets.index
          //   //             ? DefaultTabController.of(context)
          //   //                 .animateTo(Screens.home.index)
          //   //             : DefaultTabController.of(context)
          //   //                 .animateTo(Screens.wallets.index);
          //   //       });
          //   //     },
          //   //     child: Row(
          //   //       mainAxisSize: MainAxisSize.min,
          //   //       children: [
          //   //         Text(currentIndex == Screens.wallets.index
          //   //             ? 'Home'
          //   //             : 'Wallet'),
          //   //         Padding(
          //   //           padding: const EdgeInsets.only(left: 8),
          //   //           child: Icon(
          //   //             currentIndex == Screens.wallets.index
          //   //                 ? Icons.home
          //   //                 : Icons.wallet,
          //   //           ),
          //   //         ),
          //   //       ],
          //   //     ),
          //   //   );
          //   // }),
          //   // Builder(builder: (context) {
          //   //   final currentIndex = DefaultTabController.of(context).index;
          //   //   return ElevatedButton(
          //   //     onPressed: () {
          //   //       setState(() {
          //   //         currentIndex == Screens.toDo.index
          //   //             ? DefaultTabController.of(context)
          //   //                 .animateTo(Screens.home.index)
          //   //             : DefaultTabController.of(context)
          //   //                 .animateTo(Screens.toDo.index);
          //   //       });
          //   //     },
          //   //     child: Row(
          //   //       mainAxisSize: MainAxisSize.min,
          //   //       children: [
          //   //         Text(currentIndex == Screens.toDo.index ? 'Home' : 'To Do'),
          //   //         Padding(
          //   //           padding: const EdgeInsets.only(left: 8),
          //   //           child: Icon(
          //   //             currentIndex == Screens.toDo.index
          //   //                 ? Icons.home
          //   //                 : Icons.format_list_bulleted,
          //   //           ),
          //   //         ),
          //   //       ],
          //   //     ),
          //   //   );
          //   // }),
          //   Builder(builder: (context) {
          //     return ElevatedButton(
          //       onPressed: () => Scaffold.of(context).openEndDrawer(),
          //       child: const Row(
          //         mainAxisSize: MainAxisSize.min,
          //         children: [
          //           Text('Menu'),
          //           Padding(
          //             padding: EdgeInsets.only(left: 8),
          //             child: Icon(Icons.menu_open),
          //           ),
          //         ],
          //       ),
          //     );
          //   }),
          // ],
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
            currentRoutePath = GoRouter.of(context).location;
            // final currentIndex = DefaultTabController.of(context).index;
            return ExpandableFab(
              key: _key,
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
                // if (currentIndex == Screens.home.index)
                //   FloatingActionButton.extended(
                //     label: const Text('Add to do task [Default]'),
                //     heroTag: null,
                //     //child: const Icon(Icons.add),
                //     onPressed: () {
                //       addToDoTaskToDefaultToDoList();
                //     },
                //   ),
                if (widgetEditing == false &&
                    (currentRoutePath == '/home' || currentRoutePath == '/toDo') &&
                    componentsMap[AppComponents.todo.name] == true)
                  FloatingActionButton.extended(
                    label: const Text('Add to do task'),
                    heroTag: null,
                    onPressed: () {
                      addToDoTask();
                    },
                  ),
                // if (currentIndex == Screens.home.index)
                //   FloatingActionButton.extended(
                //     label: const Text('Add transaction [Default]'),
                //     heroTag: null,
                //     //child: const Icon(Icons.add),
                //     onPressed: () {
                //       addTransactionToDefaultWallet();
                //     },
                //   ),
                if (widgetEditing == false &&
                    (currentRoutePath == '/home' || currentRoutePath == '/wallets') &&
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
                      addWidget(currentRoutePath);
                    },
                  ),
              ],
            );
          }),
        ),
      );
    });
  }

  void addWidget(String currentRoutePath, {int? screenIndex}) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AppWidgetDialog(currentRoutePath, screenIndex: screenIndex);
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
