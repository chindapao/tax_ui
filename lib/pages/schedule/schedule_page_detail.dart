// ignore_for_file: must_be_immutable

import 'package:consumer_app/pages/schedule/schedule_page_builder.dart';
import 'package:consumer_app/utils/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class SchedulePageDetail extends StatefulWidget {
  int age;
  String firstName,
      lastName,
      username,
      avatar,
      email,
      gender,
      maritalStatus,
      house,
      street,
      city,
      country,
      geoLat,
      geoLng,
      phone,
      website;
  SchedulePageDetail(
      {Key? key,
      required this.firstName,
      required this.lastName,
      required this.username,
      required this.avatar,
      required this.email,
      required this.age,
      required this.gender,
      required this.maritalStatus,
      required this.house,
      required this.street,
      required this.city,
      required this.country,
      required this.geoLat,
      required this.geoLng,
      required this.phone,
      required this.website})
      : super(key: key);

  @override
  _SchedulePageDetailState createState() => _SchedulePageDetailState();
}

class _SchedulePageDetailState extends State<SchedulePageDetail> {
  @override
  void initState() {
    super.initState();
    print("=======================");
    print(widget.age);
  }

  @override
  Widget build(BuildContext context) {
    var nList = widget;
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
      body: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.rightToLeftWithFade,
              child: const SchedulePageBuilder(),
            ),
          );
        },
        child: Card(
          color: blue,
          child: ListTile(
            title: Text(
              nList.firstName + " " + nList.lastName,
              style: const TextStyle(color: Colors.white),
            ),
            subtitle: Text(
              nList.email,
              style: const TextStyle(color: Colors.white),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 16,
              color: white,
            ),
          ),
        ),
      ),
    );
  }
}
