import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test_0/model/movie.dart';
import 'package:test_0/view/movieDetailPage.dart';
import 'package:test_0/view/seatPage.dart';

class ListItem extends StatefulWidget {
  final Movie _movie;
  ListItem(this._movie);
  @override
  State<StatefulWidget> createState() {
    return _ListItemState(_movie);
  }
}

class _ListItemState extends State<ListItem> {
  final Movie _movie;
  _ListItemState(this._movie);

  navPage() {
    Navigator.push(context,
        new MaterialPageRoute(builder: (context) => MovieDetailPage(_movie)));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navPage();
      },
      child: Card(
        margin: EdgeInsets.all(10),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Image.asset(
                '${_movie.avatar}',
                height: 120,
                fit: BoxFit.fitHeight,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '${_movie.title}',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('观众评分${_movie.rating}'),
                  Text('导演：${_movie.diretor.join(' ')}'),
                  Text('主演：${_movie.actor.join(' ')}'),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 12),
              child: FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  color: Colors.red,
                  child: Text('购票', style: TextStyle(color: Colors.white)),
                  onPressed: () {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => SeatPage(_movie)));
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
