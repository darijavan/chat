import 'package:mobile/src/helper/db_helper.dart';

class User {
  int id;
  String username;
  String password;
  bool isConnected;

  User({
    this.id,
    this.username,
    this.password,
    this.isConnected,
  });

  factory User.fromMap(Map<String, dynamic> data) => User(
        id: data[DatabaseHelper.columnId],
        username: data[DatabaseHelper.columnUsername],
        password: data[DatabaseHelper.columnPassword],
        isConnected: data[DatabaseHelper.columnIsConnected],
      );

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();

    map[DatabaseHelper.columnId] = id;
    map[DatabaseHelper.columnUsername] = username;
    map[DatabaseHelper.columnPassword] = password;
    map[DatabaseHelper.columnIsConnected] = isConnected ? 0 : 1;

    return map;
  }
}
