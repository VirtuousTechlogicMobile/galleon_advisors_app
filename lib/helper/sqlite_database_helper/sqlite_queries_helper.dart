class SqliteQueriesHelper {
  static String createTableSqlQuery(String tableName, Map<String, String> fields) {
    // Join all field names and types into a SQL column definition
    String columns = fields.entries.map((entry) => '${entry.key} ${entry.value}').join(', ');

    // Return the full CREATE TABLE statement
    return 'CREATE TABLE $tableName ($columns)';
  }

  static String tableExistsQuery() {
    return '''select * from sqlite_master where type = 'table' ''';
  }
}
