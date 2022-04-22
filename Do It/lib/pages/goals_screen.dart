
import 'dart:io';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:week_9/pages/add_task.dart';
import 'package:week_9/pages/TransfterData.dart';

class GoalsPage extends StatefulWidget {
  const GoalsPage({ Key? key }) : super(key: key);

  @override
  State<GoalsPage> createState() => _GoalsPageState();
}

class _GoalsPageState extends State<GoalsPage> {

  @override
   Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
  title: Text('Goals'),
  automaticallyImplyLeading: false,

  ),
   
    body: MaterialButton( 
        height: 40.0, 
        minWidth: 400.0, 
      color: Theme.of(context).primaryColor, 
      textColor: Colors.white, 
      child: new Text("Create New Goal"), 
      onPressed: () => {
        Navigator.push(
                context,
                MaterialPageRoute(builder: (context)=>TransfterData() ),
              ) 
      }, 
      splashColor: Color.fromARGB(255, 50, 21, 153),
    ));
    
  }
}


