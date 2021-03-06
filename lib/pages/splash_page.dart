import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_task/pages/home.dart';
// import 'package:retailer_app/pages/login_registerUser/login_page.dart';
// import 'package:retailer_app/pages/navigation/navigation.dart';
// import 'package:retailer_app/pages/utils/constants.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  static var tag = 'splash-page';

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool isLogin = false;
  late Timer _startTimer;

  @override
  void initState() {
    startTime();
    super.initState();
  }

  @override
  void dispose() {
    _startTimer.cancel();
    super.dispose();
  }

  void startTime() async {
    var _duration = Duration(milliseconds: 5000);
    _startTimer = Timer(_duration, navigationPage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/progress.gif",
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Shopping App",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.lightBlue),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed(MyHomePage.tag);
  }

  // void checkLogin() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   isLogin = prefs.getBool(Constants.KEY_IS_LOGIN) ?? false;
  // }
}
