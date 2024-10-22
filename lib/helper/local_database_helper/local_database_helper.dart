import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class LocalDatabaseHelper {
  LocalDatabaseHelper._();

  static final _instance = LocalDatabaseHelper._();

  static LocalDatabaseHelper get instance => _instance;

  String tag = "local database helper";

  Database? databaseReference;

  Future openGalleonDatabase() async {
    WidgetsFlutterBinding.ensureInitialized();
    String db = await getDatabasesPath();
    databaseReference = await openDatabase(
      join(db, "galleon_app.db"),
      version: 1,
      onCreate: _onCreateDatabase,
    );
  }

  Future<void> _onCreateDatabase(Database db, int version) async {}

  Future createTableStudy() async {}
}
