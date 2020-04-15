import 'package:flutter/material.dart';
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
    // print(instance);
    Navigator.pushNamed(context, '/content', arguments: {
      'id': instance.id,
      'header': instance.header,
      'textInside': instance.textInside
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Topic'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: allTexts.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 1.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  navigateToContent(index);
                  // print(allTexts[index].);
                },
                title: Text(
                  allTexts[index].header,
                  style: TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                // leading: CircleAvatar(
                //   
                // )
              ),
            ),
          );
        },
      ),
    );
  }
}
