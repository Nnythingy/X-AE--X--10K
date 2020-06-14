import './lamp_post.dart';
import 'package:flutter/material.dart';
import './homepagedev.dart';

/*
Locations page will list out all the current situations across Singapore. By
clicking on a single location, this will open the page LampPost, which will provide
live video feed. Data to populate the list will come from relevant APIs or will
take raw data from current existing databases.
*/

class LocationDetails extends StatefulWidget {
  @override
  LocationState createState() => LocationState();
}

class LocationState extends State<LocationDetails> {
  bool _activated = false;
  _handleTap() {
    Navigator.of(context).push(
      MaterialPageRoute(
        
        builder: (BuildContext context) {
          return LampPost();
        },
      ),
    );
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.red),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('SOS Locations'),
          centerTitle: true,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: Icon(Icons.home),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return HomeDev();
                      },
                    ),
                  );
                },
              );
            },
          ),
        ),
        body: ListView(
          children: [
            GestureDetector(
              onTap: () {
                _activated = true;
                _handleTap();
              },
              behavior: HitTestBehavior.translucent,
              child: Locations(
                  '420 Bukit Batok West Ave 2, Block 420, Singapore 650420',
                  'Latitude: 1.36251',
                  'Longitude: 103.74579'),
            ),
            GestureDetector(
              onTap: () {
                _activated = true;
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Alert Dialog Title Text.'),
                      content: Text("More features coming soon!"),
                    );
                  },
                );
              },
              behavior: HitTestBehavior.translucent,
              child: Locations(
                  '107 Ang Mo Kio Ave 4, Block 107, Singapore 560107',
                  'Latitude: 1.37143',
                  'Longitude: 103.83724'),
            ),
            GestureDetector(
              onTap: () {
                _activated = true;
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Alert Dialog Title Text.'),
                      content: Text("More features coming soon!"),
                    );
                  },
                );
              },
              behavior: HitTestBehavior.translucent,
              child: Locations(
                  'Bukit Batok West Ave 8, #01-256/258 Block 166, Singapore 650166',
                  'Latitude: 1.34735',
                  'Longitude: 103.74288'),
            ),
            GestureDetector(
              onTap: () {
                _activated = true;
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Alert Dialog Title Text.'),
                      content: Text("More features coming soon!"),
                    );
                  },
                );
              },
              behavior: HitTestBehavior.translucent,
              child: Locations('151-152 Rochor Rd, Singapore 188426',
                  'Latitude: 1.30121', 'Longitude: 103.85508'),
            ),
          ],
        ),
      ),
    );
  }
}

class Locations extends StatelessWidget {
  final String _location;
  final String _longitude;
  final String _latitude;

  Locations(
    this._location,
    this._longitude,
    this._latitude,
  );

  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(width: 5, color: Colors.grey),
          borderRadius: BorderRadius.all(Radius.circular(5.0))),
      child: Column(
        children: <Widget>[
          Text(
            _location,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
          ),
          Text(
            _longitude,
            style:
                TextStyle(decoration: TextDecoration.underline, fontSize: 20.0),
          ),
          Text(
            _latitude,
            style:
                TextStyle(decoration: TextDecoration.underline, fontSize: 20.0),
          ),
        ],
      ),
    );
  }
}
