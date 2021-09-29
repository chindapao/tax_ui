import 'package:consumer_app/api/data_backup.dart';
import 'package:consumer_app/pages/history/history_page_detail.dart';
import 'package:consumer_app/utils/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  var acceptList = [];
  fetchUser() {
    setState(() {
      for (var item in listUser) {
        acceptList.add(item);
      }
    });
    print("========================");
    print(acceptList.length);
  }

  @override
  void initState() {
    super.initState();
    fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: acceptList.length,
        itemBuilder: (context, i) {
          var nList = acceptList[i];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.rightToLeftWithFade,
                  child: HostoryPageDetail(
                    nList: nList,
                  ),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 0.0,
                horizontal: 0,
              ),
              child: Card(
                color: blue,
                elevation: 12,
                child: ListTile(
                  title: Text(
                    nList['name'],
                    style: const TextStyle(
                      color: white,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
