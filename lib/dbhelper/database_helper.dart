import 'dart:async';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:learn_git_app/texts/texts.dart';

class DatabaseHelper {

  final String tableLearnGit = 'learnGitTable';
  final String columnId = 'id';
  final String columnNote = 'note';
  final String columnRating = 'rating';

  //instance of Database class
  Database _db;

  //return database
  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();

    return _db;
  }

  //initialize database
  initDb() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'learn-git-app.db');

    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  //execute query on database creation
  void _onCreate(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $tableLearnGit($columnId INTEGER PRIMARY KEY, $columnNote TEXT, $columnRating REAL)');
  }

  //save a record
  Future<int> saveNote(Texts textsObj) async {
    var dbClient = await db;
    var result = await dbClient.insert(tableLearnGit, textsObj.toMap());
    return result;
  }

  // retrieve a record by id
  Future<Texts> getNote(int id) async {
    var dbClient = await db;
    List<Map> result = await dbClient.query(tableLearnGit,
        columns: [columnId, columnNote, columnRating],
        where: '$columnId = ?',
        whereArgs: [id]);

    if (result.length > 0) {
      return new Texts.fromMap(result.first);
    }
    return null;
  }

  // retrieve all records
  Future<List> getAllNotes() async {
    var dbClient = await db;
    var result = await dbClient
        .query(tableLearnGit, columns: [columnId, columnNote, columnRating]);
    return result.toList();
  }

  //delete record
  Future<int> deleteNote(int id) async {
    var dbClient = await db;
    return await dbClient
        .delete(tableLearnGit, where: '$columnId = ?', whereArgs: [id]);
  }

  //update record
  Future<int> updateNote(Texts textsObj) async {
    var dbClient = await db;
    return await dbClient.update(tableLearnGit, textsObj.toMap(),
        where: "$columnId = ?", whereArgs: [textsObj.id]);
  }

  // close database
  Future close() async {
    var dbClient = await db;
    return dbClient.close();
  }
}
