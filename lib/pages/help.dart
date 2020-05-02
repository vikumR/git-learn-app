// IT17091626
// P.G.C.B. Samarakoon
// CTSE - SE4010
// Flutter Mobile App - Assignment
import 'package:flutter/material.dart';

// Page for list out user guide
class Help extends StatefulWidget {
  @override
  _HelpState createState() => _HelpState();
}

class _HelpState extends State<Help> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.amber[100],
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: Text(
            'HELP',
            style: TextStyle(
              fontFamily: 'Oregano',
              fontWeight: FontWeight.w800,
              fontSize: 25.0,
              color: Colors.orange[900],
            ),
          ),
          centerTitle: true,
        ),
        body: ListView(
          padding: const EdgeInsets.all(8),
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Container(
              height: 90,
              color: Colors.lightBlue[200],
              child: const Center(
                  child: Text(
                'This Application contains GIT learning tutorial.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 23.0,
                  fontFamily: 'oregano',
                  fontWeight: FontWeight.w800,
                  color: Colors.brown,
                ),
              )),
            ),
            Divider(
              height: 20.0,
              color: Colors.grey[850],
            ),
            Container(
              height: 90,
              color: Colors.lightBlue[100],
              child: const Center(
                  child: Text(
                'All lessons are organized in a TOC (Table Of Content) manner.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22.0,
                  fontFamily: 'oregano',
                  fontWeight: FontWeight.w800,
                  color: Colors.brown,
                ),
              )),
            ),
            Divider(
              height: 20.0,
              color: Colors.grey[850],
            ),
            Container(
              height: 90,
              color: Colors.lightBlue[50],
              child: const Center(
                  child: Text(
                'You can add a spesific note to each lesson, using the "Add Note" icon on the lesson content page.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22.0,
                  fontFamily: 'oregano',
                  fontWeight: FontWeight.w800,
                  color: Colors.brown,
                ),
              )),
            ),
            Divider(
              height: 20.0,
              color: Colors.grey[850],
            ),
            Container(
              height: 90,
              color: Colors.lightBlue[200],
              child: const Center(
                  child: Text(
                'UPDATE and DELETE operations for preiviously entered notes could be done using the "UPDATE" and "DELETE" buttons on the note input screen.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  fontFamily: 'oregano',
                  fontWeight: FontWeight.w800,
                  color: Colors.brown,
                ),
              )),
            ),
            Divider(
              height: 20.0,
              color: Colors.grey[850],
            ),
            Container(
              height: 90,
              color: Colors.lightBlue[100],
              child: const Center(
                  child: Text(
                'You can track your progress on "SET PROGRESS" page in the popup menu which located in top right corner of the app bar.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  fontFamily: 'oregano',
                  fontWeight: FontWeight.w800,
                  color: Colors.brown,
                ),
              )),
            ),
            Divider(
              height: 20.0,
              color: Colors.grey[850],
            ),
            Container(
              height: 90,
              color: Colors.lightBlue[50],
              child: const Center(
                  child: Text(
                'UPDATE and DELETE operations for preiviously set progress records could be done using the "UPDATE" and "DELETE" icons on the each progress record.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  fontFamily: 'oregano',
                  fontWeight: FontWeight.w800,
                  color: Colors.brown,
                ),
              )),
            ),
            Divider(
              height: 20.0,
              color: Colors.grey[850],
            ),
          ],
        ));
  }
}
