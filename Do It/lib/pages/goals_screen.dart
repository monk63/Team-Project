import 'dart:io';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:week_9/pages/add_task.dart';
import 'package:week_9/pages/TransfterData.dart';
import 'package:week_9/pages/viewALLGoal.dart';


class GoalsPage extends StatefulWidget {
  const GoalsPage({Key? key}) : super(key: key);

  @override
  State<GoalsPage> createState() => _GoalsPageState();
}

class _GoalsPageState extends State<GoalsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Goals'),
          automaticallyImplyLeading: false,
        ),
        body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                MaterialButton(
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  child: new Text("Create New Goal"),
                  onPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TransfterData()),
                    )
                  },
                  splashColor: Color.fromARGB(255, 50, 21, 153),
                ),
                MaterialButton(
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  child: new Text("See all Currents Goals"),
                  onPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ViewGoals()),
                    )
                  },
                  splashColor: Color.fromARGB(255, 50, 21, 153),
                ),
              ],
            )));
  }
}
