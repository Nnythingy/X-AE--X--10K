import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './homepage.dart';
import './homepagedev.dart';

/*
Login Page to determine the user's level of authentication
*/

class LoginPage extends StatelessWidget {
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();

  handleClick(name) {
    print("$name clicked");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.red),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Login Here"),
        ),
        body: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    hintText: "Account Name",
                    hintStyle: TextStyle(
                        fontWeight: FontWeight.w300, color: Colors.blue),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.orange),
                    ),
                    contentPadding: const EdgeInsets.all(20),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Password",
                    hintStyle: TextStyle(
                        fontWeight: FontWeight.w300, color: Colors.blue),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.orange),
                    ),
                    contentPadding: const EdgeInsets.all(20),
                  ),
                  controller: passwordController,
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          // When the user presses the button, show an alert dialog containing
          // the text that the user has entered into the text field.
          onPressed: () {
            if (usernameController.text == "admin" &&
                passwordController.text == "1234") {
              return Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return HomeDev();
                  },
                ),
              );
            } else if (usernameController.text == "cfr1" &&
                passwordController.text == "1234") {
              return Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return HomeCFR();
                  },
                ),
              );
            } else
              return showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                      content: Text("Wrong username or password."));
                },
              );
          },
          tooltip: "Login here",
          child: Icon(Icons.send),
        ),
      ),
    );
  }
}
