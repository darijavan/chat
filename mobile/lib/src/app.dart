import 'package:flutter/material.dart';
import 'package:mobile/src/view/screen/splash.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
