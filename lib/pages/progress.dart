import 'dart:async';
import 'package:flutter/material.dart';
//import 'package:learn_git_app/dbhelper/database_helper.dart';
import 'package:learn_git_app/pages/progress_list.dart';
import 'package:learn_git_app/texts/progressModel.dart';
import 'package:learn_git_app/pages/add_progress_dialog.dart';
import 'package:learn_git_app/pages/progress_present.dart';

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

  Future addProgressDialog() async {
    showDialog(
      context: context,
      builder: (BuildContext context) =>
          AddProgressDialog().buildDialog(context, this, false, null),
    );

    setState(() {});
  }

  @override
  void screenUpdate() {
    setState(() {});
  }
}
