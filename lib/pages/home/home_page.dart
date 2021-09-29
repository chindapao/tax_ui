import 'dart:convert';

import 'package:consumer_app/model/entities/users.dart';
import 'package:consumer_app/pages/home/home_page_details.dart';
import 'package:consumer_app/utils/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:page_transition/page_transition.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<User> listModel = [];
  var loading = false;

  Future<dynamic> getData() async {
    setState(() {
      loading = true;
    });

    final responseData =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    if (responseData.statusCode == 200) {
      final data = jsonDecode(responseData.body);
      print(data);
      setState(() {
        for (var i in data) {
          listModel.add(User.fromJson(i));
        }
        loading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: loading
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: listModel.length,
                itemBuilder: (context, i) {
                  final nDataList = listModel[i];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.rightToLeftWithFade,
                          child: HomePageDetail(
                            dName: nDataList.name,
                            dEmail: nDataList.email,
                            dPhone: nDataList.phone,
                            dCity: nDataList.address.city,
                            dZip: nDataList.address.zipcode,
                          ),
                        ),
                      );
                    },
                    child: Card(
                      elevation: 12,
                      color: blue,
                      margin: const EdgeInsets.symmetric(
                        vertical: 4.0,
                        horizontal: 8.0,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 10,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              nDataList.name,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.green),
                            ),
                            Text(nDataList.email),
                            Text(nDataList.phone),
                            Text(nDataList.website),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "Address",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text(nDataList.address.street),
                            Text(nDataList.address.city),
                            Text(nDataList.address.suite),
                            Text(nDataList.address.zipcode),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "Company",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text(nDataList.company.name),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
      ),
    );
  }
}
