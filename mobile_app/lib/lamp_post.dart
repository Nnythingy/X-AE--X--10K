import 'package:flutter/material.dart';

/*
This page is to view live up-to-date video feed for the smart lamp posts.
Help to accurate assess the situtaion to come to better decision on which
and how to allocate resources to the situation.
*/

class LampPost extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.red),
      home: Scaffold(
        appBar: AppBar(
          title: Text("LampPost Camera Near Locations"),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: ListView(
          children: [
            Column(
              children: [
                image,
                image2,
                image3,
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget image = Column(
  children: [
    Text("Lamp Post ID: kml_269"),
    Container(
      padding: const EdgeInsets.all(5),
      decoration:
          BoxDecoration(border: Border.all(width: 3, color: Colors.grey)),
      child: Image(
        image: AssetImage('assets/LampPost_1.PNG'),
      ),
    ),
  ],
);

Widget image2 = Column(
  children: [
    Text("Lamp Post ID: kml_268"),
    Container(
      padding: const EdgeInsets.all(5),
      decoration:
          BoxDecoration(border: Border.all(width: 3, color: Colors.grey)),
      child: Image(
        image: AssetImage('assets/LampPost_2.PNG'),
      ),
    ),
  ],
);

Widget image3 = Column(
  children: [
    Text("Lamp Post ID: kml_267"),
    Container(
      padding: const EdgeInsets.all(5),
      decoration:
          BoxDecoration(border: Border.all(width: 3, color: Colors.grey)),
      child: Image(
        image: AssetImage('assets/LampPost_3.PNG'),
      ),
    ),
  ],
);
