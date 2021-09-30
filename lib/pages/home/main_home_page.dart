import 'package:consumer_app/pages/history/history_page.dart';
import 'package:consumer_app/pages/home/home_page.dart';
import 'package:consumer_app/pages/schedule/schedule_page.dart';
import 'package:consumer_app/pages/settings/setting_page.dart';
import 'package:consumer_app/utils/app_constant.dart';
import 'package:flutter/material.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({Key? key}) : super(key: key);

  @override
  _MainHomePageState createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  late int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _widgetOption = [
    const HomePage(),
    const SchedulePage(),
    const HistoryPage(),
    const SettingPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
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
              leading: Icon(Icons.message),
              title: Text('Messages'),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        leading: Container(
          margin: const EdgeInsets.all(10.0),
          child: Builder(
            builder: (context) => InkWell(
              borderRadius: BorderRadius.circular(25.0),
              child: const Icon(Icons.menu, size: 24.0, color: white),
              onTap: () => Scaffold.of(context).openDrawer(),
            ),
          ),
        ),
        automaticallyImplyLeading: true,
        backgroundColor: blue,
        centerTitle: true,
        title: Text(
          _selectedIndex == 0
              ? 'មូលប័ត្រពន្ធអាករ'
              : _selectedIndex == 1
                  ? "កាលវិភាគ"
                  : _selectedIndex == 2
                      ? "ប្រវត្តិទាំងអស់"
                      : "ព័ត៏មានផ្ទាល់ខ្លួន",
          style: const TextStyle(fontFamily: "OdorMeanChey", fontSize: 14),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 0.0,
              horizontal: 16.0,
            ),
            child: GestureDetector(
              onTap: () {
                onSettingPressed(context);
              },
              child: const Icon(Icons.settings),
            ),
          ),
        ],
      ),
      body: _widgetOption.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            title: Text(
              'ទំព័រដើម',
              style: TextStyle(
                fontFamily: "OdorMeanChey",
                fontSize: 10,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.event_rounded,
            ),
            title: Text(
              'កាលបរិច្ឆេទ',
              style: TextStyle(
                fontFamily: "OdorMeanChey",
                fontSize: 10,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.restore_rounded,
            ),
            title: Text(
              'ប្រវត្តិ',
              style: TextStyle(
                fontFamily: "OdorMeanChey",
                fontSize: 10,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_rounded,
            ),
            title: Text(
              'គណនី',
              style: TextStyle(
                fontFamily: "OdorMeanChey",
                fontSize: 10,
              ),
            ),
          ),
        ],
        currentIndex: _selectedIndex,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: blue,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        iconSize: 22,
        elevation: 10,
        backgroundColor: Colors.white,
        selectedIconTheme: const IconThemeData(size: 22),
        unselectedItemColor: Theme.of(context).focusColor.withOpacity(1),
        onTap: _onItemTapped,
      ),
    );
  }
}

onSettingPressed(BuildContext context) async {
  showModalBottomSheet(
    isScrollControlled: false,
    isDismissible: true,
    backgroundColor: Colors.transparent,
    context: context,
    builder: (widgetBuilder) {
      return Container(
        decoration: const BoxDecoration(
            color: white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 20,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Hello",
                  ),
                  Text(
                    "Hello",
                  ),
                  Text(
                    "Hello",
                  ),
                  // Text('$nlist'),
                ],
              ),
            )
          ],
        ),
      );
    },
  );
}
