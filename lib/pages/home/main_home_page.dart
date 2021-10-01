import 'package:consumer_app/pages/history/history_page.dart';
import 'package:consumer_app/pages/home/home_page.dart';
import 'package:consumer_app/pages/schedule/schedule_page.dart';
import 'package:consumer_app/pages/settings/setting_page.dart';
import 'package:consumer_app/utils/app_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:easy_localization/easy_localization.dart';

class DomainHomePage extends StatelessWidget {
  const DomainHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Localization Demo',
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: const MainHomePage(),
    );
  }
}

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
  String dropdownValue = 'English - UK';
  String icon = "uk.png";
  var isLang = "";

  void _settingModalBottomSheet(BuildContext context) {
    var height = 0.48;
    var width = 1.0;
    showModalBottomSheet(
      context: context,
      isDismissible: true,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * height,
          // width: MediaQuery.of(context).size.width * width,
          decoration: const BoxDecoration(
            color: white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(14), topRight: Radius.circular(14)),
          ),
          child: Form(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Center(
                  child: Container(
                    height: 65.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.4),
                          spreadRadius: 0.0,
                          blurRadius: 1,
                          offset: const Offset(0, 1),
                        ),
                      ],
                      color: white,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(14.0),
                        topRight: Radius.circular(14.0),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        const SizedBox(
                          height: 8.0,
                          width: 0.0,
                        ),
                        Center(
                          child: Container(
                            height: 4.0,
                            width: 45.0,
                            decoration: BoxDecoration(
                              color: gray,
                              borderRadius: BorderRadius.circular(7),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 5.0, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              const Text(
                                'ជ្រើសរើសភាសា',
                                style: TextStyle(
                                  color: blue,
                                  fontFamily: "OdorMeanChey",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: const SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: Icon(
                                    Icons.close,
                                    size: 30,
                                    color: blue,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12.0,
                    horizontal: 12.0,
                  ),
                  child: Column(
                    children: <Widget>[
                      // TextField(
                      //   autofocus: true,
                      //   cursorColor: gray,
                      //   onChanged: (value) {
                      //     //Do something with the user input.
                      //   },
                      //   style: const TextStyle(
                      //     fontFamily: "OdorMeanChey",
                      //     fontSize: 12,
                      //     height: 2.0,
                      //   ),
                      //   decoration: const InputDecoration(
                      //     errorMaxLines: 1,
                      //     errorStyle: TextStyle(
                      //       fontSize: 12.0,
                      //     ),
                      //     errorBorder: OutlineInputBorder(
                      //       borderSide: BorderSide(color: Colors.redAccent),
                      //     ),
                      //     hintStyle: TextStyle(
                      //       fontFamily: "OdorMeanChey",
                      //       fontSize: 12,
                      //     ),
                      //     hintText: 'ឈ្មោះ',
                      //     contentPadding: EdgeInsets.symmetric(
                      //         vertical: 14.0, horizontal: 14.0),
                      //     border: OutlineInputBorder(
                      //       borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      //     ),
                      //     enabledBorder: OutlineInputBorder(
                      //       borderSide: BorderSide(color: gray, width: 1.0),
                      //       borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      //     ),
                      //     focusedBorder: OutlineInputBorder(
                      //       borderSide: BorderSide(color: gray, width: 1.5),
                      //       borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      //     ),
                      //   ),
                      // ),
                      // const SizedBox(width: 0.0, height: 7.0),
                      // TextField(
                      //   autofocus: true,
                      //   cursorColor: gray,
                      //   onChanged: (value) {
                      //     //Do something with the user input.
                      //   },
                      //   style: const TextStyle(
                      //     fontFamily: "OdorMeanChey",
                      //     fontSize: 12,
                      //     height: 2.0,
                      //   ),
                      //   decoration: const InputDecoration(
                      //     errorMaxLines: 1,
                      //     errorStyle: TextStyle(
                      //       fontSize: 12.0,
                      //     ),
                      //     errorBorder: OutlineInputBorder(
                      //       borderSide: BorderSide(color: Colors.redAccent),
                      //     ),
                      //     hintStyle: TextStyle(
                      //       fontFamily: "OdorMeanChey",
                      //       fontSize: 12,
                      //     ),
                      //     hintText: 'អាយុ',
                      //     contentPadding: EdgeInsets.symmetric(
                      //         vertical: 14.0, horizontal: 14.0),
                      //     border: OutlineInputBorder(
                      //       borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      //     ),
                      //     enabledBorder: OutlineInputBorder(
                      //       borderSide: BorderSide(color: gray, width: 1.0),
                      //       borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      //     ),
                      //     focusedBorder: OutlineInputBorder(
                      //       borderSide: BorderSide(color: gray, width: 1.5),
                      //       borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      //     ),
                      //   ),
                      // ),
                      // const SizedBox(width: 0.0, height: 7.0),
                      // TextField(
                      //   autofocus: true,
                      //   cursorColor: gray,
                      //   onChanged: (value) {
                      //     //Do something with the user input.
                      //   },
                      //   style: const TextStyle(
                      //     fontFamily: "OdorMeanChey",
                      //     fontSize: 12,
                      //     height: 2.0,
                      //   ),
                      //   decoration: const InputDecoration(
                      //     errorMaxLines: 1,
                      //     errorStyle: TextStyle(
                      //       fontSize: 12.0,
                      //     ),
                      //     errorBorder: OutlineInputBorder(
                      //       borderSide: BorderSide(color: Colors.redAccent),
                      //     ),
                      //     hintStyle: TextStyle(
                      //       fontFamily: "OdorMeanChey",
                      //       fontSize: 12,
                      //     ),
                      //     hintText: 'ថ្ងៃខែឆ្នាំកំណើត',
                      //     contentPadding: EdgeInsets.symmetric(
                      //         vertical: 14.0, horizontal: 14.0),
                      //     border: OutlineInputBorder(
                      //       borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      //     ),
                      //     enabledBorder: OutlineInputBorder(
                      //       borderSide: BorderSide(color: gray, width: 1.0),
                      //       borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      //     ),
                      //     focusedBorder: OutlineInputBorder(
                      //       borderSide: BorderSide(color: gray, width: 1.5),
                      //       borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      //     ),
                      //   ),
                      // ),
                      // const SizedBox(width: 0.0, height: 7.0),
                      // FlatButton(
                      //   shape: RoundedRectangleBorder(
                      //     borderRadius: BorderRadius.circular(8.0),
                      //   ),
                      //   height: 50,
                      //   minWidth: MediaQuery.of(context).size.width * width,
                      //   color: blue,
                      //   onPressed: () {
                      //     Navigator.pop(context);
                      //   },
                      //   child: const Text(
                      //     'ចុចបញ្ចូល',
                      //     style: TextStyle(
                      //       color: white,
                      //       fontFamily: "OdorMeanChey",
                      //       fontSize: 14,
                      //     ),
                      //   ),
                      // ),
                      // const SizedBox(width: 0.0, height: 7.0),
                      FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        height: 50,
                        minWidth: MediaQuery.of(context).size.width * width,
                        color: blue,
                        onPressed: () {
                          setState(() {
                            isLang = 'English - UK';
                            context.locale = const Locale('en', 'UK');
                          });
                        },
                        child: const Text(
                          'ខ្មែរ',
                          style: TextStyle(
                            color: white,
                            fontFamily: "OdorMeanChey",
                            fontSize: 14,
                          ),
                        ),
                      ),
                      const SizedBox(width: 0.0, height: 7.0),
                      FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        height: 50,
                        minWidth: MediaQuery.of(context).size.width * width,
                        color: blue,
                        onPressed: () {
                          setState(() {
                            isLang = 'Spanish - ES';
                            context.locale = const Locale('en', 'UK');
                          });
                        },
                        child: const Text(
                          'កូរ៉េ',
                          style: TextStyle(
                            color: white,
                            fontFamily: "OdorMeanChey",
                            fontSize: 14,
                          ),
                        ),
                      ),
                      const SizedBox(width: 0.0, height: 7.0),
                      FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        height: 50,
                        minWidth: MediaQuery.of(context).size.width * width,
                        color: blue,
                        onPressed: () {},
                        child: const Text(
                          'អងគ្លេស',
                          style: TextStyle(
                            color: white,
                            fontFamily: "OdorMeanChey",
                            fontSize: 14,
                          ),
                        ),
                      ),
                      const SizedBox(width: 0.0, height: 7.0),
                      FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        height: 50,
                        minWidth: MediaQuery.of(context).size.width * width,
                        color: blue,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'បោះបង់',
                          style: TextStyle(
                            color: white,
                            fontFamily: "OdorMeanChey",
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: blue,
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
              horizontal: 14.0,
            ),
            child: GestureDetector(
              onTap: () {
                _settingModalBottomSheet(context);
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
