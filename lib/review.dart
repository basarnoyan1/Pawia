import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({Key? key}) : super(key: key);

  @override
  State<ReviewScreen> createState() => _ReviewScrState();
}

class _ReviewScrState extends State<ReviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text("Değerlendirme"),
          backgroundColor: Colors.white,
        ),
        body: ListView(physics: ClampingScrollPhysics(), children: <Widget>[
          Column(children: [
            RatePaw(cont: "Arkadaşını devretme süreci nasıldı?"),
            RatePaw(cont: "Rezerve etme süreci ne kadar rahattı?"),
            RatePaw(cont: "THY çalışanları sana yardımcı olabildi mi?"),
          ])
        ]));
  }
}

class RatePaw extends StatefulWidget {
  final String cont;
  const RatePaw({required this.cont});

  @override
  State<RatePaw> createState() => _PawState();
}

class _PawState extends State<RatePaw> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 90,
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.only(left: 25, top: 35),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(widget.cont,
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
          SizedBox(height: 15),
          RatingBar(
            initialRating: 3,
            direction: Axis.horizontal,
            allowHalfRating: false,
            itemCount: 5,
            itemSize: 50,
            ratingWidget: RatingWidget(
              full: Image.asset('assets/review/paw_yellow_filled.png'),
              half: Image.asset('assets/review/paw_yellow_filled.png'),
              empty: Image.asset('assets/review/paw_yellow.png'),
            ),
            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
            onRatingUpdate: (rating) {
              print(rating);
            },
          )
        ]));
  }
}
