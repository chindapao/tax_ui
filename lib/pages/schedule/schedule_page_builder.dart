import 'dart:convert';

import 'package:consumer_app/model/entities/users_info.dart';
import 'package:consumer_app/pages/schedule/card_view_list_details.dart';
import 'package:consumer_app/utils/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:page_transition/page_transition.dart';

class SchedulePageBuilder extends StatefulWidget {
  const SchedulePageBuilder({Key? key}) : super(key: key);

  @override
  _SchedulePageBuilderState createState() => _SchedulePageBuilderState();
}

class _SchedulePageBuilderState extends State<SchedulePageBuilder> {
  Future<List<UserInfo>> getAllUsers() async {
    List<UserInfo> listModel = [];
    var responseData = await http
        .get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));
    if (responseData.statusCode == 200) {
      var data = jsonDecode(responseData.body);
      for (var i in data) {
        listModel.add(UserInfo.fromJson(i));
      }
      print("DATA========");
      print(data);
    }
    return listModel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          margin: const EdgeInsets.all(10.0),
          child: InkWell(
            hoverColor: Colors.pink,
            borderRadius: BorderRadius.circular(25.0),
            child:
                const Icon(Icons.arrow_back_outlined, size: 24.0, color: white),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
        automaticallyImplyLeading: true,
        backgroundColor: blue,
        centerTitle: false,
        title: const Text(
          'អំពីមូលប័ត្រ',
          style: TextStyle(fontFamily: "OdorMeanChey", fontSize: 14),
        ),
      ),
      body: FutureBuilder<List<UserInfo>>(
        future: getAllUsers(),
        builder:
            (BuildContext context, AsyncSnapshot<List<UserInfo>> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.done:
              return CardViewList(nListDetails: snapshot.data!);
            default:
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return Text('Result: ${snapshot.data}');
              }
          }
        },
      ),
    );
  }
}

// ignore: must_be_immutable
class CardViewList extends StatelessWidget {
  List nListDetails = [];
  CardViewList({Key? key, required this.nListDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: nListDetails.length,
      itemBuilder: (context, i) {
        var nList = nListDetails[i];
        return Card(
          child: ListTile(
            onTap: () {
              Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.rightToLeftWithFade,
                  child: CardViewListDetails(title: nList.title),
                ),
              );
            },
            title: Text(nList.title),
          ),
        );
      },
    );
  }
}
