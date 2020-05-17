import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test_0/model/cinema.dart';
import 'package:test_0/model/movie.dart';
import 'package:test_0/view/movieDetailPage.dart';

class CinemaListItem extends StatefulWidget {
  final Cinema _cinema;
  CinemaListItem(this._cinema);
  @override
  State<StatefulWidget> createState() {
    return _CinemaListItemState(_cinema);
  }
}

class _CinemaListItemState extends State<CinemaListItem> {
  final Cinema _cinema;
  _CinemaListItemState(this._cinema);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // print(1);
      },
      child: Card(
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              '${_cinema.name}',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                        Text(
                          '影城卡',
                          style: TextStyle(
                            backgroundColor: Colors.green,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        '${_cinema.pos}',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(6),
                            margin: EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                                border: Border.all(
                              color: Colors.green[200],
                              width: 1,
                            )),
                            child: Text(
                              '观影小吃',
                              style: TextStyle(
                                color: Colors.green[200],
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(6),
                            margin: EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                                border: Border.all(
                              color: Colors.green[200],
                              width: 1,
                            )),
                            child: Text(
                              '艺术影厅',
                              style: TextStyle(
                                color: Colors.green[200],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(4),
                            margin: EdgeInsets.only(right: 6),
                            color: Colors.green,
                            child: Text(
                              '卡',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Text(
                            '影城卡首单，最高减16元',
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(bottom: 10, right: 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            "${_cinema.price}元",
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '起',
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          )
                        ],
                      ),
                    ),
                    Text(
                      '距离${_cinema.distance}km',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
