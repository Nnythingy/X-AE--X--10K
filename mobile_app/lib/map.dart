import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import './locations.dart';

/*
This page is to help Admins have a high level view of all situations in Singapore.
Map is from a webview, thus can be updated dynamically with more data from 
appropriate API. Pressing the button will lead to Locations page where more details
can be found.
*/

class Maps extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.red),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Current Locations for SOS"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            SizedBox(
              height: 500.0,
              child: WebView(
                initialUrl:
                    'https://www.google.com/maps/d/u/0/viewer?mid=13TDYE_PUk8MCizvZwYZJEuiK0XvGj9ua&ll=1.3227929156950484,103.80648039147671&z=12',
                javascriptMode: JavascriptMode.unrestricted,
                gestureRecognizers: Set()
                  ..add(Factory<VerticalDragGestureRecognizer>(
                    () => VerticalDragGestureRecognizer(),
                  ))
                  ..add(Factory<TapGestureRecognizer>(
                    () => TapGestureRecognizer(),
                  ))
                  ..add(
                    Factory<HorizontalDragGestureRecognizer>(
                      () => HorizontalDragGestureRecognizer(),
                    ),
                  ),
              ),
            ),
            RaisedButton(
              child: Text('Locations'),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return LocationDetails();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
