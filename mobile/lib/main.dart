import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile/src/app.dart';
import 'package:mobile/src/provider/user.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (BuildContext context) => UserModel(),
      child: MyApp(),
    ),
  );

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}
