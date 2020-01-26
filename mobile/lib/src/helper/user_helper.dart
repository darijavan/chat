import 'package:mobile/src/helper/db_helper.dart';
import 'package:mobile/src/model/user.dart';

class UserHelper {
  UserHelper._privateConstructor();

  DatabaseHelper dbhelper = DatabaseHelper.instance;

  static UserHelper get instance => UserHelper._privateConstructor();

  Future<User> get currentUser async => await dbhelper.currentUser;

  Future<int> logIn(User user) async {
    if (await currentUser != null)
      throw UserLogException('There\'s already a logged in user account',
          UserLogExceptionType.ALREADY_LOGGED_IN);
    user.isConnected = true;
    return await dbhelper.updateUser(user);
  }

  Future<int> logOut() async {
    User user = await currentUser;
    user.isConnected = false;
    return await dbhelper.updateUser(user);
  }
}

enum UserLogExceptionType {
  UNDEFINED,
  ALREADY_LOGGED_IN,
  LOGIN_FAILED,
}

class UserLogException implements Exception {
  final String message;

  final UserLogExceptionType type;

  UserLogException([
    this.message = 'User log exception',
    this.type = UserLogExceptionType.UNDEFINED,
  ]);
}
