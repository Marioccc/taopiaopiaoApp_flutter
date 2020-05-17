import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomeSwiper extends StatefulWidget {
  HomeSwiper({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeSwiperState createState() => new _HomeSwiperState();
}

class _HomeSwiperState extends State<HomeSwiper> {
  final List<String> _images = <String>[
    'assets/images/banner01.jpeg',
    'assets/images/banner02.jpeg',
    'assets/images/banner03.jpeg'
  ];
  @override
  Widget build(BuildContext context) {
    return new Swiper(
      autoplay: true,
      itemBuilder: (BuildContext context, int index) {
        return Image.asset(
          '${_images[index]}',
          fit: BoxFit.cover,
        );
      },
      viewportFraction: 0.83,
      scale: 0.9,
      duration: 800,
      itemCount: _images.length,
      pagination: new SwiperPagination(),
      control: new SwiperControl(
        iconPrevious: null,
        iconNext: null,
      ),
    );
  }
}
