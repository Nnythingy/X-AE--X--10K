import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:clipboard_manager/clipboard_manager.dart';
import 'package:device_apps/device_apps.dart';
import 'package:call_number/call_number.dart';

/*
This page handles the individual accounts for the CFRs. They will have access to
less details and have a simple UI to accept nearby SOS and speed dial function 
to call 995. They can have access to other services if required.
*/

class HomeCFR extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<HomeCFR> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.red),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("My CFR1 Account"),
          leading: Builder(
            builder: (BuildContext context) {
              //similar function to the alert button in myResponder App
              return IconButton(
                icon: Icon(Icons.add_alert),
                onPressed: () {
                  return showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content:
                            Text("Feature will be similar to myResponder App."),
                      );
                    },
                  );
                },
              );
            },
          ),
          actions: <Widget>[
            // action button similar to that in myResponder app
            IconButton(
              icon: Icon(Icons.loop),
              onPressed: () {
                return showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                        content: Text(
                            "Feature will be similar to myResponder App."));
                  },
                );
              },
            ),
            // action button similar to that in myResponder app
            IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                return showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                        content: Text(
                            "Feature will be similar to myResponder App."));
                  },
                );
              },
            ),
          ],
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              height: 550,
              child: ListView(children: [
                Container( //contains the boxes for CFRs to interact with
                  height: 500,
                  child: ListView(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.all(15.0),
                        padding: const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.blueAccent)),
                        child: Column(
                          children: [
                            Text("E-Services"),
                            Text("Click Here for more services"),
                            IconButton(
                              icon: Icon(Icons.info),
                              onPressed: () {
                                return showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      content: Text(
                                          "Feature will be similar to myResponder App."),
                                    );
                                  },
                                );
                              },
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(15.0),
                        padding: const EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.blueAccent)),
                        child: Column(
                          children: [
                            Text("Closest SOS case"),
                            Text(
                              "Bukit Batok West Ave 8, #01-256/258 Block 166, Singapore 650166",
                              textAlign: TextAlign.center,
                            ),
                            RaisedButton(
                              child: Text('Accept Request'),
                              onPressed: () {
                                return showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      content: Text(
                                          "Location will be copied if press 'YES'. Paste in google maps to find shortest route to location."),
                                      actions: <Widget>[
                                        FlatButton(
                                          child: Text("Yes"),
                                          onPressed: () {
                                            //Yes button click.
                                            ClipboardManager.copyToClipBoard(
                                                "Bukit Batok West Ave 8, #01-256/258 Block 166, Singapore 650166");
                                            DeviceApps.openApp(
                                                "com.google.android.apps.maps");
                                          },
                                        ),
                                        FlatButton(
                                          child: Text("Cancel"),
                                          onPressed: () {
                                            //No button click.
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(15.0),
                        padding: const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.blueAccent)),
                        child: Column(
                          children: [
                            Text("New Sign Up"),
                            RaisedButton(
                                onPressed: () {
                                  return showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        content: Text(
                                            "Redirect to Sign Up."),
                                      );
                                    },
                                  );
                                },
                                child: Text("Sign Up here"),
                              ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(15.0),
                        padding: const EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.blueAccent)),
                        child: Column(
                          children: [
                            Text("More Features"),
                            Text("More Features can be implemented here."),
                            IconButton(
                              icon: Icon(Icons.adb),
                              onPressed: () {
                                return showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      content: Text(
                                          "Feature will be similar to myResponder App."),
                                    );
                                  },
                                );
                              },
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
            Align( //Speed Dial 995
              alignment: Alignment.bottomCenter,
              child: IconButton(
                icon: Icon(Icons.phone),
                onPressed: () {
                  CallNumber().callNumber('995');
                },
                color: Colors.green[400],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
