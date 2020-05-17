import 'package:flutter/material.dart';
import 'package:test_0/view/welcome.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false, // 关闭右上角debug标签
      theme: new ThemeData(
        primaryColor: Colors.white,
        // primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: new Welcome()
    );
  }
}