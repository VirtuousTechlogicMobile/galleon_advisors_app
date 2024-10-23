import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:galleon_user/helper/database_helper/database_synonyms.dart';
import 'package:galleon_user/helper/sqlite_database_helper/sqlite_queries_helper.dart';
import 'package:galleon_user/modules/create_new_study/model/study_data_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqliteDatabaseHelper {
  SqliteDatabaseHelper._();

  static final _instance = SqliteDatabaseHelper._();

  static SqliteDatabaseHelper get instance => _instance;

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

  Future<bool?> isTableExists(String tableName) async {
    try {
      bool isTableExists = false;
      String tableExistsQuery = SqliteQueriesHelper.tableExistsQuery();
      List<Map<String, Object?>>? tablesList = await databaseReference?.rawQuery(tableExistsQuery);
      if (tablesList != null) {
        for (var tables in tablesList) {
          if (tables["tbl_name"] == tableName) {
            isTableExists = true;
            break;
          }
        }
      } else {
        return false;
      }
      return isTableExists;
    } catch (e) {
      log("Exception: $e", name: tag);
      return false;
    }
  }

  Future createStudyTable() async {
    try {
      String createTableQuery = SqliteQueriesHelper.createTableSqlQuery(DatabaseSynonyms.studyCollection, StudyDataModel.toFields());
      await databaseReference?.execute(createTableQuery);
    } catch (e) {
      log("Exception: $e", name: tag);
    }
  }
}
