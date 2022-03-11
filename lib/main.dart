import 'package:assign11/pages/home/home_page.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_food/pages/home/test.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'กาตุ่ย เดลิเวอร์รี่',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: HomePage(),
    );
  }
}

