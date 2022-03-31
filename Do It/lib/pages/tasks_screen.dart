
import 'package:flutter/material.dart';



class TasksPage extends StatefulWidget {
  const TasksPage({ Key? key }) : super(key: key);

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
  title: Text('Tasks'),
  automaticallyImplyLeading: false,

   ),
    );
  }
}