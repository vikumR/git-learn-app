import 'package:flutter/material.dart';
import 'package:learn_git_app/texts/texts.dart';
import 'package:learn_git_app/dbhelper/database_helper.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Progress extends StatefulWidget {
  @override
  _ProgressState createState() => _ProgressState();
}

class _ProgressState extends State<Progress> {
  //reference to DatabaseHelper class
  DatabaseHelper db;

  //data received from Content page
  Map data = {};

  //value of rating
  double rating = 0.0;

  //note
  String note = '';

  //to controll text editor
  final TextEditingController controller = new TextEditingController();

  //get note from database
  Future getRecord(id) async {
    try {
      return await db.getNote(id);
    } catch (DatabaseException) {
      print('Database Error');
    }
  }

  //add note to database
  Future<void> addRecord(id) async {
    if (await getRecord(id) != null) {
      showToast('Added already! Update instead');
      print('Added already! Update instead');
      return;
    }
    if (note != '') {
      try {
        Texts textsObj = new Texts.dbTexts(id, note, rating);
        await db.saveNote(textsObj);
        showToast('Record added!');
        print('Record added!');
      } catch (DatabaseException) {
        print('Database Error');
      }
    }
  }

  //update note in database
  Future<void> updateRecord(id) async {
    if (await getRecord(id) == null) {
      showToast('Can not update! Add first');
      print('Can not update! Add first');
    } else {
      try {
        Texts textsObj = new Texts.dbTexts(id, note, rating);
        await db.updateNote(textsObj);
        showToast('Record updated!');
        print('Record updated!');
      } catch (DatabaseException) {
        print('Database Error');
      }
    }
  }

  // delete note from database
  Future<void> deleteRecord(id) async {
    if (await getRecord(id) == null) {
      showToast('Can not delete! Add first');
      print('Can not delete! Add first');
      return;
    } else {
      try {
        await db.deleteNote(id);
        showToast('Record deleted!');
        print('Record deleted!');
        setState(() {
          rating = 0.0;
          note = '';
        });
      } catch (DatabaseException) {
        print('Database Error');
      }
    }
  }

  //show toast message
  void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      backgroundColor: Colors.redAccent,
      textColor: Colors.white,
      fontSize: 21.0,
      gravity: ToastGravity.BOTTOM,
    );
  }

  void create(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Add Completed Lesson"),
            actions: <Widget>[
              FlatButton(
                  child: Text('Cancel'),
                  onPressed: () => Navigator.of(context).pop()),
              FlatButton(
                child: Text('Save'),
                onPressed: () {
                  addRecord(data['id']);
                },
              )
            ],
            content: TextField(
              autofocus: true,
              decoration: InputDecoration(
                  labelText: 'Lesson', hintText: 'Type Here...'),

              //onChanged: (value) { _task = value; },
            ),
          );
        });
  }

  @override
  void initState() {
    super.initState();
    db = new DatabaseHelper();
  }

  @override
  Widget build(BuildContext context) {
    if (data.isNotEmpty) {
      data = data;
    } else {
      data = ModalRoute.of(context).settings.arguments;
      if (data['note'] != '' && data['rating'] != '') {
        note = data['note'];
        rating = data['rating'];
      }
    }

    return Scaffold(
      backgroundColor: Colors.amberAccent[100],
      appBar: AppBar(
        backgroundColor: Colors.amber[800],
        title: Text(
          'PROGRESS',
          style: TextStyle(
            fontFamily: 'AveriaGruesaLibre',
            fontSize: 30.0,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            create(context);
          }),
    );
  }
}
