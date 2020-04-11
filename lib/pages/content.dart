import 'package:flutter/material.dart';

class Content extends StatefulWidget {
  @override
  _ContentState createState() => _ContentState();
}

class _ContentState extends State<Content> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;

    // print('data: ${data['header']}');

    return Scaffold(
        backgroundColor: Colors.grey[400],
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: Text(data['header']),
          centerTitle: true,
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              // SizedBox(height: 100.0),
              Center(
                child: Text(data['textInside'],
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold)
                ),
              ),
            ],
          ),  
        )
        );
  }
}
