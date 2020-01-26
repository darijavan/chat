import 'package:flutter/material.dart';
import 'package:mobile/src/helper/user_helper.dart';
import 'package:mobile/src/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserModel extends ChangeNotifier {
  User _currentUser;

  Future<User> get currentUser async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (preferences.getBool('isLoggedIn') ?? false)
      _currentUser = await UserHelper.instance.currentUser;
    return _currentUser;
  }

  logIn(User user) {}

  Future logOut() async => await UserHelper.instance.logOut();

  setUser(User user) {
    _currentUser = user;
    notifyListeners();
  }
}
