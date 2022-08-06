import 'package:flutter/material.dart';

class NotifScreen extends StatefulWidget {
  const NotifScreen({Key? key}) : super(key: key);

  @override
  State<NotifScreen> createState() => _NotifScrState();
}

class _NotifScrState extends State<NotifScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xfff6f6f6),
        appBar: AppBar(
          elevation: 0,
          title: Text(
            "Bildirimler",
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
          backgroundColor: Colors.white,
        ),
        body: ListView(physics: ClampingScrollPhysics(), children: <Widget>[
          SizedBox(
            height: 15,
          ),
          NotifTemp(
              path: "assets/profile/cat.png",
              primaryText: "💤 Fanta şu an mışıl mışıl uyuyor...",
              secondaryText: "Uyurken görüntülemek için tıkla"),
          NotifTemp(
              path: "assets/cal.png",
              primaryText: "Rezervasyonunuz tamamlanmıştır",
              secondaryText: "Detayları görüntülemek için tıkla")
        ]));
  }
}

class NotifTemp extends StatelessWidget {
  final String path;
  final String primaryText;
  final String secondaryText;
  const NotifTemp(
      {required this.path,
      required this.primaryText,
      required this.secondaryText});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            child: InkWell(
              onTap: () {
                print("tapped");
              },
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 2, // 60% of space => (6/(6 + 4))
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("2 saat önce"),
                        Text(
                          primaryText,
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 16),
                        ),
                        Text(secondaryText),
                      ],
                    ),
                  ),
                ],
              ),
            )));
  }
}
