import 'package:flutter/material.dart';
import 'package:learn_git_app/dbhelper/database_helper.dart';
import 'package:learn_git_app/texts/texts.dart';

// Class: Diplay content data
class Content extends StatefulWidget {
  @override
  _ContentState createState() => _ContentState();
}

class _ContentState extends State<Content> {
  //data received from Toc page
  Map dataFromToc = {};

  //reference to DatabaseHelper class
  DatabaseHelper db;

  //to retrieve datafrom database
  var record;

  //get Note data by id
  getNoteData(id) async {
    try {
      record = await db.getNote(id);
    } catch (DatabaseException) {
      print('Database Error');
    }
  }

  //navigate to Note page
  navigateToNote() async {
    await getNoteData(dataFromToc['id']);
    if (record != null) {
      var recordMap = new Texts.dbTexts(record.id, record.note, record.rating);
      Map map = recordMap.toMap();
      // print('\n');
      // print('record id: ${map['id']}');
      // print('record note: ${map['note']}');
      // print('record rating: ${map['rating']}');
      // print('record record: $record');
      Navigator.pushNamed(context, '/note', arguments: {
        'id': map['id'],
        'note': map['note'],
        'rating': map['rating']
      });
    } else {
      Navigator.pushNamed(context, '/note',
          arguments: {'id': dataFromToc['id'], 'note': '', 'rating': ''});
      print('record is null, id: ${dataFromToc['id']}');
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    //create new instance of DatabaseHelper class 
    db = new DatabaseHelper();

    //receive data from Toc page through the context object
    dataFromToc = dataFromToc.isNotEmpty
        ? dataFromToc
        : ModalRoute.of(context).settings.arguments;
    // final data = dataFromToc;
    // print('data: ${data['header']}');

    return Scaffold(
        backgroundColor: Colors.grey[50],
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: Text(dataFromToc['header']),
          centerTitle: true,
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Center(
                  child: Text(dataFromToc['textInside'],
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ),
              SizedBox(height: 20),
              RaisedButton(
                onPressed: () {
                  navigateToNote();
                },
                child: Text('MORE'),
              ),
            ],
          ),
        ));
  }

  @override
  void dispose() {
    
    //close database
    db.close();
    super.dispose();
  }
}
