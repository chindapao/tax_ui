import 'package:consumer_app/utils/app_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomePageDetail extends StatefulWidget {
  String dName, dEmail, dPhone, dCity, dZip;
  HomePageDetail(
      {Key? key,
      required this.dName,
      required this.dEmail,
      required this.dPhone,
      required this.dCity,
      required this.dZip})
      : super(key: key);
  @override
  _HomePageDetailState createState() => _HomePageDetailState();
}

class _HomePageDetailState extends State<HomePageDetail> {
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
        backgroundColor: blue,
        title: const Text(
          "លំអិតអំពី",
          style: TextStyle(fontFamily: "OdorMeanChey", fontSize: 14),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(16),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    // ignore: avoid_unnecessary_containers
                    Container(
                      child: const Text(
                        'With One Class',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: blue,
                        ),
                      ),
                    ),
                    // ignore: avoid_unnecessary_containers
                    Container(
                      child: Column(
                        children: <Widget>[
                          Text(
                            // ignore: unnecessary_string_interpolations
                            "${widget.dName}",
                            style: const TextStyle(
                                fontSize: 24,
                                color: yellow,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Email : ${widget.dEmail}",
                            style: const TextStyle(fontSize: 16),
                          ),
                          Text(
                            "Phone : ${widget.dPhone}",
                            style: const TextStyle(fontSize: 16),
                          ),
                          Text(
                            "City : ${widget.dCity}",
                            style: const TextStyle(fontSize: 16),
                          ),
                          Text(
                            "Zip Postal : ${widget.dZip}",
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          // ignore: avoid_unnecessary_containers
          Container(
            child: Column(
              children: <Widget>[
                // ignore: unnecessary_new
                new NameDetail(
                  name: widget.dName,
                  email: widget.dEmail,
                ),
                // ignore: unnecessary_new
                const BagianIcon(),
                // ignore: unnecessary_new
                new BagianContact(
                  phone: widget.dPhone,
                  city: widget.dCity,
                  postal: widget.dZip,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NameDetail extends StatelessWidget {
  final String name, email;
  const NameDetail({required this.name, required this.email});
  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  name,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: blue, fontSize: 24),
                ),
                Text(
                  "Email : $email",
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          Row(
            children: const <Widget>[
              Icon(
                Icons.star,
                size: 40,
                color: yellow,
              ),
              Text(
                "12",
                style: TextStyle(fontSize: 12),
              )
            ],
          )
        ],
      ),
    );
  }
}

class BagianIcon extends StatelessWidget {
  const BagianIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: const <Widget>[
          IconText(
            iconData: Icons.camera,
            text: "Camera",
          ),
          IconText(
            iconData: Icons.phone,
            text: "Phone",
          ),
          IconText(
            iconData: Icons.message,
            text: "Message",
          ),
        ],
      ),
    );
  }
}

class IconText extends StatelessWidget {
  const IconText({Key? key, required this.iconData, required this.text})
      : super(key: key);
  final IconData iconData;
  final String text;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Expanded(
      child: Column(
        children: <Widget>[
          Icon(
            iconData,
            size: 20,
            color: blue,
          ),
          Text(
            text,
            style: const TextStyle(fontSize: 12, color: blue),
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class BagianContact extends StatelessWidget {
  String phone, city, postal;
  BagianContact(
      {Key? key, required this.phone, required this.city, required this.postal})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: const EdgeInsets.all(16),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              Container(
                child: const Text(
                  'With many Class',
                  style: TextStyle(
                    fontSize: 16,
                    color: blue,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              // ignore: avoid_unnecessary_containers
              Container(
                child: Text(
                  phone,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                child: Text(
                  city,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              Container(
                child: Text(
                  postal,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
