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
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
          style: TextStyle(fontFamily: "OdorMeanChey", fontSize: 14),
        ),
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
