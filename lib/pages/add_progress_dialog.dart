// IT17091626
// P.G.C.B. Samarakoon
// CTSE - SE4010
// Flutter Mobile App - Assignment

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:learn_git_app/dbhelper/database_helper.dart';
import 'package:learn_git_app/texts/progressModel.dart';

// References using to implement this code is listed as below
//
// '''Developerlibs.com ; Flutter-sqlite Database Example'''
// url : 'https://www.developerlibs.com/2018/07/flutter-sqlite-database-example.html'

// Dialog box get user inputs to add new progress and edit details
class AddProgressDialog {
  final teTopic = TextEditingController();
  final teDate = TextEditingController();
  ProgressModel progress;

  static const TextStyle linkStyle = const TextStyle(
    color: Colors.brown,
    decoration: TextDecoration.underline,
  );

  Widget buildDialog(BuildContext context, _progressState, bool isEdit,
      ProgressModel progress) {
    if (progress != null) {
      this.progress = progress;
      teTopic.text = progress.topic;
      teDate.text = progress.date;
    }

    return AlertDialog(
      title: Text(isEdit ? 'Edit Progress' : 'Set Progress'),
      content: SingleChildScrollView(
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              getTextArea("Enter Topic", teTopic),
              getTextArea("DD-MM-YYYY", teDate),
              GestureDetector(
                onTap: () {
                  addProgress(isEdit);
                  _progressState.displayProgress();
                  Navigator.of(context).pop();
                },
                child: Container(
                  margin: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                  child: getbtn(isEdit ? 'EDIT' : 'ADD',
                      EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0)),
                ),
              ),
            ]),
      ),
    );
  }

  /// Widget for make textfields
  Widget getTextArea(
      String inputBName, TextEditingController inputBController) {
    var loginBtn = Padding(
      padding: EdgeInsets.all(5.0),
      child: TextFormField(
        controller: inputBController,
        decoration: InputDecoration(
          hintText: inputBName,
        ),
      ),
    );

    return loginBtn;
  }

  /// Widget to make add an edit buttons
  Widget getbtn(String btnLabel, EdgeInsets margin) {
    var loginBtn = Container(
      margin: margin,
      padding: EdgeInsets.all(8.0),
      alignment: FractionalOffset.center,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue),
        borderRadius: BorderRadius.all(Radius.circular(6.0)),
      ),
      child: Text(
        btnLabel,
        style: TextStyle(
          color: Colors.black,
          fontSize: 20.0,
          fontWeight: FontWeight.w300,
          letterSpacing: 0.3,
        ),
      ),
    );
    return loginBtn;
  }

  /// Add and update records
  Future addProgress(bool isEdit) async {
    var db = new DatabaseHelper();
    var progress = new ProgressModel(teTopic.text, teDate.text);
    if (isEdit) {
      progress.setID(this.progress.pid);
      await db.updateProgress(progress);
    } else {
      await db.saveProgress(progress);
    }
  }
}
