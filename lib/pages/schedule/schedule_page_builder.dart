import 'dart:convert';

import 'package:consumer_app/utils/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
  void initState() {
    super.initState();
    getAllUsers();
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
                const Icon(Icons.arrow_back_outlined, size: 18.0, color: white),
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
        future: getAllUsers(), // async work
        builder:
            (BuildContext context, AsyncSnapshot<List<UserInfo>> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.done:
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, i) {
                    var nList = snapshot.data![i];
                    return GestureDetector(
                      child: Card(
                        child: ListTile(
                          title: Text(nList.title),
                        ),
                      ),
                    );
                  });
            default:
              if (snapshot.hasError)
                return Text('Error: ${snapshot.error}');
              else
                return Text('Result: ${snapshot.data}');
          }
        },
      ),
    );
  }
}

class UserConvert {
  UserConvert({
    required this.userInfo,
  });
  late final List<UserInfo> userInfo;

  UserConvert.fromJson(Map<String, dynamic> json) {
    userInfo =
        List.from(json['user_info']).map((e) => UserInfo.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['user_info'] = userInfo.map((e) => e.toJson()).toList();
    return _data;
  }
}

class UserInfo {
  UserInfo({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });
  late final int albumId;
  late final int id;
  late final String title;
  late final String url;
  late final String thumbnailUrl;

  UserInfo.fromJson(Map<String, dynamic> json) {
    albumId = json['albumId'];
    id = json['id'];
    title = json['title'];
    url = json['url'];
    thumbnailUrl = json['thumbnailUrl'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['albumId'] = albumId;
    _data['id'] = id;
    _data['title'] = title;
    _data['url'] = url;
    _data['thumbnailUrl'] = thumbnailUrl;
    return _data;
  }
}
