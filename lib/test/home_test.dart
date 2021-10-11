import 'package:consumer_app/api/data_backup.dart';
import 'package:consumer_app/model/entities/users_info.dart';
import 'package:consumer_app/utils/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class HomeTest extends StatefulWidget {
  const HomeTest({Key? key}) : super(key: key);

  @override
  _HomeTestState createState() => _HomeTestState();
}

class _HomeTestState extends State<HomeTest> {
  late Future getMovie;
  @override
  void initState() {
    super.initState();
    getMovie = fetchMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5.0,
        backgroundColor: shrinePink500,
        centerTitle: true,
        title: const Text(
          'ស្វែងរកគូរស្នេហ៏',
          style: TextStyle(fontFamily: "OdorMeanChey", fontSize: 14),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(12.0),
          ),
        ),
      ),
      body: FutureBuilder<dynamic>(
        future: getMovie,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(
                child: CircularProgressIndicator(
                  backgroundColor: shrinePink500,
                  color: shrinePink500,
                ),
              );
            case ConnectionState.done:
              return Center(
                child: UserRead(nlist: snapshot.data!),
              );
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
class UserRead extends StatefulWidget {
  UserRead({Key? key, required this.nlist}) : super(key: key);
  var nlist = [];

  @override
  _UserReadState createState() => _UserReadState();
}

class _UserReadState extends State<UserRead> {
  @override
  Widget build(BuildContext context) {
    var nlist = widget.nlist;
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                PageTransition(
                    child: UserReadDetail(
                      name: nlist[index].name,
                      username: nlist[index].username,
                      email: nlist[index].email,
                      // address: nlist[index].address,
                      phone: nlist[index].phone,
                      website: nlist[index].website,
                      comName: nlist[index].company.name,
                      comCatchPhrase: nlist[index].company.catchPhrase,
                      comBs: nlist[index].company.bs,
                    ),
                    type: PageTransitionType.rightToLeftWithFade),
              );
            },
            child: Container(
              margin: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 8.0,
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 20.0,
                horizontal: 10.0,
              ),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: shrinePink50,
                border: Border.all(
                  width: 1.0,
                  color: gray,
                ), // Set border width
                borderRadius: const BorderRadius.all(
                  Radius.circular(7.0),
                ),
              ),
              child: Text(nlist[index].name),
            ),
          );
        },
        itemCount: nlist.length,
      ),
    );
  }
}

// ignore: must_be_immutable
class UserReadDetail extends StatefulWidget {
  String name, username, email, phone, website, comName, comCatchPhrase, comBs;
  UserReadDetail(
      {Key? key,
      required this.name,
      required this.username,
      required this.email,
      required this.phone,
      required this.website,
      required this.comName,
      required this.comCatchPhrase,
      required this.comBs})
      : super(key: key);

  @override
  _UserReadDetailState createState() => _UserReadDetailState();
}

class _UserReadDetailState extends State<UserReadDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: AppBar(
          elevation: 3.0,
          leading: Container(
            margin: const EdgeInsets.all(10.0),
            child: InkWell(
              hoverColor: Colors.white,
              borderRadius: BorderRadius.circular(25.0),
              child: const Icon(Icons.arrow_back_outlined,
                  size: 20.0, color: white),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ),
          backgroundColor: shrinePink500,
          centerTitle: true,
          title: const Text(
            'មើលបន្ថែម',
            style: TextStyle(fontFamily: "OdorMeanChey", fontSize: 14),
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(12.0),
            ),
          ),
        ),
      ),
      body: Container(
        // height: MediaQuery.of(context).size.height,
        // decoration: BoxDecoration(
        //   border: Border.all(
        //     color: gray,
        //     width: 2.0,
        //   ),
        //   color: shrineSurfaceWhite,
        //   borderRadius: BorderRadius.circular(7.0),
        // ),
        margin: const EdgeInsets.symmetric(
          vertical: 12.0,
          horizontal: 12.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(widget.name),
            Text(widget.username),
            Text(widget.email),
            Text(widget.phone),
            Text(widget.website),
            Text(widget.comName),
          ],
        ),
      ),
    );
  }
}
