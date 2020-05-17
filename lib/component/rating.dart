import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Rating extends StatefulWidget {
  final String _rating;
  Rating(this._rating);
  @override
  State<StatefulWidget> createState() {
    return new _RatingState(_rating);
  }
}

class _RatingState extends State<Rating> {
  final String _rating;
  String mRating;
  double fRating;
  _RatingState(this._rating);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mRating = _rating;
    fRating = double.parse(mRating);
    fRating = fRating / 2;
  }

  @override
  Widget build(BuildContext context) {
    return RatingBar(
      ignoreGestures: true,
      itemSize: 20,
      initialRating: fRating,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemPadding: EdgeInsets.symmetric(horizontal: 0.2),
      itemBuilder: (context, _) => Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) {
        print(rating);
      },
    );
  }
}
