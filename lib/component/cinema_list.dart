import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test_0/model/cinema.dart';
import 'cinema_listItem.dart';

class CinemaList extends StatefulWidget {
  @override
  _CinemaListListState createState() => new _CinemaListListState();
}

class _CinemaListListState extends State<CinemaList> {
  List<Cinema> _cinema = [];

  @override
  void initState() {
    // 初始化状态
    super.initState();
    _loadListData();
  }

  _loadListData() async {
    String jsonString = await DefaultAssetBundle.of(context)
        .loadString("assets/data/cinemas.json");
    setState(() {
      // 改变状态
      _cinema = Cinema.resloveMovieData(jsonString);
    });
  }

  Widget _buildContent() {
    var content;
    if (_cinema.isEmpty) {
      content = new CircularProgressIndicator();
    } else {
      content = ListView.builder(
        itemCount: _cinema.length,
        itemBuilder: (context, index) => CinemaListItem(_cinema[index]),
      );
    }
    return content;
  }

  @override
  Widget build(BuildContext context) {
    return _buildContent();
  }
}
