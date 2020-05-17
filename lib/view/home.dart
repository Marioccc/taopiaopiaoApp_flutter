import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test_0/component/home_list.dart';
import 'package:test_0/component/home_swiper.dart';

class Home extends StatefulWidget {
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          child: HomeSwiper(),
          height: 190,
        ),
        Expanded(
          child: HomeListPage(),
        ),
      ],
    );
  }
}
