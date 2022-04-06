import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class editTask extends StatefulWidget {
 // const addTask({ Key? key }) : super(key: key);
  @override
  State<editTask> createState() => _editTaskState();
}

class _editTaskState extends State<editTask> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

   edittasktofirebase() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    String uid = auth.currentUser!.uid;
    var time = DateTime.now();
    await firestore
        .collection('tasks')
        .doc(uid)
        .collection('mytasks')
        .doc(time.toIso8601String())
        .set({
      'title': titleController.text,
      'description': descriptionController.text,
      'time': time.toIso8601String(),
    });
    
    Fluttertoast.showToast(
        msg: "Task Has Been Edited",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Color.fromARGB(255, 44, 31, 167),
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

  @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
      title: Text('New Task'),
    automaticallyImplyLeading: false,
   ),
      );
    }

}