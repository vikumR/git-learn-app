import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:learn_git_app/texts/progressModel.dart';
import 'package:learn_git_app/pages/add_progress_dialog.dart';
import 'package:learn_git_app/pages/progress_present.dart';

class ProgressList extends StatelessWidget {
  List<ProgressModel> pr;
  ProgressPresent progressPresent;

  ProgressList(
    List<ProgressModel> this.pr,
    ProgressPresent this.progressPresent, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: pr == null ? 0 : pr.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Container(
                child: Center(
                  child: Row(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 20.0,
                        backgroundColor: Colors.pink[300],
                        child: Icon(Icons.graphic_eq),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                pr[index].topic,
                                style: TextStyle(
                                    fontSize: 20.0, color: Colors.redAccent),
                              ),
                              SizedBox(height: 5.0),
                              Text(
                                "DATE: " + pr[index].date,
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.blue,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          IconButton(
                            icon: Icon(
                              Icons.edit,
                              color: Colors.yellow[900],
                            ),
                            onPressed: () => edit(pr[index], context),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                            onPressed: () => progressPresent.delete(pr[index]),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0)),
          );
        });
  }

  displayProgress() {
    progressPresent.updateScreen();
  }

  edit(ProgressModel progress, BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) =>
          AddProgressDialog().buildDialog(context, this, true, progress),
    );
  }
}
