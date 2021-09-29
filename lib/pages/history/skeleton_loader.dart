import 'package:consumer_app/model/entities/state_capital.dart';
import 'package:consumer_app/utils/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SkeletonLoaderTool extends StatelessWidget {
  final String appTitle = "Flutter Skeleton Loader Demo";
  final List<StateCapital> sc = [
    StateCapital(name: "Abia", capital: "Umuahia"),
    StateCapital(name: "Adamawa", capital: "Yola"),
    StateCapital(name: "Akwa-Ibom", capital: "Uyo"),
    StateCapital(name: "Anambra", capital: "Awka"),
    StateCapital(name: "Bauchi", capital: "Bauchi"),
    StateCapital(name: "Bayelsa", capital: "Yenagoa"),
    StateCapital(name: "Benue", capital: "Makurdi"),
    StateCapital(name: "Borno", capital: "Maiduguri"),
    StateCapital(name: "Cross River", capital: "Calabar"),
    StateCapital(name: "Delta", capital: "Asaba"),
    StateCapital(name: "Ebonyi", capital: "Abakaliki"),
    StateCapital(name: "Edo", capital: "Benin"),
    StateCapital(name: "Ekiti", capital: "Ado-Ekiti"),
    StateCapital(name: "Enugu", capital: "Enugu"),
    StateCapital(name: "FCT", capital: "Abuja"),
    StateCapital(name: "Gombe", capital: "Gombe"),
    StateCapital(name: "Imo", capital: "Owerri"),
    StateCapital(name: "Jigawa", capital: "Dutse"),
    StateCapital(name: "Kaduna", capital: "Kaduna"),
    StateCapital(name: "Kano", capital: "Kano"),
    StateCapital(name: "Katsina", capital: "Katsina"),
    StateCapital(name: "Kebbi", capital: "Birnin-Kebbi"),
    StateCapital(name: "Kogi", capital: "Lokoja"),
    StateCapital(name: "Kwara", capital: "Ilorin"),
    StateCapital(name: "Lagos", capital: "Ikeja"),
    StateCapital(name: "Nassarawa", capital: "Lafia"),
    StateCapital(name: "Niger", capital: "Mina"),
    StateCapital(name: "Ogun", capital: "Abeokuta"),
    StateCapital(name: "Ondo", capital: "Akure"),
    StateCapital(name: "Osun", capital: "Osogbo"),
    StateCapital(name: "Oyo", capital: "Ibadan"),
    StateCapital(name: "Plateau", capital: "Jos"),
    StateCapital(name: "Rivers", capital: "Port Harcourt"),
    StateCapital(name: "Sokoto", capital: "Sokoto"),
    StateCapital(name: "Taraba", capital: "Jalingo"),
    StateCapital(name: "Yobe", capital: "Damaturu"),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.openSansTextTheme(),
        primaryTextTheme: GoogleFonts.openSansTextTheme().copyWith(
          headline6: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        initialIndex: 1,
        child: Scaffold(
          appBar: AppBar(
            leading: Container(
              margin: const EdgeInsets.all(10.0),
              child: InkWell(
                hoverColor: Colors.pink,
                borderRadius: BorderRadius.circular(25.0),
                child: const Icon(Icons.arrow_back_outlined,
                    size: 18.0, color: white),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
            backgroundColor: blue,
            title: const Text(
              "ស្វែងយល់បន្ថែមអំពីបញ្ជី",
              style: TextStyle(fontFamily: "OdorMeanChey", fontSize: 14),
            ),
            bottom: const TabBar(
              labelColor: Colors.white,
              tabs: <Widget>[
                Tab(
                  text: "Grid",
                ),
                Tab(
                  text: "List",
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              GridExample(stateCapitals: sc),
              ListExample(stateCapitals: sc),
            ],
          ),
        ),
      ),
    );
  }
}

class GridExample extends StatelessWidget {
  var stateCapitals = [];
  GridExample({Key? key, required this.stateCapitals}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 4.0,
        ),
        itemCount: stateCapitals.length,
        itemBuilder: (context, index) {
          // return Container(
          //   color: Colors.blue,
          //   child: Text("index: $index"),
          // );
          return GestureDetector(
            child: Card(
              color: blue,
              elevation: 12,
              child: ListTile(
                title: Text("$index"),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ListExample extends StatelessWidget {
  var stateCapitals = [];
  ListExample({Key? key, required this.stateCapitals}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: stateCapitals.length,
        itemBuilder: (context, int i) => GestureDetector(
          child: const Card(
            elevation: 12,
            color: blue,
            child: ListTile(
              title: Text('text'),
            ),
          ),
        ),
      ),
    );
  }
}
