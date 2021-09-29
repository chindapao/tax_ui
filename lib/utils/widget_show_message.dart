import 'package:consumer_app/utils/app_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

dialogMessage({required BuildContext context}) {
  showModalBottomSheet(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(15.0),
        topLeft: Radius.circular(15.0),
      ),
    ),
    context: context,
    builder: (context) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Information',
                  style: TextStyle(
                    color: Colors.grey[900],
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.photo_album_outlined,
              color: Colors.black,
            ),
            title: const Text('Alabum'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(
              Icons.music_note_outlined,
              color: Colors.black,
            ),
            title: const Text('Music'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(
              Icons.videocam_off_outlined,
              color: Colors.black,
            ),
            title: const Text('Video'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(
              Icons.share_outlined,
              color: Colors.black,
            ),
            title: const Text('Share'),
            onTap: () {},
          ),
        ],
      );
    },
  );
}
