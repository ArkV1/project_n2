import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:reorderables/reorderables.dart';

import '../models/module.dart';

import './settings_screen.dart';

import '../widgets/home_screen_tile.dart';

final _scaffoldKey = GlobalKey<ScaffoldState>();

const List<Widget> _widgetOptions = <Widget>[
  Text('Index 0: Home', key: ValueKey(0)),
  Text('Index 1: Menu', key: ValueKey(1)),
];
int _selectedIndex = 0;

List<String> _moduleList = [
  // 'Expense Manager',
  // 'Calendar',
  // 'Notebook',
];
List<Widget> _rows = [];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void pageNavigation(BuildContext ctx, screen) async {
    await Navigator.of(ctx).push(
      MaterialPageRoute(
        builder: (_) {
          return screen;
        },
      ),
    ).then((value) {
      setState(() {});
    });
  }

  // static const TextStyle optionStyle =
  //     TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  // static const List<Widget> _widgetOptions = <Widget>[
  //   Text('Index 0: Home', style: optionStyle, key: ValueKey(0)),
  //   Text('Index 1: Menu', style: optionStyle, key: ValueKey(1)),
  // ];

  @override
  void initState() {
    super.initState();
    // _rows = List<Widget>.generate(
    //     50,
    //     (int index) => Text('This is row $index',
    //         key: ValueKey(index), textScaleFactor: 1.5));

    // _rows.add(SmartTile('Expense Manager', key: ValueKey(0)));
    // _rows.add(SmartTile('Calendar', key: ValueKey(1)));
    // _rows.add(SmartTile('Notebook', key: ValueKey(2)));

    // _rows = List<Widget>.generate(
    //   modules.moduleList.length,
    //   (int index) => SmartTile(
    //     modules.moduleList[index],
    //     key: ValueKey(index),
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    final modules = Provider.of<CustomModules>(context);
    _rows = List<Widget>.generate(
      modules.moduleList!.length,
      (int index) => SmartTile(
        modules.moduleList![index],
        key: ValueKey(index),
      ),
    );
    _moduleList = modules.moduleList!;
    //final modules = Provider.of<CustomModules>(context);
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: _rows.isNotEmpty
            ? ReorderableColumn(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: _rows,
                onReorder: (int oldIndex, int newIndex) {
                  setState(
                    () {
                      Widget row = _rows.removeAt(oldIndex);
                      String moduleList = _moduleList.removeAt(oldIndex);
                      _rows.insert(newIndex, row);
                      _moduleList.insert(newIndex, moduleList);
                      modules.prefs.setStringList('moduleList', _moduleList);
                    },
                  );
                },
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text('No modules enabled', textAlign: TextAlign.center),
                  TextButton(
                      onPressed: () =>
                          pageNavigation(context, SettingsScreen()),
                      child: Text('You can enable them in settings'))
                ],
              ),
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.amber,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () => {
                Navigator.pop(context),
                pageNavigation(context, SettingsScreen()),
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Menu',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.home),
          //   label: 'Home',
          // ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.business),
          //   label: 'Business',
          // ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.school),
          //   label: 'School',
          // ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: (int index) {
          if (index == 1) {
            _scaffoldKey.currentState!.openEndDrawer();
          }
          setState(() {
            _selectedIndex = index;
            print(_widgetOptions.elementAt(
              _selectedIndex,
            ));
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
