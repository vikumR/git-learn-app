/*
IT17009164-Mahanthe V.R.B.
IT17091626-P.G.C.B. Samarakoon
References: 1. https://flutter.dev/docs
            2. www.youtube.com/watch?v=1ukSR1GRtMU&list=PL4cUxeGkcC9jLYyp2Aoh6hcWuxFDX6PBJ
            3. https://grokonez.com/flutter/flutter-sqlite-example-crud-sqflite-example
*/

import 'package:flutter/material.dart';
import 'package:learn_git_app/pages/content.dart';
import 'package:learn_git_app/pages/toc.dart';
import 'package:learn_git_app/pages/note.dart';
import 'package:learn_git_app/pages/welcome.dart';
import 'package:learn_git_app/pages/progress.dart';
import 'package:learn_git_app/pages/help.dart';

void main() => runApp(MaterialApp(
    initialRoute: '/welcome',
    routes: {
      '/welcome': (context) => Welcome(),
      '/home': (context) => Toc(),
      '/content': (context) => Content(),
      '/note': (context) => Note(),
      '/progress': (context) => Progress(),
      '/help': (context) => Help(),
    },
    debugShowCheckedModeBanner: false));
