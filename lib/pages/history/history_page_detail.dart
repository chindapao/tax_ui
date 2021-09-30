import 'package:consumer_app/pages/history/skeleton_loader.dart';
import 'package:consumer_app/utils/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class HostoryPageDetail extends StatefulWidget {
  var nList = {};
  HostoryPageDetail({Key? key, required this.nList}) : super(key: key);

  @override
  _HostoryPageDetailState createState() => _HostoryPageDetailState();
}

class _HostoryPageDetailState extends State<HostoryPageDetail> {
  @override
  Widget build(BuildContext context) {
    var nList = widget.nList;
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
        backgroundColor: blue,
        title: const Text(
          "លំអិតអំពី",
          style: TextStyle(fontFamily: "OdorMeanChey", fontSize: 14),
        ),
      ),
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.rightToLeftWithFade,
                child: SkeletonLoaderTool(),
              ),
            );
          },
          child: Card(
            color: blue,
            elevation: 12,
            child: ListTile(
              title: Text(
                nList['name'],
              ),
              subtitle: Text(nList['email']),
            ),
          ),
        ),
      ),
    );
  }
}
