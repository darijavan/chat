import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile/src/app.dart';

void main() {
  runApp(MyApp());

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}
