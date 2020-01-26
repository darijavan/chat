import 'dart:io';

import 'package:mobile/src/model/user.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static final _databaseName = "MyDatabase.db";
  static final _databaseVersion = 1;

  static final tableUser = 'user';

  static final columnId = '_id';
  static final columnUsername = 'username';
  static final columnPassword = 'age';
  static final columnIsConnected = 'isConnected';

  // make this a singleton class
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // only have a single app-wide reference to the database
  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    // lazily instantiate the db the first time it is accessed
    _database = await _initDatabase();
    return _database;
  }

  // this opens the database (and creates it if it doesn't exist)
  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $tableUser (
            $columnId INTEGER PRIMARY KEY,
            $columnUsername TEXT NOT NULL,
            $columnPassword INTEGER NOT NULL,
            $columnIsConnected INTEGER UNIQUE
          )
          ''');
  }

  // Helper methods

  // ----- Helpers for user table ----- //
  /// Get the current user that is logged in
  Future<User> get currentUser async {
    Database database = await instance.database;
    Map<String, dynamic> currentUser = (await database.rawQuery(
                'SELECT * FROM ${DatabaseHelper.tableUser} WHERE ${DatabaseHelper.columnIsConnected} = 1'))[
            0] ??
        null;
    return User.fromMap(currentUser);
  }

  /// Get the list of all users that are stored in the local database
  Future<List<User>> get allUsers async {
    Database database = await instance.database;
    List<Map<String, dynamic>> users = await database.query(tableUser);
    return users.map((user) => User.fromMap(user)).toList();
  }

  /// Insert new user to the local storage
  Future<int> insertUser(User user) async {
    Database database = await instance.database;
    return await database.insert(tableUser, user.toMap());
  }

  /// Update user details (the provided user in parameter must contains the id key)
  Future<int> updateUser(User user) async {
    Database database = await instance.database;
    return await database.update(tableUser, user.toMap());
  }
}
