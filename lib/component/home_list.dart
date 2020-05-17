import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test_0/component/home_swiper.dart';
import 'package:test_0/component/listItem.dart';
import 'package:test_0/model/movie.dart';

class HomeListPage extends StatefulWidget {
  @override
  _HomeListPageState createState() => new _HomeListPageState();
}

class _HomeListPageState extends State<HomeListPage> {
  List<Movie> _movies = [];
  @override
  void initState() {
    // 初始化状态
    super.initState();
    _loadListData();
  }

  _loadListData() async {
    String jsonString = await DefaultAssetBundle.of(context)
        .loadString("assets/data/movies.json");
    setState(() {
      // 改变状态
      _movies = Movie.resloveMovieData(jsonString);
    });
  }

  Widget _buildContent() {
    var content;
    if (_movies.isEmpty) {
      content = new CircularProgressIndicator();
    } else {
      content = ListView.builder(
        itemCount: _movies.length,
        itemBuilder: (context, index) => ListItem(this._movies[index]),
      );
    }
    return content;
  }

  @override
  Widget build(BuildContext context) {
    return _buildContent();
  }
}
