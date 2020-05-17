import 'dart:convert';

class Movie {
  final String avatar;
  final String title;
  final List<String> diretor;
  final List<String> actor;
  final String title_us;
  final String category;
  final String produce_from;
  final String play_time;
  final String produce_time;
  final String rating;
  final String rating_amount;
  final String recommend_scale;
  final String like_amount;
  final String pre_video;

  Movie(
      {this.title,
      this.diretor,
      this.actor,
      this.title_us,
      this.category,
      this.produce_from,
      this.play_time,
      this.produce_time,
      this.rating,
      this.rating_amount,
      this.recommend_scale,
      this.like_amount,
      this.pre_video,
      this.avatar});

  static List<Movie> resloveMovieData(String data) {
    var results = json.decode(data);
    List<Movie> listResult = results["results"]
        .map((obj) => Movie._wrap(obj))
        .toList()
        .cast<Movie>();
    return listResult;
  }

  static Movie _wrap(Map map) {
    return new Movie(
        avatar: map['avator'],
        title: map['title'],
        diretor: List<String>.from(map['diretor']),
        actor: List<String>.from(map['actor']),
        title_us: map['title_us'],
        category: map['category'],
        produce_from: map['produce_from'],
        play_time: map['play_time'],
        produce_time: map['produce_time'],
        rating: map['rating'],
        rating_amount: map['rating_amount'],
        recommend_scale: map['recommend_scale'],
        like_amount: map['like_amount'],
        pre_video: map['pre_video']);
  }
}
