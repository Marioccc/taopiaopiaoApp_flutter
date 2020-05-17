import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test_0/view/outLinePage.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => new _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  Timer _timer;

  @override
  void initState() {
    super.initState();

    _timer = new Timer(Duration(milliseconds: 800), () {
      Navigator.of(context).pushAndRemoveUntil(
          new MaterialPageRoute(
              builder: (BuildContext context) => new OutLinePage()),
          (Route route) => route == null);
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Image.asset('assets/images/logo.png',
          height: 200,
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}
