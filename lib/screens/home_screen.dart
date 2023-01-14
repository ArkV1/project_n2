import 'package:flutter/material.dart';
import 'package:project_n2/screens/settings_screen.dart';
import 'package:reorderables/reorderables.dart';

import './settings_screen.dart';
import '../widgets/expenseManager_tile.dart';
import '../widgets/calendar_tile.dart';
import '../widgets/notebook_tile.dart';

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

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  int _selectedIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static const List<Widget> _widgetOptions = <Widget>[
    Text('Index 0: Home', style: optionStyle, key: ValueKey(0)),
    Text('Index 1: Menu', style: optionStyle, key: ValueKey(1)),
  ];

  List<Widget> _rows = [];

  @override
  void initState() {
    super.initState();
    // _rows = List<Widget>.generate(
    //     50,
    //     (int index) => Text('This is row $index',
    //         key: ValueKey(index), textScaleFactor: 1.5));
    _rows.add(ExpenseManagerTile(key: ValueKey(0)));
    _rows.add(CalendarTile(key: ValueKey(1)));
    _rows.add(NotebookTile(key: ValueKey(1)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: ReorderableColumn(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: _rows,
            onReorder: (int oldIndex, int newIndex) {
              setState(() {
                Widget row = _rows.removeAt(oldIndex);
                _rows.insert(newIndex, row);
              });
            }),
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
