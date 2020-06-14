import 'package:flutter/material.dart';
import './login.dart';


void main() => runApp(MyApp()); //main()

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.red),
      home: LoginPage(), 
    );
  }
}
