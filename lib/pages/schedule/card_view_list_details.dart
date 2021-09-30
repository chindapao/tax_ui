import 'package:consumer_app/utils/app_constant.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CardViewListDetails extends StatefulWidget {
  String title;
  CardViewListDetails({Key? key, required this.title}) : super(key: key);

  @override
  _CardViewListDetailsState createState() => _CardViewListDetailsState();
}

class _CardViewListDetailsState extends State<CardViewListDetails> {
  @override
  void initState() {
    super.initState();
  }

  Future onMenuPressed(var nlist) async {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (widgetBuilder) => bottomSheetBuilder(nlist: nlist));
  }

  Future onAlert(BuildContext context, var nlist) async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) =>
            messageDialog(context: context, nlist: nlist));
  }

  @override
  Widget build(BuildContext context) {
    var nList = widget.title;
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
          'លម្អិតបន្ថែមអំពីមូលប័ត្រ',
          style: TextStyle(fontFamily: "OdorMeanChey", fontSize: 14),
        ),
      ),
      body: Container(
        height: 120.0,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(
          vertical: 4,
          horizontal: 4,
        ),
        child: GestureDetector(
          onTap: () {
            // onMenuPressed(nList);
            onAlert(context, nList);
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7.0),
              color: blue,
            ),
            height: 800.0,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 10,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    nList,
                    style: const TextStyle(
                      color: white,
                    ),
                  ),
                  Text(
                    nList,
                    style: const TextStyle(
                      color: white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget bottomSheetBuilder({required var nlist}) {
  return Container(
    height: 350,
    decoration: const BoxDecoration(
        color: white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        )),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Row(
          children: <Widget>[
            Text(
              '$nlist',
            ),
            // Text('$nlist'),
          ],
        )
      ],
    ),
  );
}

Widget messageDialog({required BuildContext context, var nlist}) {
  return AlertDialog(
    title: const Text(
      'បញ្ជាក់បន្ថែមអំពីអ្នក',
      style: TextStyle(fontFamily: "OdorMeanChey", fontSize: 14),
    ),
    content: SingleChildScrollView(
      child: ListBody(
        children: <Widget>[
          Text(
            nlist,
            style: const TextStyle(fontFamily: "arial", fontSize: 14),
          ),
        ],
      ),
    ),
    actions: <Widget>[
      TextButton(
        onPressed: () {},
        child: Text(
          'យល់ព្រម',
          style: TextStyle(fontFamily: "OdorMeanChey", fontSize: 12),
        ),
      ),
      TextButton(
        child: Text(
          'បោះបង់',
          style: TextStyle(fontFamily: "OdorMeanChey", fontSize: 12),
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    ],
  );
}
