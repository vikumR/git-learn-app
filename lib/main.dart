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
