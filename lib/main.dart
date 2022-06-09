import 'package:flutter/material.dart';
import 'package:http_demo_1/screens/main_screen.dart';

void main() {
  runApp(const HttpApp());
}

class HttpApp extends StatelessWidget {
  const HttpApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainScreen()
    );
  }
}
