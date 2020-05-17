import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:test_0/component/home_list.dart';
import 'package:test_0/component/home_swiper.dart';
import 'package:test_0/component/listItem.dart';
import 'package:test_0/component/rating.dart';
import 'package:test_0/model/movie.dart';
import 'package:test_0/view/cinemaPage.dart';
import 'package:test_0/view/mine.dart';

import 'home.dart';

class OutLinePage extends StatefulWidget {
  _OutLinePageState createState() => new _OutLinePageState();
}

class _OutLinePageState extends State<OutLinePage> {
  // List<Widget> _pages = [Home(), CinemaPage(), MinePage()];
  // int _index = 0;

  final bodyList = [Home(), CinemaPage(), MinePage()];
  final pageController = PageController();
  int currentIndex = 0;

  void onTap(int index) {
    pageController.jumpToPage(index);
  }

  void onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          elevation: 0, // 取消底部阴影部分
          title: SizedBox(
            child: Image.asset('assets/images/taopiaopiao.png'),
            height: 48,
          )),
      body: PageView(
        controller: pageController,
        onPageChanged: onPageChanged,
        children: bodyList,
        physics: NeverScrollableScrollPhysics(), // 禁止滑动
      ),
      bottomNavigationBar: new BottomNavigationBar(
          selectedItemColor: Colors.red,
          currentIndex: currentIndex,
          onTap: onTap,
          items: [
            new BottomNavigationBarItem(
                icon: Icon(Icons.video_label), title: new Text('电影')),
            new BottomNavigationBarItem(
                icon: Icon(Icons.movie), title: new Text('影院')),
            new BottomNavigationBarItem(
                icon: Icon(Icons.person), title: new Text('我的'))
          ]),
    );
  }
}
