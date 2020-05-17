import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MinePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MinePagePageState();
  }
}

class _MinePagePageState extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Icon(Icons.local_play),
                ),
                Text(
                  '我的电影票',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            Divider(
              thickness: 1,
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Icon(Icons.local_atm),
                ),
                Text(
                  '优惠券',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            Divider(
              thickness: 1,
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Icon(Icons.help_outline),
                ),
                Text(
                  '帮助中心',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            Divider(
              thickness: 1,
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Icon(Icons.question_answer),
                ),
                Text(
                  '意见反馈',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
