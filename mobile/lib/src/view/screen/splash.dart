import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobile/src/util/route.dart';
import 'package:mobile/src/view/screen/home.dart';
import 'package:mobile/src/view/screen/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    SharedPreferences.getInstance().then((SharedPreferences prefs) {
      Widget targetScreen;

      final bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
      if (!isLoggedIn)
        targetScreen = LoginScreen();
      else
        targetScreen = HomeScreen();
      Timer(Duration(seconds: 2), () {
        RouteUtils.goTo(
          context: context,
          child: targetScreen,
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Image(
            width: 120,
            image: AssetImage(
              "assets/images/logo.png",
            ),
          ),
        ),
      ),
    );
  }
}
