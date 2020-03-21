import 'package:flutter/material.dart';
import 'package:goal_reminder/models/goal.dart';
import 'package:goal_reminder/models/storage.dart';

class Index extends StatefulWidget {
  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  Goal goal;
  @override
  void initState() {
    super.initState();
    setState(() {
      if (goal == null) {
        goal = new Goal('Write your goal');
      }
    });
  }

  Future<int> createAlertDialog(BuildContext context) {
    TextEditingController customController = TextEditingController();
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Periodicity'),
            content: TextField(
              controller: customController,
            ),
            actions: <Widget>[
              MaterialButton(
                elevation: 5.0,
                child: Text('Submit'),
                onPressed: () {
                  Navigator.of(context)
                      .pop(int.parse(customController.text.toString().trim()));
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Theme.of(context).primaryColor,
        child: Center(
          child: FlatButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)),
            color: Colors.red,
            textColor: Colors.white,
            onPressed: () {
              createAlertDialog(context).then((onValue) {
                setState(() {});
              });
            },
            child: Text(
              "Change",
              style: TextStyle(fontSize: 15.0, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
