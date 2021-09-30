import 'package:consumer_app/api/function/get_data.dart';
import 'package:consumer_app/utils/app_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  late Future<dynamic> futureUser;
  @override
  void initState() {
    super.initState();
    futureUser = fetchAllUsers();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: FutureBuilder<dynamic>(
          future: futureUser,
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const Center(child: CircularProgressIndicator());
              case ConnectionState.done:
                return ListViewSettingPage(nList: snapshot.data!);
              default:
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return Text('Result: ${snapshot.data}');
                }
            }
          },
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class ListViewSettingPage extends StatefulWidget {
  List<AdminInfo> nList = [];
  ListViewSettingPage({Key? key, required this.nList}) : super(key: key);

  @override
  State<ListViewSettingPage> createState() => _ListViewSettingPageState();
}

class _ListViewSettingPageState extends State<ListViewSettingPage> {
  @override
  Widget build(BuildContext context) {
    setState(() {
      print("JSON=======View");
      print(widget.nList.length);
    });
    return ListView.separated(
        itemBuilder: (context, i) {
          var list = widget.nList[i];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                PageTransition(
                    child: onMenuPressed(context: context, nList: widget.nList),
                    type: PageTransitionType.bottomToTop),
              );
            },
            child: ListTile(
              title: Text(
                list.title,
                style: const TextStyle(
                  color: blue,
                  fontWeight: FontWeight.w700,
                ),
              ),
              subtitle: Text(
                list.content,
                style: const TextStyle(
                  color: gray,
                  fontFamily: 'arial',
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, i) => const Divider(),
        itemCount: widget.nList.length);
  }
}

onMenuPressed(
    {required BuildContext context, required List<AdminInfo> nList}) async {
  showModalBottomSheet(
      isScrollControlled: true,
      isDismissible: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (widgetBuilder) {
        return Container(
          height: double.infinity,
          decoration: const BoxDecoration(
            color: white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: ListViewSettingPageDetails(nList: nList),
        );
      });
}

// ignore: must_be_immutable
class ListViewSettingPageDetails extends StatefulWidget {
  List nList = [];
  ListViewSettingPageDetails({Key? key, required this.nList}) : super(key: key);

  @override
  _ListViewSettingPageDetailsState createState() =>
      _ListViewSettingPageDetailsState();
}

class _ListViewSettingPageDetailsState
    extends State<ListViewSettingPageDetails> {
  @override
  Widget build(BuildContext context) {
    var vList = widget.nList;
    return Scaffold(
      body: ListView.builder(
        itemCount: vList.length,
        itemBuilder: (BuildContext context, int index) {
          var lList = vList[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              GestureDetector(
                onTap: () {},
                child: Card(
                  color: blue,
                  child: ListTile(
                    title: Text(
                      lList.title,
                      style: const TextStyle(
                        fontFamily: 'arail',
                        color: white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
        // separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );
  }
}
