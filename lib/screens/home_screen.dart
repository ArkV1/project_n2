import 'package:flutter/material.dart';

final _scaffoldKey = GlobalKey<ScaffoldState>();

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
    final List<Widget> tiles = [];
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
          child: Center(
        child: tiles.isNotEmpty
            ? ListView(
                children: const [],
              )
            : const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('No widgets chosen'),
                  // TextButton(
                  //   onPressed: () {
                  //     Navigator.pushNamed(context, '/settings');
                  //   },
                  //   child: Row(
                  //     mainAxisSize: MainAxisSize.min,
                  //     children: [
                  //       const Text('Settings'),
                  //       Container(
                  //         padding: const EdgeInsets.only(left: 8.0),
                  //         child: const Icon(Icons.settings),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
      )),
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
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text('Settings'),
                    onTap: () => Navigator.pushNamed(context, '/settings'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      persistentFooterAlignment: AlignmentDirectional.center,
      persistentFooterButtons: [
        ElevatedButton(
          onPressed: () => _scaffoldKey.currentState!.openEndDrawer(),
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
      floatingActionButton: FloatingActionButton(
        heroTag: "home_screen",
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
