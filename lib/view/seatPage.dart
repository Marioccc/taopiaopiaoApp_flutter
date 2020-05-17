import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test_0/component/pickSeat.dart';
import 'package:test_0/model/movie.dart';

class SeatPage extends StatefulWidget {
  @required
  final Movie _movie;
  SeatPage(this._movie);
  @override
  State<StatefulWidget> createState() {
    return _SeatPageState(_movie);
  }
}

class _SeatPageState extends State<SeatPage> {
  @required
  final Movie _movie;
  _SeatPageState(this._movie);

  int pickSeatCount = 0;
  int _seatPrice = 0;
  pickSeatHandle(bool isPick) {
    if (!isPick) {
      pickSeatCount++;
      _seatPrice = pickSeatCount * 39;
    } else {
      pickSeatCount--;
      _seatPrice = pickSeatCount * 39;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          '${_movie.title}',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20, bottom: 20, top: 5),
                        child: Text('今天08-05 10:20(国语2D)'),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Chip(
                          avatar: Icon(
                            Icons.query_builder,
                            color: Colors.red,
                          ),
                          label: Text(
                            '限时秒杀价39/位',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 10, top: 10),
                  child: Image.asset(
                    '${_movie.avatar}',
                    height: 150,
                    fit: BoxFit.fitHeight,
                  ),
                )
              ],
            ),
            Divider(
              thickness: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Chip(
                  backgroundColor: Colors.transparent,
                  label: Text('已售'),
                  avatar: Icon(
                    Icons.weekend,
                    color: Colors.black45,
                  ),
                ),
                Chip(
                  backgroundColor: Colors.transparent,
                  label: Text('可选'),
                  avatar: Icon(
                    Icons.weekend,
                    color: Colors.blue[200],
                  ),
                ),
                Chip(
                  backgroundColor: Colors.transparent,
                  label: Text('已选'),
                  avatar: Icon(
                    Icons.weekend,
                    color: Colors.green[300],
                  ),
                )
              ],
            ),
            Center(
              child: Container(
                padding:
                    EdgeInsets.only(left: 40, top: 5, bottom: 5, right: 40),
                color: Colors.grey[400],
                child: Text('5号厅'),
              ),
            ),
            PickSeatComponent(pickSeatHandle),
            Divider(
              thickness: 2,
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    '￥ ${_seatPrice} ',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 22,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(15),
        child: RaisedButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(9))),
          onPressed: pickSeatCount > 0 ? () {} : null,
          color: Colors.red,
          textColor: Colors.white,
          child: pickSeatCount > 0 ? Text('确认选座') : Text('请先选座'),
        ),
      ),
    );
  }
}
