import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'globals.dart' as globals;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScrState();
}

class _HomeScrState extends State<HomeScreen> {
  String dropdownvalue = globals.pet_name;
  var items = globals.pets;

  var temperature = "37.6ºC";
  var tilt = "4º";

  final url =
      "https://api.turkishairlines.com/test/aodb-rest/searchFlightByFlightNumber";

  void posts() async {
    try {
      final now = new DateTime.now();
      String formatted = DateFormat('yyyyMMdd').format(now);
      final response = await post(Uri.parse(url),
          headers: {
            "Content-type": "application/json",
            "apikey": "l7xxf90f2f436d3b48bba2a0d0ef5aec7008",
            "apisecret": "885c340e96ac4c7a9638c021ccbe8a01"
          },
          body: jsonEncode({"date": formatted, "flightNumber": "1"}));
      var responseData = json.decode(response.body)["data"];
      if (responseData.length < 2) {
        globals.departure =
            responseData[0]["scheduledDepartureAirport"].toString();
        globals.arrival = responseData[0]["scheduledArrivalAirport"].toString();
        var dep = responseData[0]["actualLocalDepartureDatetime"].toString();
        globals.deptime = dep.substring(8, 10) + ":" + dep.substring(10);
        var arr = responseData[0]["estimatedLocalArrivalDatetime"].toString();
        globals.arrtime = arr.substring(8, 10) + ":" + arr.substring(10);
      } else {}
    } catch (err) {
      print(err);
    }
  }

  @override
  void initState() {
    super.initState();
    posts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: Image.asset("assets/thylogo.png"),
          elevation: 0,
          backgroundColor: Colors.white,
          title: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Text(
                  "Pet",
                  style: TextStyle(
                      height: 0, fontSize: 12, color: Color(0xFFBFBFBF)),
                ),
                DropdownButtonHideUnderline(
                  child: DropdownButton(
                    value: dropdownvalue,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: items.map((String items) {
                      return DropdownMenuItem(value: items, child: Text(items));
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownvalue = newValue.toString();
                        globals.pet_name = newValue.toString();
                      });
                    },
                    isDense: true,
                  ),
                ),
              ]),
        ),
        body: ListView(physics: ClampingScrollPhysics(), children: <Widget>[
          Column(children: <Widget>[
            Container(
                margin: EdgeInsets.fromLTRB(20, 10, 20, 5),
                alignment: Alignment.centerLeft,
                child: const Text("Miyav, miyav!",
                    style:
                        TextStyle(fontSize: 23, fontWeight: FontWeight.w700))),
            Container(
              margin: EdgeInsets.fromLTRB(20, 0, 20, 10),
              height: 90.0,
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 3, // 60% of space => (6/(6 + 4))
                    child: Image.asset("assets/hpage_cat.png"),
                  ),
                  Expanded(
                    flex: 6, // 40% of space
                    child: Container(
                        margin: EdgeInsets.fromLTRB(25, 0, 0, 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                      text: "Son yenileme: 20:22 19.05.2023\n",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 12)),
                                  TextSpan(
                                      text: "$dropdownvalue'nın durumu gayet",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 22,
                                          fontWeight: FontWeight.w700)),
                                  TextSpan(
                                      text: ' iyi',
                                      style: TextStyle(
                                          color: Color(0xff87d163),
                                          fontSize: 22,
                                          fontWeight: FontWeight.w700))
                                ],
                              ),
                            ),
                          ],
                        )),
                  ),
                ],
              ),
            ),
            SizedBox(
                width: 344,
                height: 224,
                child: Stack(children: <Widget>[
                  ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        'assets/last_cat.png',
                        width: 344,
                        height: 224,
                        fit: BoxFit.cover,
                      )),
                  Container(
                      alignment: Alignment.bottomLeft,
                      width: 82,
                      margin: EdgeInsets.all(12),
                      child: Text.rich(TextSpan(children: [
                        TextSpan(
                            text: "SON ÇEKİM ",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Color.fromARGB(165, 255, 255, 255),
                                fontSize: 12)),
                        TextSpan(
                            text: "20:22 19.05.2023",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Colors.white))
                      ]))),
                  Container(
                    alignment: Alignment.topRight,
                    margin: EdgeInsets.all(8),
                    child:
                        Icon(Icons.no_accounts_outlined, color: Colors.white),
                  ),
                  Container(
                      alignment: Alignment.bottomRight,
                      margin: EdgeInsets.all(8),
                      child: Icon(Icons.arrow_circle_right_outlined,
                          color: Colors.white))
                ])),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                    height: 80,
                    width: 165,
                    child: Card(
                        elevation: 0,
                        color: Color(0xffa8a8a8).withOpacity(0.1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Stack(children: [
                          //manual position using left, top, right, bottom
                          Positioned(
                              left: 10,
                              top: 10,
                              bottom: 10,
                              child: Container(
                                alignment: Alignment.center,
                                height: 48,
                                width: 48,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    color: Color(0xff87d163)),
                                child: Text(
                                  "OK",
                                  style: TextStyle(color: Colors.white),
                                ),
                              )),
                          Positioned(
                              left: 70,
                              top: 16,
                              child: Text("Sıcaklık",
                                  style: TextStyle(color: Color(0xff949494)))),
                          Positioned(
                              left: 70,
                              top: 35,
                              child: Text(
                                temperature,
                                style: TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 21),
                              )),
                        ]))),
                SizedBox(
                    height: 80,
                    width: 165,
                    child: Card(
                        elevation: 0,
                        color: Color(0xffa8a8a8).withOpacity(0.1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Stack(children: [
                          //manual position using left, top, right, bottom
                          Positioned(
                              left: 5,
                              top: 10,
                              bottom: 10,
                              child: Container(
                                height: 60,
                                width: 60,
                                child: Image.asset("assets/tilt.png"),
                              )),
                          Positioned(
                              left: 70,
                              top: 16,
                              child: Text("Son titreşim",
                                  style: TextStyle(color: Color(0xff949494)))),
                          Positioned(
                              left: 70,
                              top: 35,
                              child: Text(tilt,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 21))),
                        ]))),
              ],
            ),
            InkWell(
                onTap: () {
                  print("tapped");
                },
                child: SizedBox(
                    height: 180,
                    width: 340,
                    child: Card(
                        elevation: 0,
                        color: Color(0xffa8a8a8).withOpacity(0.1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Stack(children: [
//
//
                          Positioned(
                              left: 12,
                              top: 10,
                              child: Text("Uçuş durumu: ",
                                  style: TextStyle(color: Color(0xff949494)))),
//
                          Positioned(
                              left: 107,
                              top: 10,
                              child: Text("UÇAKTA",
                                  style: TextStyle(
                                      color: Color(0xff87d163),
                                      fontWeight: FontWeight.w700))),
                          //
                          Positioned(
                              right: 10,
                              top: 10,
                              child: Text("Daha detaylı ",
                                  style: TextStyle(
                                      color: Color(0xffec1d35),
                                      fontWeight: FontWeight.w700,
                                      fontSize: 12))),
////
                          Positioned(
                              left: 10,
                              right: 10,
                              top: 40,
                              child: Image.asset("assets/flight_status_3.png")),
//
                          Positioned(
                            left: 30,
                            right: 30,
                            bottom: 10,
                            height: 70,
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 3, // 60% of space => (6/(6 + 4))
                                  child: Container(
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(globals.deplong,
                                              style: TextStyle(
                                                  color: Color(0xff949494),
                                                  fontSize: 11)),
                                          Text(globals.deptime,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 22)),
                                          Text(globals.departure,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 15))
                                        ]),
                                  ),
                                ),
                                Expanded(
                                  flex: 4, // 40% of space
                                  child: Container(
                                    child: Image.asset("assets/trajectory.png"),
                                  ),
                                ),
                                Expanded(
                                  flex: 3, // 40% of space
                                  child: Container(
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(globals.arrlong,
                                              style: TextStyle(
                                                  color: Color(0xff949494),
                                                  fontSize: 11)),
                                          Text(globals.arrtime,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 22)),
                                          Text(globals.arrival,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 15))
                                        ]),
                                  ),
                                )
                              ],
                            ),
                          )
                        ])))),
          ])
        ]));
  }
}
