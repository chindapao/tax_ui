import 'package:consumer_app/utils/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:list_tile_switch/list_tile_switch.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool _value = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ListTileSwitch(
              value: _value,
              onChanged: (value) {
                setState(() {
                  _value = value;
                });
              },
              visualDensity: VisualDensity.comfortable,
              switchType: SwitchType.material,
              switchActiveColor: blue,
              title: Text(_value ? "Dark" : "Light"),
              leading: Icon(_value ? Icons.nightlight : Icons.light_mode),
            ),
          ],
        ),
      ),
    );
  }
}
