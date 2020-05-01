import 'dart:async';

import 'package:learn_git_app/texts/progressModel.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:learn_git_app/texts/texts.dart';

class DatabaseHelper {
  // static final DatabaseHelper _instance = new DatabaseHelper.internal();

  // factory DatabaseHelper() => _instance;

  // static Database _db;

  // DatabaseHelper.internal();

  final String tableLearnGit = 'learnGitTable';
  final String columnId = 'id';
  final String columnNote = 'note';
  final String columnRating = 'rating';

  final String tableProgress = 'progressTable';
  final String columnPid = 'pid';
  final String columnTopic = 'topic';
  final String columnDate = 'date';

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
    String path = join(databasesPath, 'learn-git-app2.db');

    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  //execute query on database creation
  void _onCreate(Database db, int newVersion) async {
    await db.execute(
        '''CREATE TABLE $tableLearnGit($columnId INTEGER PRIMARY KEY, $columnNote TEXT, $columnRating REAL)''');
    await db.execute(
        '''CREATE TABLE $tableProgress($columnPid INTEGER PRIMARY KEY, $columnTopic TEXT, $columnDate TEXT)''');
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

  //-------------------------------------------------------------------------------------------------------------------
  //save progress record
  Future<int> saveProgress(ProgressModel progress) async {
    var dbClient = await db;
    int res = await dbClient.insert('$tableProgress', progress.toMap());
    return res;
  }

  //get progress list
  Future<List<ProgressModel>> getProgress() async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM $tableProgress');
    List<ProgressModel> progresses = new List();
    for (int i = 0; i < list.length; i++) {
      var progress = new ProgressModel(list[i]['topic'], list[i]['date']);
      progress.setID(list[i]['pid']);
      progresses.add(progress);
    }
    print(progresses.length);
    return progresses;
  }

  //delete progress
  Future<int> deleteProgress(ProgressModel progress) async {
    var dbClient = await db;

    int res = await dbClient.rawDelete(
        'DELETE FROM $tableProgress WHERE $columnPid = ?', [progress.pid]);
    return res;
  }

  //update progress
  Future<bool> updateProgress(ProgressModel progress) async {
    var dbClient = await db;
    int res = await dbClient.update(tableProgress, progress.toMap(),
        where: '$columnPid = ?', whereArgs: <int>[progress.pid]);
    return res > 0 ? true : false;
  }
  //-------------------------------------------------------------------------------------------------------------------

  // close database
  Future close() async {
    var dbClient = await db;
    return dbClient.close();
  }
}
