import 'dart:convert';

class Cinema {
  final String name;
  final String pos;
  final String price;
  final String distance;

  Cinema({this.name, this.pos, this.price, this.distance});

  static List<Cinema> resloveMovieData(String data) {
    var results = json.decode(data);
    List<Cinema> listResult = results["results"]
        .map((obj) => Cinema._wrap(obj))
        .toList()
        .cast<Cinema>();
    return listResult;
  }

  static Cinema _wrap(Map map) {
    return new Cinema(
      name: map['name'],
      pos: map['pos'],
      price: map['price'],
      distance: map['distance'],
    );
  }
}
