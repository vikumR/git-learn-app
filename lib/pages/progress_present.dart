import 'dart:async';
import 'package:learn_git_app/dbhelper/database_helper.dart';
import 'package:learn_git_app/texts/progressModel.dart';

abstract class ProgressContract {
  void screenUpdate();
}

class ProgressPresent {
  ProgressContract _view;
  var db = new DatabaseHelper();
  ProgressPresent(this._view);
  delete(ProgressModel progress) {
    var db = new DatabaseHelper();
    db.deleteProgress(progress);
    updateScreen();
  }

  Future<List<ProgressModel>> getProgress() {
    return db.getProgress();
  }

  updateScreen() {
    _view.screenUpdate();
  }
}
