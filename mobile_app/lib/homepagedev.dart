import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import './map.dart';
import 'package:webview_flutter/webview_flutter.dart';

/*
This handles the admin page. Allows the admin to track the total number of ongoing cases
and have a high level view of current cases in Singapore. More details can be accessed 
by the Ops Centerto check for Street View to have up-to-date information of the current
situation by accessing nearest 3 lampposts live video feed.
*/

class HomeDev extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<HomeDev> {
  bool _activated = false;
  _handleTap() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return Maps();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.red),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          //creating AppBar with title and Icons
          centerTitle: true,
          title: Text("MyResponder Admin Account"),
          leading: Builder(
            builder: (BuildContext context) {
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
                  ); //similar to the alert button in myResponder App
                },
              );
            },
          ),
          actions: <Widget>[
            // action button
            IconButton(
              icon: Icon(Icons.loop),
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
            ),
            // action button
            IconButton(
              icon: Icon(Icons.menu),
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
            ),
          ],
        ),
        body: Column(
          //individual contents and boxes
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              height: 285,
              child: ListView(
                children: [
                  Container(
                    height: 150,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.all(15.0),
                          padding: const EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.blueAccent)),
                          width: 200,
                          child: Column(
                            children: [
                              Text("Current Cases"),
                              Text("20 Current Cases"),
                              RaisedButton(
                                onPressed: () {
                                  return showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        content: Text(
                                            "More admin features can be implemented here."),
                                      );
                                    },
                                  );
                                },
                                child: Text("Find out more"),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(15.0),
                          padding: const EdgeInsets.all(3.0),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.blueAccent)),
                          width: 200,
                          child: Column(
                            children: [
                              Text("Responded Cases"),
                              Text("9 Responded Cases")
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 150,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.all(15.0),
                          padding: const EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.blueAccent)),
                          width: 200,
                          child: Column(
                            children: [
                              Text("Total Cases Today"),
                              Text("34 Cases Today"),
                            ],
                          ),
                        ),
                        Container(
                            margin: const EdgeInsets.all(15.0),
                            padding: const EdgeInsets.all(3.0),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.blueAccent)),
                            width: 200,
                            child: Text("Other Important Overview details")),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              //handles the webview of the map and tapping of box to bring to detailed map page
              onTap: () {
                _activated = true;
                _handleTap();
              },
              behavior: HitTestBehavior.translucent,
              child: Container(
                decoration: BoxDecoration(color: Colors.blue[100]),
                child: Column(
                  children: [
                    Container(
                      child: Text("Click the blue box for larger picture"),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      height: 300.0,
                      width: 400,
                      child: WebView(
                        initialUrl:
                            'https://www.google.com/maps/d/embed?mid=13TDYE_PUk8MCizvZwYZJEuiK0XvGj9ua',
                        javascriptMode: JavascriptMode.unrestricted,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: SpeedDial(
          // More features that might require more details can be hidden here
          marginRight: 18,
          marginBottom: 20,
          animatedIcon: AnimatedIcons.menu_close,
          animatedIconTheme: IconThemeData(size: 22.0),
          visible: true,
          // If true user is forced to close dial manually
          // by tapping main button and overlay is not rendered.
          closeManually: false,
          curve: Curves.bounceIn,
          overlayColor: Colors.black,
          overlayOpacity: 0.5,
          tooltip: 'Speed Dial',
          heroTag: 'speed-dial-hero-tag',
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 8.0,
          shape: CircleBorder(),
          children: [
            SpeedDialChild(
                child: Icon(Icons.map),
                backgroundColor: Colors.red,
                label: 'Location OverView',
                labelStyle: TextStyle(fontSize: 18.0),
                onTap: () {
                  return Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return Maps();
                      },
                    ),
                  );
                }),
            SpeedDialChild(
              child: Icon(
                Icons.lightbulb_outline,
                color: Colors.yellow,
              ),
              backgroundColor: Colors.blue,
              label: 'More Implementations here',
              labelStyle: TextStyle(fontSize: 18.0),
              onTap: () {
                return showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content:
                          Text("More admin features can be implemented here."),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
