/*
Registration Number: IT17009164
Name: Mahanthe V.R.B.
References: 1. https://flutter.dev/docs
            2. www.youtube.com/watch?v=1ukSR1GRtMU&list=PL4cUxeGkcC9jLYyp2Aoh6hcWuxFDX6PBJ
*/

import 'package:flutter/material.dart';
import 'package:learn_git_app/pages/help.dart';
import 'package:learn_git_app/pages/progress.dart';
import 'package:learn_git_app/texts/texts.dart';

//Class: Table Of Contents
class Toc extends StatefulWidget {
  @override
  _TocState createState() => _TocState();
}

class _TocState extends State<Toc> {
  //navigate to content page with data retrieved for the respective id from database
  void navigateToContent(index) {
    Texts instance = allTexts[index];
    Navigator.pushNamed(context, '/content', arguments: {
      'id': instance.id,
      'header': instance.header,
      'textInside': instance.textInside
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent[100],
      appBar: AppBar(
        backgroundColor: Colors.amber[800],
        title: Text(
          'Learn GIT',
          style: TextStyle(
            fontFamily: 'Smilen-gKW6',
            fontSize: 50.0,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        actions: <Widget>[
          PopupMenuButton(
            itemBuilder: (content) => [
              PopupMenuItem(
                value: 1,
                child: Text(
                  'SET PROGRESS',
                  style: TextStyle(
                    fontFamily: 'AveriaGruesaLibre',
                    fontWeight: FontWeight.w800,
                    color: Colors.lime[800],
                  ),
                ),
              ),
              PopupMenuItem(
                value: 2,
                child: Text(
                  'HELP',
                  style: TextStyle(
                    fontFamily: 'AveriaGruesaLibre',
                    fontWeight: FontWeight.w800,
                    color: Colors.lime[800],
                  ),
                ),
              ),
            ],
            onSelected: (int menu) {
              if (menu == 1) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Progress()));
              } else if (menu == 2) {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Help()));
              }
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(5.0, 8.0, 5.0, 5.0),
        child: ListView.builder(
          itemCount: allTexts.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 2.0),
              child: Card(
                color: Colors.limeAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(35.0),
                ),
                child: ListTile(
                  onTap: () {
                    navigateToContent(index);
                  },
                  title: Text(
                    allTexts[index].header,
                    style: TextStyle(
                      fontFamily: 'Oregano',
                      fontWeight: FontWeight.w800,
                      fontSize: 20.0,
                      color: Colors.orange[900],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
