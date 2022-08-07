import 'package:flutter/material.dart';
import 'package:takeep_pet/review.dart';

class TripsNRevScreen extends StatefulWidget {
  const TripsNRevScreen({Key? key}) : super(key: key);

  @override
  State<TripsNRevScreen> createState() => _TripsNRevScrState();
}

class _TripsNRevScrState extends State<TripsNRevScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xfff6f6f6),
        appBar: AppBar(
          elevation: 0,
          title: Text(
            "Sefer ve Değerlendirmeler",
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
          backgroundColor: Colors.white,
        ),
        body: ListView(physics: ClampingScrollPhysics(), children: <Widget>[
          SizedBox(
            height: 15,
          ),
          TripsNRevTemp(
              path: "assets/tripnrev/phx.png",
              flydate: "18 Mart 2023",
              flyduration: 763,
              flybetween: "Istanbul - Arizona",
              flybetween_short: "SAW - PHX",
              evaluated: true,
              id: 1),
          TripsNRevTemp(
              path: "assets/tripnrev/lax.png",
              flydate: "08 Nisan 2023",
              flyduration: 1114,
              flybetween: "Istanbul - Los Angeles",
              flybetween_short: "IST - LAX",
              evaluated: false,
              id: 2)
        ]));
  }
}

class TripsNRevTemp extends StatelessWidget {
  final String path;
  final String flydate;
  final int flyduration;
  final String flybetween;
  final String flybetween_short;
  final bool evaluated;
  final int id;

  const TripsNRevTemp(
      {required this.path,
      required this.flydate,
      required this.flyduration,
      required this.flybetween,
      required this.flybetween_short,
      required this.id,
      required this.evaluated});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 130,
        child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            child: InkWell(
              onTap: () {
                if (evaluated == false) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ReviewScreen()));
                }
              },
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 3, // 60% of space => (6/(6 + 4))
                    child: Container(
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        image: DecorationImage(
                          fit: BoxFit.contain,
                          image: AssetImage(path),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 7,
                      // 40% of space
                      child: Stack(children: [
                        Positioned(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  flydate,
                                  style: TextStyle(fontSize: 12),
                                )
                              ],
                            ),
                            Text(
                              "${flyduration ~/ 60} saat ${flyduration % 60} dakika",
                              style: TextStyle(fontSize: 14),
                            ),
                            Text(
                              flybetween + " seferi",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 16),
                            ),
                            Text(
                              flybetween_short,
                              style: TextStyle(fontSize: 22),
                            ),
                          ],
                        )),
                        Positioned(
                            top: 5,
                            right: 10,
                            child: Card(
                                elevation: 0,
                                color: (evaluated == false
                                    ? Color(0xfff09377)
                                    : Color(0xffffffff)),
                                child: Container(
                                  padding: EdgeInsets.all(5),
                                  child: Text(
                                    (evaluated == false
                                        ? "Değerlendir"
                                        : "Değerlendirmeyi gör"),
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: (evaluated == false
                                            ? Color(0xffffffff)
                                            : Color(0xfff09377))),
                                  ),
                                )))
                      ])),
                ],
              ),
            )));
  }
}
