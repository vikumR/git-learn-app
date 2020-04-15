import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:learn_git_app/texts/texts.dart';
import 'package:learn_git_app/dbhelper/database_helper.dart';
import 'package:fluttertoast/fluttertoast.dart';

// Class: Handle note data
class Note extends StatefulWidget {
  @override
  _NoteState createState() => _NoteState();
}

class _NoteState extends State<Note> {

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
      backgroundColor: Colors.red,
      textColor: Colors.white,
      gravity: ToastGravity.BOTTOM,
    );
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
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Note'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                    decoration: InputDecoration(hintText: 'Add Note...'),
                    onSubmitted: (String str) {
                      setState(() {
                        note = str;
                      });
                      controller.text = '';
                    },
                    controller: controller),
              ),
              SizedBox(height: 10),
              Text(note),
              SizedBox(height: 10),
              Center(
                  child: SmoothStarRating(
                rating: rating,
                size: 50,
                filledIconData: Icons.star,
                halfFilledIconData: Icons.star_half,
                defaultIconData: Icons.star_border,
                starCount: 5,
                // color: Colors.redAccent,
                // borderColor: Colors.black,
                allowHalfRating: false,
                spacing: 2.0,
                onRatingChanged: (value) {
                  setState(() {
                    rating = value;
                  });
                },
              )),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RaisedButton(
                      onPressed: () {
                        addRecord(data['id']);
                      },
                      child: Text('ADD'),
                    ),
                    RaisedButton(
                      onPressed: () {
                        updateRecord(data['id']);
                      },
                      child: Text('UPDATE'),
                    ),
                    RaisedButton(
                      onPressed: () {
                        deleteRecord(data['id']);
                      },
                      child: Text('DELETE'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    db.close();
    super.dispose();
  }
}
