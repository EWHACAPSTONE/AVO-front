import 'package:avo_front/notification.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

void onOFF() {}

void goToSetting() {}

class _HomePageState extends State<HomePage> {
  void initState() {
    // 초기화
    FlutterLocalNotification.init();

    // 3초 후 권한 요청
    Future.delayed(const Duration(seconds: 1),
        FlutterLocalNotification.requestNotificationPermission());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Center(
            child: Column(
      children: [
        Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.fromLTRB(10, 70, 0, 0),
            child: Image(image: AssetImage('images/logo.png'), width: w * 0.3)),
        Image(image: (AssetImage('images/avo_4.png')), width: w * 0.9),
        ElevatedButton(
            onPressed: () =>
              FlutterLocalNotification.showNotification(),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(10),
              minimumSize: Size(w * 0.9, h * 0.2),
              maximumSize: Size(w * 0.9, h * 0.2),
              backgroundColor: Color(0xffBAD7B3),
              elevation: 5,
              textStyle: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.normal,
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
            ),
            child: Column(
              children: [
                Text("AVO ON/OFF",
                    style: TextStyle(
                        color: Color(0xff000000),
                        fontFamily: 'NanumSquare',
                        fontWeight: FontWeight.w600)),
                SizedBox(height: 20.0),
                Image(
                  image: (AssetImage('images/icons/on_off.png')),
                  width: w * 0.2,
                ),
              ],
            )),
        SizedBox(height: 30.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
                onPressed: () {
                  Get.toNamed('/setting');
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(10),
                  minimumSize: Size(w * 0.45, h * 0.3),
                  maximumSize: Size(w * 0.45, h * 0.3),
                  backgroundColor: Color(0xffBAD7B3),
                  elevation: 5,
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                ),
                child: Column(
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      const Text("AVO\n알림설정",
                          style: TextStyle(
                              color: Color(0xff000000),
                              fontFamily: 'NanumSquare',
                              fontWeight: FontWeight.w600))
                    ]),
                    SizedBox(height: 30.0),
                    Image(
                      image: (AssetImage('images/icons/alarm.png')),
                      width: w * 0.3,
                    ),
                  ],
                )),
            ElevatedButton(
                onPressed: () {
                  onOFF();
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(10),
                  minimumSize: Size(w * 0.45, h * 0.3),
                  maximumSize: Size(w * 0.45, h * 0.3),
                  backgroundColor: Color(0xffBAD7B3),
                  elevation: 5,
                  textStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      color: Colors.black),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                ),
                child: Column(
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      Text("About\nAVO",
                          style: TextStyle(
                              color: Color(0xff000000),
                              fontFamily: 'NanumSquare',
                              fontWeight: FontWeight.w600))
                    ]),
                    SizedBox(height: 30.0),
                    Image(
                        image: (AssetImage('images/icons/information.png')),
                        width: w * 0.3),
                  ],
                )),
          ],
        )
      ],
    )));
  }
}