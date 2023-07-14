import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_n2/providers/providers.dart';
import 'package:project_n2/screens/home_screen.dart';
import 'package:project_n2/screens/wallets_screen.dart';
import 'package:project_n2/tools/enums/screens.dart';

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
      body: SafeArea(
        child: () {
          switch (currentScreen) {
            case Screen.wallets:
              return const WalletsScreen();
            default:
              return const HomeScreen();
          }
        }(),
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
        Builder(builder: (context) {
          return ElevatedButton(
            onPressed: () => Scaffold.of(context).openEndDrawer(),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Menu'),
                Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: Icon(Icons.menu),
                ),
              ],
            ),
          );
        }),
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
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: currentScreen == Screen.home
          ? FloatingActionButton(
              heroTag: "home_screen",
              child: const Icon(Icons.add),
              onPressed: () {},
            )
          : null,
    );
  }
}
