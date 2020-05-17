import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test_0/component/rating.dart';
import 'package:test_0/model/movie.dart';
import 'package:video_player/video_player.dart';
import 'seatPage.dart';

class MovieDetailPage extends StatefulWidget {
  final Movie _movie;
  MovieDetailPage(this._movie);
  @override
  State<StatefulWidget> createState() {
    return _MovieDetailPageState(_movie);
  }
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  final Movie _movie;
  _MovieDetailPageState(this._movie);
  VideoPlayerController _controller;
  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.network('${_movie.pre_video}');
    _controller.addListener(() {
      setState(() {});
    });
    _controller.setLooping(false);
    _controller.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Material(
                elevation: 0,
                child: Center(
                    child: _controller.value.initialized
                        ? AspectRatio(
                            aspectRatio: _controller.value.aspectRatio,
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: <Widget>[
                                VideoPlayer(_controller),
                                _PlayPauseOverlay(controller: _controller),
                                VideoProgressIndicator(_controller,
                                    allowScrubbing: true),
                              ],
                            ),
                          )
                        : Container(
                            height: 180,
                            child: Chip(
                                avatar: Icon(Icons.loop), label: Text('加载中')),
                          )),
              ),
              Container(
                color: Colors.yellow,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(bottom: 15),
                              child: Text(
                                "${_movie.title}",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                ),
                              ),
                            ),
                            Text("${_movie.title_us}"),
                            Text("${_movie.category}"),
                            Text(
                                "${_movie.produce_from}|${_movie.play_time}分钟"),
                            Text("${_movie.produce_time} 大陆上映"),
                            Row(
                              children: <Widget>[
                                FlatButton(
                                  color: Colors.grey,
                                  onPressed: () {
                                    print('真的想看。。');
                                  },
                                  child: Text('想看'),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: FlatButton(
                                    color: Colors.grey,
                                    onPressed: () {
                                      print('看过？');
                                    },
                                    child: Text('看过'),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(12),
                      child: Image.asset(
                        "${_movie.avatar}",
                        height: 160,
                        fit: BoxFit.fitHeight,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                  child: Padding(
                padding: EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: Rating(_movie.rating),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Text("评分${_movie.rating_amount}人"),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: Text("${_movie.recommend_scale}"),
                        ),
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: Text("番茄推荐度"),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: Text("${_movie.like_amount}"),
                        ),
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: Text("想看人数"),
                        ),
                      ],
                    )
                  ],
                ),
              )),
              Divider(
                thickness: 2,
              ),
              Container(
                margin: EdgeInsets.only(top: 1),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        '观众热评',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://img9.doubanio.com/icon/u151282709-3.jpg'),
                      ),
                      title: Text('番茄先生'),
                      subtitle: Text('awsl!'),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://img9.doubanio.com/icon/u1018267-44.jpg'),
                      ),
                      title: Text('小生18'),
                      subtitle: Text('强烈推荐，都是实力派演员'),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://img9.doubanio.com/icon/u1637278-207.jpg'),
                      ),
                      title: Text('t3211-2'),
                      subtitle: Text('我觉得不行！'),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://img9.doubanio.com/icon/u2297669-12.jpg'),
                      ),
                      title: Text('rgna'),
                      subtitle: Text('很不错的一部电影'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.all(15),
          child: RaisedButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(9))),
            onPressed: () {
              _controller.pause();
              Navigator.push(
                context,
                new MaterialPageRoute(builder: (context) => SeatPage(_movie)),
              );
            },
            color: Colors.red,
            textColor: Colors.white,
            child: Text('选座购票'),
          ),
        ));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}

class _PlayPauseOverlay extends StatelessWidget {
  const _PlayPauseOverlay({Key key, this.controller}) : super(key: key);

  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedSwitcher(
          duration: Duration(milliseconds: 50),
          reverseDuration: Duration(milliseconds: 200),
          child: controller.value.isPlaying
              ? SizedBox.shrink()
              : Container(
                  color: Colors.black26,
                  child: Center(
                    child: Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                      size: 100.0,
                    ),
                  ),
                ),
        ),
        GestureDetector(
          onTap: () {
            controller.value.isPlaying ? controller.pause() : controller.play();
          },
        ),
      ],
    );
  }
}
