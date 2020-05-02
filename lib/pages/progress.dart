// IT17091626
// P.G.C.B. Samarakoon
// CTSE - SE4010
// Flutter Mobile App - Assignment

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:learn_git_app/pages/progress_list.dart';
import 'package:learn_git_app/texts/progressModel.dart';
import 'package:learn_git_app/pages/add_progress_dialog.dart';
import 'package:learn_git_app/pages/progress_present.dart';

// References using to implement this code is listed as below
//
// '''Developerlibs.com ; Flutter-sqlite Database Example'''
// url : 'https://www.developerlibs.com/2018/07/flutter-sqlite-database-example.html'

// Main screen for displaying progress records and other related functionalities.
class Progress extends StatefulWidget {
  @override
  _ProgressState createState() => _ProgressState();
}

class _ProgressState extends State<Progress> implements ProgressContract {
  ProgressPresent progressPresent;

  @override
  void initState() {
    super.initState();
    progressPresent = new ProgressPresent(this);
  }

  /// Display method for progress list
  displayProgress() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[100],
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text(
          'SET   PROGRESS',
          style: TextStyle(
            fontFamily: 'Oregano',
            fontWeight: FontWeight.w800,
            fontSize: 20.0,
            color: Colors.orange[900],
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add_circle),
            color: Colors.white,
            onPressed: () {
              addProgressDialog();
            },
          ),
        ],
      ),
      
      /// Dispaly list of records after adding to the databse
      body: FutureBuilder<List<ProgressModel>>(
        future: progressPresent.getProgress(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          var data = snapshot.data;
          return snapshot.hasData
              ? new ProgressList(data, progressPresent)
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }

  /// Make dialog box for add new progress record
  Future addProgressDialog() async {
    showDialog(
      context: context,
      builder: (BuildContext context) =>
          AddProgressDialog().buildDialog(context, this, false, null),
    );

    setState(() {});
  }

  /// Update the screen after the adding new record
  @override
  void screenUpdate() {
    setState(() {});
  }
}
