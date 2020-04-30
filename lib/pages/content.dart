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

    return Scaffold(
      backgroundColor: Colors.amber[100],
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text(
          dataFromToc['header'],
          style: TextStyle(
            fontFamily: 'Oregano',
            fontWeight: FontWeight.w800,
            fontSize: 23.0,
            color: Colors.orange[900],
          ),
        ),
        centerTitle: true,
      ),
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return SingleChildScrollView(
            child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: viewportConstraints.maxHeight,
          ),
          child: Column(
            // direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 60),
                child: Center(
                  child: Text(
                    dataFromToc['textInside'],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'AveriaGruesaLibre',
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      fontSize: 17.0,
                      color: Colors.redAccent[700],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ));
      }),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          navigateToNote();
        },
        label: Text(
          'ADD NOTE',
          style: TextStyle(
            fontFamily: 'AveriaGruesaLibre',
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        icon: Icon(Icons.note_add),
        backgroundColor: Colors.orange[900],
      ),
    );
  }

  @override
  void dispose() {
    //close database
    db.close();
    super.dispose();
  }
}
