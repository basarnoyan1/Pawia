import 'package:flutter/material.dart';
import 'package:takeep_pet/review.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScrState();
}

class _ProfileScrState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    var owner = "Feyza";
    var pet = "Fanta";
    return Scaffold(
        backgroundColor: Color(0xfff6f6f6),
        appBar: AppBar(
          elevation: 0,
          title:
              Text("Hesabımız", style: TextStyle(fontWeight: FontWeight.w700)),
          backgroundColor: Colors.white,
        ),
        body: ListView(physics: ClampingScrollPhysics(), children: <Widget>[
          SizedBox(
            height: 130,
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                Positioned(
                    left: 20,
                    child: CircleAvatar(
                      child: Image.asset("assets/profile/cat.png"),
                      radius: 35,
                    )),
                Positioned(
                    left: 100,
                    top: 35,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            " $owner'nın $pet'sı",
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 18),
                          ),
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                'Değiştir',
                                style: TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 14),
                              ),
                              style: TextButton.styleFrom(
                                  primary: Color(0xfff09377))),
                        ]))
              ],
            ),
          ),
          Card(
            margin: EdgeInsets.fromLTRB(15, 0, 15, 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    print("tapped");
                  },
                  child: Container(
                      height: 70,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Positioned(
                              left: 20,
                              child: Image.asset("assets/profile/account.png")),
                          Positioned(
                              left: 60,
                              child: Text("Hesap Bilgileri",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 17))),
                          Positioned(
                              right: 20,
                              child: Icon(Icons.arrow_forward_ios_rounded))
                        ],
                      )),
                ),
                new Divider(
                  indent: 20,
                  endIndent: 20,
                  height: 1,
                ),
                InkWell(
                  onTap: () {
                    print("tapped");
                  },
                  child: Container(
                      height: 70,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Positioned(
                              left: 20,
                              child: Image.asset("assets/profile/photos.png")),
                          Positioned(
                              left: 60,
                              child: Text("Fotoğraflar",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 17))),
                          Positioned(
                              right: 20,
                              child: Icon(Icons.arrow_forward_ios_rounded))
                        ],
                      )),
                ),
                new Divider(
                  indent: 20,
                  endIndent: 20,
                  height: 1,
                ),
                InkWell(
                  onTap: () {
                    print("tapped");
                  },
                  child: Container(
                      height: 70,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Positioned(
                              left: 20,
                              child: Image.asset("assets/profile/reserve.png")),
                          Positioned(
                              left: 60,
                              child: Text("Rezervasyonlar",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 17))),
                          Positioned(
                              right: 20,
                              child: Icon(Icons.arrow_forward_ios_rounded))
                        ],
                      )),
                ),
              ],
            ),
          ),
          Card(
            margin: EdgeInsets.fromLTRB(15, 0, 15, 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    print("tapped");
                  },
                  child: Container(
                      height: 70,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Positioned(
                              left: 20,
                              child: Image.asset("assets/profile/stat.png")),
                          Positioned(
                              left: 60,
                              child: Text(
                                "İstatistikler",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 17),
                              )),
                          Positioned(
                              right: 20,
                              child: Icon(Icons.arrow_forward_ios_rounded))
                        ],
                      )),
                ),
                new Divider(
                  indent: 20,
                  endIndent: 20,
                  height: 1,
                ),
                InkWell(
                  onTap: () {
                    print("tapped");
                  },
                  child: Container(
                      height: 70,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Positioned(
                              left: 20,
                              child: Image.asset("assets/profile/policy.png")),
                          Positioned(
                              left: 60,
                              child: Text("Evcil Hayvan Politikası",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 17))),
                          Positioned(
                              right: 20,
                              child: Icon(Icons.arrow_forward_ios_rounded))
                        ],
                      )),
                ),
                new Divider(indent: 20, endIndent: 20, height: 1),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ReviewScreen()));
                  },
                  child: Container(
                      height: 70,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Positioned(
                              left: 20,
                              child: Image.asset("assets/profile/eval.png")),
                          Positioned(
                              left: 60,
                              child: Text("Sefer ve Değerlendirmelerim",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 17))),
                          Positioned(
                              right: 20,
                              child: Icon(Icons.arrow_forward_ios_rounded))
                        ],
                      )),
                ),
              ],
            ),
          ),
        ]));
  }
}
