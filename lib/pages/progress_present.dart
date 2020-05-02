// IT17091626
// P.G.C.B. Samarakoon
// CTSE - SE4010
// Flutter Mobile App - Assignment

import 'dart:async';
import 'package:learn_git_app/dbhelper/database_helper.dart';
import 'package:learn_git_app/texts/progressModel.dart';

// References using to implement this code is listed as below
//
// '''Developerlibs.com ; Flutter-sqlite Database Example'''
// url : 'https://www.developerlibs.com/2018/07/flutter-sqlite-database-example.html'

abstract class ProgressContract {
  void screenUpdate();
}

// Business layer of srt progress operations
//
// Contains the CRUD opreatins that invoke from add Progress dialog widget and,
// from the main progress list displaying screen
class ProgressPresent {
  ProgressContract _view;
  var db = new DatabaseHelper();
  ProgressPresent(this._view);
  
  /// Invoking delete and update operations
  delete(ProgressModel progress) {
    var db = new DatabaseHelper();
    db.deleteProgress(progress);
    updateScreen();
  }

  /// Invoking select operation
  Future<List<ProgressModel>> getProgress() {
    return db.getProgress();
  }

  /// Method for updating the list
  updateScreen() {
    _view.screenUpdate();
  }
}
