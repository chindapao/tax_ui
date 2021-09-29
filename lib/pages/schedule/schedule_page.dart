import 'dart:convert';

import 'package:consumer_app/model/entities/shop_dto.dart';
import 'package:consumer_app/pages/schedule/schedule_page_detail.dart';
import 'package:consumer_app/utils/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:page_transition/page_transition.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({Key? key}) : super(key: key);

  @override
  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  List<Shop> listShop = [];
  var loading = false;
  Future<dynamic> fetchShop() async {
    setState(() {
      loading = true;
    });
    var response = await http.get(Uri.parse(
        "http://fakeapi.jsonparseronline.com/users?_sort=name&_order=asc"));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print("====Total Record :");
      print(data.length);
      setState(() {
        for (var item in data) {
          listShop.add(Shop.fromJson(item));
        }
        loading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchShop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: loading
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: listShop.length,
                itemBuilder: (context, i) {
                  final nList = listShop[i];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.rightToLeftWithFade,
                          child: SchedulePageDetail(
                            firstName: nList.firstName,
                            lastName: nList.lastName,
                            username: nList.username,
                            avatar: nList.avatar,
                            email: nList.email,
                            age: nList.age,
                            gender: nList.gender,
                            maritalStatus: nList.maritalStatus,
                            house: nList.address.house,
                            street: nList.address.street,
                            city: nList.address.city,
                            country: nList.address.country,
                            geoLat: nList.address.geo.lat,
                            geoLng: nList.address.geo.lng,
                            phone: nList.phone,
                            website: nList.website,
                          ),
                        ),
                      );
                    },
                    child: Card(
                      color: blue,
                      elevation: 12,
                      child: ListTile(
                        title: Text(
                          nList.firstName + " " + nList.lastName,
                          style: const TextStyle(color: white),
                        ),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
