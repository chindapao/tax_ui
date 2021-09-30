import 'package:consumer_app/pages/history/history_page.dart';
import 'package:consumer_app/pages/home/main_home_page.dart';
import 'package:consumer_app/pages/settings/setting_page.dart';
import 'package:consumer_app/routes/initialize_route.dart';
import 'package:consumer_app/pages/schedule/schedule_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.black,
    statusBarColor: Colors.transparent,
  ));
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (setting) {
        late Widget page;
        if (setting.name == InitializeRoute.routeHome) {
          page = const MainHomePage();
        } else if (setting.name == InitializeRoute.routeSchedule) {
          page = const SchedulePage();
        } else if (setting.name == InitializeRoute.routeHistory) {
          page = const HistoryPage();
        } else if (setting.name == InitializeRoute.routeSetting) {
          page = const SettingPage();
        } else {
          throw Exception("Unknown route: ${setting.name}");
        }
        return MaterialPageRoute<dynamic>(builder: (context) => page);
      },
    ),
  );
}
