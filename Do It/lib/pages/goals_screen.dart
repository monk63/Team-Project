import 'dart:io';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:week_9/pages/add_task.dart';
import 'package:week_9/pages/TransfterData.dart';
import 'package:week_9/pages/viewALLGoal.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class _GoalsPageState extends State<GoalsPage> {
  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return MaterialApp(
      title: "Goals",
      theme: ThemeData(
        primaryColor: Colors.greenAccent[700],
      ),
      home: GoalsPage(),
      debugShowCheckedModeBanner: false,
    );
=======
    return Scaffold(
        appBar: AppBar(
          title: Text('Goals'),
             backgroundColor: Color.fromARGB(255, 196, 104, 29), // appbar color.
        foregroundColor: Colors.black, // appbar text color.
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
>>>>>>> 31dc199263032c66284f67f203a863f078570494
  }
}

class GoalsPage extends StatefulWidget {
  @override
  _GoalsPageState createState() => _GoalsPageState();
}

class _GoalsPageState extends State<_GoalsPage> {
  final fb = FirebaseDatabase.instance;
  @override
  Widget build(BuildContext context) {
    final ref = fb.ref().child('Goals');
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigo[900],
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => addGoal(),
            ),
          );
        },
        child: Icon(
          Icons.add,
        ),
      ),
      appBar: AppBar(
        title: Text(
          'Goals',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
        backgroundColor: Colors.indigo[900],
      ),
      body: FirebaseAnimatedList(
        query: ref,
        shrinkWrap: true,
        itemBuilder: (context, snapshot, animation, index) {
          return GestureDetector(
            onTap: () {},
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  tileColor: Colors.indigo[100],
                  trailing: IconButton(
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red[900],
                    ),
                    onPressed: () {
                      ref.child(snapshot.key!).remove();
                    },
                  ),
                  title: Text(
                    snapshot.value.toString(),
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}